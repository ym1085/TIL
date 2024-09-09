# ECS CI/CD 파이프라인 구성기

> AWS 테스트 계정에서 IAM, ECS, CI/CD 구성을 차례대로 구성해보자  
> VPC 생성의 경우 [해당 링크](https://github.com/ym1085/TIL-Category/blob/master/AWS/create_vpc_etc/README.md)을 참고 하면된다, 이번에는 CI/CD 테스트이기에 default vpc 사용

## 들어가기에 앞서 특이사항 검토

### Blue/Green 배포를 위해 기존 ELB 설정?

<img src="./img/ecs_nlb_alb.png" width="550px">

```shell
# 검토 내용 : NLB 사용 시 배포 타입 문의
# 가능 여부 : NLB 사용시 CodeDeployDefault.ECSAllAtOnce 옵션만 지원, Canary, Linear를 위해 ALB 사용 필요
# 참고 자료 : https://docs.aws.amazon.com/ko_kr/AmazonECS/latest/developerguide/deployment-type-bluegreen.html
Q. CodeDeploy를 사용하여 ECS Fargate 배포 프로세스를 구성하는 중 문의 사항 존재  
NLB를 사용하는 경우 'CodeDeployDefault.ECSAllAtOnce' 배포 구성만이 지원되는 것으로 파악을 하였는데,  
NLB에서 Canary, Linear 배포 방식을 사용할 수 있는 방법이 존재하는지 검토 요청

A. CodeDeploy서비스를 통해 배포를 진행할 때 NLB를 사용하여 서비스하는 경우  
문서에서 확인하신 것처럼 'CodeDeployDefault.ECSAllAtOnce' 옵션만을 지원한다.  
ECS서비스의 Canary, Linear 배포를 위해서는 ALB를 이용해야함.
```

```shell
# 검토 내용 : 운영중인 ECS의 배포 전략 변경이 가능한지?
# 가능 여부 : 운영중인 ECS의 배포 전략은 변경 불가능
Q. ECS Fargate의 Deployment type 옵션 관련 문의 사항이 있어 문의 사항 존재  
최초 ECS Fargate Service 생성 시 deployment type을 'Rolling Update'로 설정  
한번 배포가 되어 운영중인 ECS Service의 Deployment type을 변경 하는것은 불가능한 것으로 알고 있는데,  
새로운 ECS 서비스를 재생성 하지않고 해당 옵션을 Blue/Green로 변경 할 수 있는 방법이 존재 하는지 검토

A. ECS에서 지원하는 deployment type은 Rolling update, Blue/Green deployment, External 이렇게 세 가지가 존재  
하지만 기존에 생성되어 있는 Service의 deployment type을 변경하는 기능은 현재 ECS에 존재하지 않음.

ECS의 Service를 생성하면 프로비저닝을 위해 AWS CloudFormation이 동작하며 스택이 생성됨  
해당 스택에는 deployment controller가 존재하며 properties으로는 ECS, CODE_DEPLOY, EXTERNAL 이렇게 3개가 존재

하지만 해당 값이 변경되게 되면 새로운 리소스가 기존 리소스를 참조하여 생성되고 기존 리소스는 삭제됨  
이러한 스택의 업데이트 동작 작동 방식은 Replacement  

따라서 ECS deployment controller가 변경되면 CloudFormation 스택 업데이트는 Replacement 방식을 따른다
```

- 현재 ECS A 클러스터는 2개의 ELB(ALB, NLB) 사용중이고, B + C 클러스터는 NLB만 사용중이다
- `ECS Service 배포` 타입을 `Blue/Green`로 설정하는 경우 2개의 ELB 설정이 필요한가?
  - A 클러스터: NLB + ALB 혼합 사용
  - B 클러스터: NLB만 사용
  - C 클러스터: NLB만 사용

## IAM 사용자 생성

<img src="./img/user.png" width="650px">

- AWS 로그인을 위한 사용자 생성
- 비밀번호의 경우 사용자가 다시 재설정 하도록 지정

## IAM 사용자 그룹 생성

<img src="./img/user-group.png" width="650px">

- 위에서 생성한 사용자를, 사용자 권한을 묶기 위해 `test-group` 생성 후 해당 그룹에 넣는다
- 그룹에 넣는 이유는, 그룹별로 권한을 관리하기 위함
- (중요) IAM > 사용자 그룹 > test-group > 권한 Tab 클릭 > 권한 추가 > 인라인 정책 생성

```shell
# 사용자 그룹에 인라인 정책을 추가한다
# 아래와 같이 특정 Role을 Assume 할 수 있는 정책을 추가하여
# Role Base로 AWS 리소스를 사용하도록 권한을 관리한다
# Multi Account인 경우는 다른 AWS Account ID를 지정하겠지만, 현재는 동일한 AWS Account 지정
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "test",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::65xxxxxxxxx:role/test-role"
        }
    ]
}
```

## 역할 생성

<img src="./img/role.png" width="650px">

> test-role이라는 역할 생성

- IAM > 역할 > 역할 생성 > 사용자 지정 신뢰 정책 > JSON 신뢰 정책 추가
- 역할은 기본적으로 AWS 서비스에 Attatch 된다, 사용자 or 사용자 그룹에 직접 Attach 되지는 않음
- 해당 Role을 Assume(임시 권한 부여)를 받기 위해서는, 해당 역할에 `신뢰 정책`이 추가 되어야 함
  - IAM > 역할 > test-role(role 선택) > 신뢰 관계 Tab 확인
- 여기서 중요한 부분은 `보안 주체 추가` 클릭 후 특정 AWS Account를 가진 USER를 지정해야 한다는 점
  - 위와 같이 설정을 해야 특정 사용자가 해당 Role을 Assume 할 수 있음

```shell
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::65xxxxxxxxx:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        }
    ]
}
```

## 실제 IAM USER 로그인

<img src="./img/switch-role.png" width="650px">

> IAM 접속 링크 : https://{aws-account-id}.signin.aws.amazon.com/console

- 위 URL은 IAM > 대시보드 > AWS 계정란을 확인하면 된다
  - 계정 ID: 65xxxxxxxxx
  - 계정 별칭: 별칭은 추가 해주면 됨
  - 이 계정의 IAM 사용자를 위한 로그인 URL: 위에 있는 URL
- 해당 URL을 주소창에 입력 후 IAM 유저 접속 시도
  - 계정ID(12자리) 또는 계정 별칭: 별칭 혹은 AWS Account 입력
  - 사용자 이름: IAM 유저 이름 입력
  - 암호: 암호 입력
  - 로그인 버튼 클릭
  - MFA 코드: 휴대폰에 있는 MFA 코드를 입력한다
- 로그인에 성공 후
  - AWS 메인 화면 > 우측 계정 클릭 > 역할 전환 클릭
  - Account ID: 해당 Role이 존재하는 AWS Account ID 입력
  - IAM Role Name: 해당 AWS Account의 특정 Role 입력
  - Display Name: 아무 이름이나 상관 없음
  - Display Color: 이것도 상관 없음
  - Switch Role 클릭
  - 로그인 성공

> VPC 설정은 이번 장에서는 생략하고 진행

## ECS 클러스터 구성

### 클러스터 생성

<img src="./img/create_ecs_cluster.png" width="450px">

- Elastic Container Service > Create Cluster
  - Cluster name: test-cluster
  - Default namespace - optional: test-cluster-ns
  - Infrastructure: AWS Fargate(Serverless)
  - Monitoring: false
  - Encryption: false
  - Tags: false
  - Create 클릭

### Task Definition 생성

```json
{
    "family": "test-api-td-prod",
    "containerDefinitions": [
        {
            "name": "test-api-server",
            "image": "65xxxxxxxxxx.dkr.ecr.ap-northeast-2.amazonaws.com/test-api-server:1.0.0",
            "cpu": 256,
            "memory": 512,
            "memoryReservation": 512,
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 8080,
                    "protocol": "tcp"
                }
            ],
            "essential": true,
            "environment": [
                {
                    "name": "TZ",
                    "value": "Asia/Seoul"
                },
                {
                    "name": "SPRING_PROFILES_ACTIVE",
                    "value": "production"
                }
            ],
            "mountPoints": [
                {
                    "sourceVolume": "test-shared-volume",
                    "containerPath": "/data/",
                    "readOnly": false
                }
            ],
            "volumesFrom": [],
            "linuxParameters": {
                "capabilities": {
                    "add": [],
                    "drop": []
                }
            },
            "privileged": false,
            "readonlyRootFilesystem": false,
            "pseudoTerminal": false,
            "dockerLabels": {
                "env": "prod",
                "Name": "test-api-server"
            },
            "healthCheck": {
                "command": [
                    "CMD-SHELL",
                    "curl --location --request GET 'http://127.0.0.1:8080/health-check' || exit 1"
                ],
                "interval": 10,
                "timeout": 10,
                "retries": 10
            },
            "systemControls": []
        }
    ],
    "taskRoleArn": "arn:aws:iam::65xxxxxxxxxx:role/ecs-task-role",
    "executionRoleArn": "arn:aws:iam::65xxxxxxxxxx:role/ecs-task-exc-role",
    "networkMode": "awsvpc",
    "volumes": [
        {
            "name": "test-shared-volume",
            "host": {}
        }
    ],
    "requiresCompatibilities": [
        "FARGATE"
    ],
    "cpu": "256",
    "memory": "512",
    "ephemeralStorage": {
        "sizeInGiB": 21
    },
    "runtimePlatform": {
        "operatingSystemFamily": "LINUX"
    }
}
```

- Task Definition > Task 생성(JSON) 기반 > 위 JSON을 통해 TD 생성
- ECR에 이미지를 올리는 것은 나중에 하고, 우선 ECS Service부터 만들어보자
- 그 전에 우선 Service를 생성하기 위해 IAM Role을 만들어야 한다

### IAM Role ecsCodeDeployRole 생성

> ECS Service에서 배포 타입을 Blue/Green로 설정하려면 CodeDeploy 관련 Role이 필요하다  
> 하여 신규 Role을 만들고 해당 Role을 ECS Service 사용 시 사용 해보자

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codedeploy.amazonaws.com",
                    "ecs.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

- IAM > 역할 > 역할 생성 > AWS 서비스
  - 서비스 또는 사용 사례: Code Deploy
  - 사용 사례: CodeDeploy - ECS 후 다음 선택
  - 위와 같이 신뢰할 수 있는 엔터티 선택, 엔터티는 ecs와 codedeploy 지정
- 이렇게 하면 ECS Service 생성 시 해당 권한을 사용할 수 있음

### Target Group & ALB 생성

> 현재는 테스트이기에 Nginx와 같은 웹 서버를 따로 사용하지 않는다,  
> 하여 기존에는 80, 81 과 같은 포트를 사용하지만 지금은 WAS 서버에 바로 TG를 붙힌다

- EC2 > 대상그룹 > 대상 그룹 생성
  - 1번 타겟 그룹 생성
    - 대상 유형 선택: IP 주소(Fargate는 IP 지정)
    - 대상 그룹 이름: test-tg-01
    - 프로토콜:포트: HTTP/8080
    - IP주소 유형: IPv4
    - VPC: default-vpc
    - 프로토콜 버전: HTTP1
    - 상태검사: HTTP
    - 상태검사 경로: /health-check
  - 2번 타겟 그룹 생성
    - 대상 유형 선택: IP 주소(Fargate는 IP 지정)
    - 대상 그룹 이름: test-tg-02
    - 프로토콜:포트: HTTP/8081
    - IP주소 유형: IPv4
    - VPC: default-vpc
    - 프로토콜 버전: HTTP1
    - 상태검사: HTTP
    - 상태검사 경로: /health-check

### ALB 생성

> 2개의 타겟그룹 생성 후 ALB를 생성해보자, 우선 테스트 후 바로 삭제할 것이기에,  
> 여기서는 요금 추적을 위한 Tags나 WAF 등에 설정은 생략 하였다

- EC2 > 로드 밸런서
  - 로드밸런서 생성
  - Application Load Balancer 생성 버튼 클릭
  - 로드밸런서 이름: test-alb
  - 체계
    - 인터넷 경계(public)
    - VPN 환경인 경우 -> NLB를 사용하고 내부 경계로 변경하면 내부에서만 사용 가능
  - 로드 밸런서 IP 주소 유형: IPv4
  - 네트워크 매핑
    - VPC: default-vpc 선택
    - ap-northeast-2a, 2b 선택
  - 보안그룹: default(NLB도 이제는 보안그룹 추가 가능, 생성 후 변경은 못함)
  - 리스너 및 라우팅
    - 1번 옵션
      - 1-1) 프로토콜: HTTP
      - 1-2) 포트: 8080
      - 1-3) 기본 작업: test-tg-01 선택
    - 2번 옵션
      - 2-1) 프로토콜: HTTP
      - 2-2) 포트: 8081
      - 2-3) 기본 작업: test-tg-02 선택
  - 로드밸런서 생성

