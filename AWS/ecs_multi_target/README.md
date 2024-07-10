# 01. ECS ALB와 NLB 멀티타겟 구성을 위한 스크립트

## 01-1. AWS ECS 클러스터링 구성 중 멀티 타겟 설정이 필요

```shell
# 작업 내용 및 일정
- 일정 : 2023-07-25(화) // 14:00분
- 내용 : 기존 단일 타겟 AWS NLB ECS에 ALB를 매핑하여 멀티 ELB로 구성하기 위한 목적 ALB는 앞단에 위치한 APP(앱) 서버에서 사용
- 작업 : 김영민
```

- 당시에 ECS는 사내망에 위치한 NLB만 사용중이였다
- 검색 앞 단에 위치한 APP 서버에서 public한 요청을 보내기 위해 ALB 추가(attach)
- 추가적으로 WAF, ACM을 붙히기 위해 사용 + 보안 그룹도 당시에는 NLB에 추가 못했음(NLB 현재는 보안 그룹 추가 가능)

## 01-2. 타겟 그룹 2개 지정(ALB::TG, NLB::TG) -> deploy 용으로 사용

```shell
# ECS Service Update
aws ecs update-service \
--cluster xx-cluster-prod \
--service xx-service-nlb-prod \
--task-definition xx-td-prod:44 \
--desired-count 5 \
--health-check-grace-period-seconds 300 \
--network-configuration "awsvpcConfiguration={subnets=[subnet-xxxxxx,subnet-xxxxxx,subnet-xxxxxx],securityGroups=[sg-xxxxxx]}" \
--load-balancers '[{"targetGroupArn": "arn:aws:elasticloadbalancing:ap-northeast-2:7xxxxxxx:targetgroup/xx-tg-prod/xxxxxx", "containerName": "nginx", "containerPort": 80},{"targetGroupArn": "arn:aws:elasticloadbalancing:ap-northeast-2:7xxxxxxx:targetgroup/xx-tg-prod/xxxxxx", "containerName": "nginx", "containerPort": 80}]'
```

## 01-3. 타겟 그룹 1개 로 롤백(NLB TG) -> 멀티 타겟으로 구성된 ALB를 다시 롤백 시켜서 NLB로만 들어오게 해야하는 경우 사용

```shell
# ECS Service Update
aws ecs update-service \
--cluster xx-cluster-prod \
--service xx-service-nlb-prod \
--task-definition xx-td-prod:43 \
--desired-count 5 \
--health-check-grace-period-seconds 300 \
--network-configuration "awsvpcConfiguration={subnets=[subnet-xxxxxx,subnet-xxxxxx,subnet-xxxxxx],securityGroups=[sg-xxxxxx]}" \
--load-balancers '[{"targetGroupArn": "arn:aws:elasticloadbalancing:ap-northeast-2:xxxxxx:targetgroup/xx-tg-prod/xxxxxx", "containerName": "nginx", "containerPort": 80}]'
```

## 01-4. ECS Service 생성해야 하는 경우 사용

```shell
# ECS Service Created
aws ecs create-service --no-cli-pager \
--cluster xx-cluster-stg \
--service-name xx-service-stg \
--task-definition xx-td-stg \
--desired-count 1 \
--launch-type FARGATE \
--network-configuration "awsvpcConfiguration={subnets=[subnet-xxxxxx],securityGroups=[sg-xxxxxx],assignPublicIp=DISABLED}" \
--load-balancers '[{"targetGroupArn": "arn:aws:elasticloadbalancing:ap-northeast-2:xxxxxx:targetgroup/xx-tg-stg/xxxxxx", "containerName": "nginx", "containerPort": 80}]'
```

## 01-5. SSM Container exec 실패 시

```shell
aws ecs update-service --cluster <클러스터명> --no-cli-pager \
--service <서비스명> \
--enable-execute-command
```