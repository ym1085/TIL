# ECS CI/CD 파이프라인 구성기 - Jenkins pipeline을 이용한 ECS 배포

> 이전에 ECS CI/CD Code Series를 통한 Hands on은 진행한 경험이 있다  
> 이번에는 ECS Fargate + Code Commit + Code Deploy + Jenkins를 통한 파이프라인을 구성해보자

## Hands on 실습 환경 구성 및 동작 과정

<img src="./img/jenkins_cicd.png" width="700px" height="300px">

> Hands On 동작 과정은 아래와 같음

1. `Developer`는 `Git Push`를 통해 `Code Commit 리포지토리`에 `Source Push`
2. `Jenkins`는 `CodeCommit Git Credentials`를 이용해 `source code`를 `Clone`
   1. AWS에서 해당 사용자의 HTTPS Git 자격증명 다운 받아야함
3. `Jenkins`는 `source code`를 `docker build` 후 `빌드한 이미지` `ECR`에 `업로드`
4. `Jenkins`는 `AWS CLI` `update-service` 명령어를 통해 `새 배포 수행`
5. ECS 서비스 업데이트를 통해 Fargate 배포 수행

### Hands On 순서

1. Dockerfile 생성
2. CodeCommit에 소스 코드 Push
3. Jenkins 서버 환경 구성
4. Jenkins 환경변수(ENV) 등록
5. Jenkins용 IAM Role 생성
6. Jenkins Pipeline 설정

### ✅ 1. Dockerfile 생성

### ✅ 2. CodeCommit에 소스 코드 Push

### ✅ 3. Jenkins 서버 환경 구성

### ✅ 4. Jenkins 환경변수(ENV) 등록

### ✅ 5. Jenkins용 IAM Role 생성

### ✅ 6. Jenkins Pipeline 설정

## 99. 참고 자료

- [[CI/CD] [Hands On] CI/CD – Jenkins pipeline을 이용한 ECS 배포](https://tech.cloud.nongshim.co.kr/2021/08/30/hands-on-ci-cd-jenkins-pipeline%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-ecs-%EB%B0%B0%ED%8F%AC/)