### ECS Service 생성

> ECS Service에서도 테스트이기에 Service Connect와 같은 부가 옵션은 설정하지 않음

- AWS ECS Container Service > Clusters > test-cluster > Services > Create 선택
  - Environments
    - Compute Options: Launch Type
    - Launch Type: FARGATE
    - Platform Version: 1.4.0
  - Deployment configuration
    - Application Type: Service
    - Task Definition: 이전에 만든 Task 선택
    - Service name: test-service-prod
    - Desired Tasks: 0(ECR 없기에 우선 0로 지정)
    - Deployment Type: Blue/Green
    - Deployment Configuration: CodeDeployDefaults.ECSAllAtOnce
    - Service role for CodeDeploy: ecsCodeDeployRole
  - Service connect
    - 비활성화
  - Service discovery
    - 비활성화
  - Network
    - 여기서는 기본 네트워크 사용
    - public IP는 off로 지정
  - Load balancing
    - Load balncer type: Application Load Balancer
    - Container: test-api-server 8080:8080
    - Application Load Balancer
      - Use an Existing Load Balancer
    - Load Balancer: test-alb
    - Health Check grace period: 200
    - Listeners
      - Use an existing listener: 8080:HTTP
    - Test Listeners
      - Use an existing listener: 8081:HTTP
    - Target Group 1
      - test-tg-01
      - /health-check
      - HTTP
    - Target Group 2
      - test-tg-02
      - /health-check
      - HTTP
    - Create 버튼 클릭

