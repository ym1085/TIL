# ECS Task Network Mode 정리

- ECS Task의 Networking 동작은 Task Definition에 정의된 Network Mode에 따라 달라진다
- Fargate의 ECS Task 기본 네트워킹 동작은 IPv4 private IP가 포함된 ENI(Elastic Network Interface)가 제공된다
- Fargate의 경우 다른 네트워크 모드를 사용하고 싶어도 지원을 하지 않는다

> 컨테이너의 주요 장점은 1개의 호스트에서 여러개의 컨테이너를 올릴 수 있다는 장점을 넘어서  
> 아래와 같은 장점을 가지고 있다

- 격리성
  - 각 컨테이너는 독립된 환경에서 실행되고, 서로 간섭 없음
- 이식성
  - 동일한 컨테이너 이미지를 언제 어디서든 동일하게 실행 가능 (환경 일관성 유지)
- 빠른 배포
  - 컨테이너는 가볍고 빠르게 시작됨, 빠른 배포 및 스케일링 가능
- DevOps 통합
  - CI/CD 파이프라인 + 자동화 배포 구성 가능

## ECS Task Network Mode

| Network mode | Linux containers on EC2 | Windows containers on EC2 |
|--------------|-------------------------|---------------------------|
| awsvpc       | O                       | O                         |
| bridge       | O                       | X                         |
| host         | O                       | X                         |
| none         | O                       | X                         |
| default      | X                       | O                         |

- awsvpc
  - Task에 고유한 ENI와 Private IPv4 주소 할당
  - AWS EC2 인스턴스와 동일한 네트워크 속성 적용
  - Network / ENI 관리 또한 AWS가 관리
  - ECS용 Instance Type에 따른 ENI 할당량 존재
    - 하나의 Instance에 할당 할 수 있는 ECS Task 개수 제한
    - ENI Trunking Mode 사용 -> ENI 한계 확장 가능
- bridge
  - Host <--> Container 사이에서 가상 네트워크 브릿지(virtual ethernet bridge) `docker0` 제공
  - 정적 또는 동적 포트(Port) 매핑을 사용
    - 동적은 Port 지정 안하면 Docker가 Host Port 결정 ( 보안 그룹 Port 범위 문제 )
    - 정적은 사용자가 Port 지정
  - AWS EC2 호스트의 포트 <--> 컨테이너의 포트 매핑
  - 같은 Port 가진 여러개 Container, 1개의 Host에 구동 가능(Container 달라짐)
- host
  - 기본적인 네트워크 모드
  - 컨테이너가 호스트(ex. EC2)의 `네트워크 네임스페이스`를 공유
    - 즉, `컨테이너`는 `호스트`와 `동일한 IP 주소` + `Port`도 직접 공유
  - 장점
    - Host Network Interface 사용, 추가적인 네트워크 오버 헤드 없음
    - 특정 Port를 반드시 사용해야 하거나, 네트워크 성능이 중요한 경우 사용
  - 단점
    - Fargate 지원 안함
    - 컨테이너 포트 포워딩 불가능
    - 즉, Host의 Port를 그대로 따라가야 한다
- none
  - 태스크에 외부 네트워크 연결 없음

## 99. 참고 자료

- [[AWS] AWS ECS - Network Mode](https://cloudest.oopy.io/posting/107)
- [[AWS] ECS 네트워크 모드](https://jmholly.tistory.com/entry/AWS-ECS-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EB%AA%A8%EB%93%9C)
- [[AWS] ECS vs EKS vs Fargate | 한눈에 비교하는 AWS 컨테이너 서비스](https://www.smileshark.kr/post/aws-container-service-ecs-eks-fargate-comparison)
- [[AWS] [따배도] 9-1. 컨테이너간 통신(네트워크) - 이론편](https://www.youtube.com/watch?v=jOX80bXND2w&t=151s)