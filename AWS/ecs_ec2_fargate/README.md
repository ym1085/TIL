# ECS란 그리고 EC2 vs Fargate 차이는?

> 이번에는 ECS에서 Task 타입으로 EC2 or Fargate를 사용하는 경우에 대해 정리한다.  
> ECS는 AWS에서 제공하는 Elastic Container Service(완전 관리형 컨테이너 오케스트레이션) 서비스이다.

## ECS(Elastic Container Service)?

> 그냥 EC2에 docker 설치해서 구성하면 되는거 아닌가? <- 이렇게 생각 할 수 있다.  
> 하지만 위 방법이 아닌, AWS ECS를 사용하는 이유는 다음과 같다고 생각한다.

- ECS: `AWS에서 제공`하는 `완전 관리형 컨테이너 오케스트레이션 서비스`
- `컨테이너 관리`
  - `AWS 타 서비스와의 연동 가능`(IAM, ELB, ECR.. 등)
  - 컨테이너의 `생성`, `중지`, `관리` 할 수 있게 해주는 컨테이너 관리 서비스
  - 컨테이너의 `배포`, `Auto Scailing`, `로드 밸런싱` 및 관리를 `자동화`
  - AWS에서 제공되는 자동화 배포 파이프라인 구성 가능(Code commit, Code pipeline, Code Deploy..)
- 서비스 스케쥴러 도구(Docker swam, K8s, Nomad)
  - 서비스 스케쥴러란?
    - 클러스터 내의 컴퓨팅 리소스 관리
    - 사용자 APP을 어느 호스트에서 서비스할지 결정하는 S/W
    - 즉, Container를 관리하는 S/W라 이해하면 될 것 같다

## ECS 구성 요소

![20240902_ecs.png](./img/20240902_ecs.png)

> AWS ECS의 구성 요소는 크게 Cluster, Service, Task, Container 로 구성되어있다.  
> 출처 : https://sakyasumedh.medium.com/setup-application-load-balancer-and-point-to-ecs-deploy-to-aws-ecs-fargate-with-load-balancer-4b5f6785e8f

### Cluster

- `클러스터`는 `Docker Container`를 `실행` 시킬 수 있는 `논리적인 공간`
  - `Docker가 설치`된 `인스턴스`에 `Docker Container`가 실행 되는데,
  이러한 `인스턴스`들을 `목적에 맞게 하나로 묶는 단위`를 `클러스터`라 한다
  - `논리적인 공간이`므로, 컨테이너 인스턴스가 없는 `빈 클러스터 생성 가능`
  - `ECS Agent`를 통해 `논리적인 클러스터에 연결` 됨
    - 실제 인스턴스에 ECS Agent 설치 되어 있어야함

### Service

### Task & Task Definition

### Container & Image

## 99. 참고 자료

- [[AWS] ecsworkshop.com](https://ecsworkshop.com/)
- [[AWS] AWS ECS 살펴보기](https://boostbrothers.github.io/technology/2020/01/29/AWS-ECS-%EC%82%B4%ED%8E%B4%EB%B3%B4%EA%B8%B0/)
- [[AWS] Setup Application Load Balancer and Point to ECS — Deploy to AWS ECS Fargate with Load Balancer (Last Part)](https://sakyasumedh.medium.com/setup-application-load-balancer-and-point-to-ecs-deploy-to-aws-ecs-fargate-with-load-balancer-4b5f6785e8f)