### ECR 업로드를 위해 신규 프로젝트 생성

> 테스트를 위한 신규 프로젝트 생성 후 컨트롤러 + Dockerfile 생성

```java
// Test용 컨트롤러
package com.cicd.api;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class TestController {

    @GetMapping("/health-check")
    public ResponseEntity<?> health() {
        log.info("Test Health check controller!");
        return ResponseEntity.ok("ok");
    }
}
```

```dockerfile
# Test용 Dockerfile
FROM openjdk:17-jdk

ENV APP_HOME=/apps/lib/

WORKDIR $APP_HOME

COPY build/libs/*.jar test-api-server.jar

HEALTHCHECK --interval=10s --timeout=10s CMD curl --location --request GET 'http://127.0.0.1:8080/health-check' || exit1

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=production", "-Xms256m", "-Xmx256m", "-XX:+UseG1GC", "-jar", "test-api-server.jar"]
```

여기서 정말 중요한 부분은 터미널을 통해 ECR에 이미지를 올려야 하기에,  
우선 IAM User의 Access_key, Secret_key를 로컬 터미널에 등록한 후에  
Assume-role을 통해 test-role을 assume받아야 ECR에 업로드가 가능하다.

### Code Deploy 배포 그룹 생성

![code_deloy.png](./img/code_deploy.png)

남은 부분은 추후에 Code Commit, Code Pipeline, Jenkins도 같이 해야 하기에 추후 기재 예정

> AppSpec.yml

```yml
version: 0.0
Resources:
  - TargetService:
      Type: AWS::ECS::Service
      Properties:
        TaskDefinition: "arn:aws:ecs:ap-northeast-2:65xxxxxxxxxx:task-definition/test-api-td-prod:1"
        LoadBalancerInfo:
          ContainerName: "test-api-server"
          ContainerPort: 8080
        PlatformVersion: "1.4.0"
        NetworkConfiguration:
          AwsvpcConfiguration:
            Subnets: ["subnet-0xxxxxxxxxx", "subnet-0xxxxxxxxxx"]
            SecurityGroups: ["sg-0xxxxxxxxxx"]
            AssignPublicIp: "DISABLED"
```