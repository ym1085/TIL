# Why Kubernetes?

> 왜 쿠버네티스를 사용해야 하는가?  
> 이번에는 쿠버네티스가 서비스 운영에서 어떤 부분을 자동화해주는지 알아본다

### 왜 Kubernetes를 사용해야 하는가?

`Kubernetes`는 `컨테이너화`된 `애플리케이션`의 `배포`, `확장`, `관리`를 `자동화`하는 `오픈소스 플랫폼`이다  
`Google`에 의해 `개발`되었으며, `클라우드 환경`에서 `애플리케이션`을 `효율적`으로 `운영`하도록 `설계`되었다.

`Kubernetes`는 `복잡한 컨테이너 관리`를 `추상화` 및 `자동화` 함으로써 `개발자`와 `운영자`는,  
`인프라`에 대한 `걱정`보다 `애플리케이션 레벨에 좀 더 집중` 할 수 있다.

`Kubernetes`는 `컨테이너 배치`, `스케일링` 및 `네트워킹 관리` 등을 `지원`한다.  
또한 이를 통해 `고가용성`, `확장성`, `장애복구`와 같은 `기능`을 지원한다.

> 🔥 Kubernetes를 사용하는 대표적인 이유는 아래와 같다

1. ✅ 컨테이너화된 애플리케이션 배포(Deployment)
   1. 컨테이너로 패키징된 애플리케이션을 여러대의 컴퓨터에 쉽게 배포 가능
2. ✅ 고가용성(High Availability)
   1. 애플리케이션을 여러 서버에 복제하고, 하나의 서버에 장애 발생해도 시스템 동작 가능
3. ✅ 자동 스케일링(Auto Scailing)
   1. 애플리케이션 부하에 따라 자동 확장/축소 가능
4. ✅ 장애복구(Self-healing)
   1. 애플리케이션 문제 발생 시 자동 롤백 지원
5. ✅ 자동 컨테이너 배치(Automatic container placement)
   1. CPU/MEM 기반 적절한 노드에 컨테이너 자동 배치를 통해 비용 절감 가능
6. ✅ Service Discovery 및 LB(Service Discovery and LB)
   1. 각 컨테이너에 고유 IP 부여 + DNS 통해 서비스 간 통신 간소화
   2. 트래픽 증가 시 LB를 통해 안정적 서비스 운영 지원
7. ✅ 스토리지 오케스트레이션(Storage Orchestration)
   1. 로컬 or 클라우드 기반의 storage 자동 마운트 및 관리 지원

## 대량 트래픽으로 인한 서버 지연?

<img src="./img/서버폭파.png" width="550px">

서버 자원이 안정적일 때 우리는 좋은 서비스를 제공해줄 수 있다.  
하지만 대부분의 사용자는 위 이미지와 같이 지연을 경험한 적이 있을 것이다.

## 일반적인 서버의 처리 방법

<img src="./img/시나리오_01.png" width="700px">

> 리소스 사용량과 별개로 9대의 서버 필요

한 회사에서 3개의 Application을 운영중이며, A, B, C 서비스는 아침, 점심, 저녁에 따라 리소스 사용량이 다르다. 위에서 말했다시피 시간별로 리소스 사용량이 다른데, 사용하지 않는 자원은 잉여 자원이 되어버린다. 이렇듯 일반적인 서버에서는 동적으로 리소스 제어가 불가능하다. 또한 이슈 대응을 위해서 항상 여분의 서버를 준비해 두어야 한다.

> Kubernetes는 어떻게 이러한 문제를 해결할 수 있는가?

## Kubernetes의 트래픽 처리 방법

<img src="./img/kubernetes_서버관리.png" width="700px">

쿠버네티스는 사용하고 있는 리소스 양에 따라서 AG(Auto Scailing Group)과 같은 기술을 통해 리소스를 `동적`으로 `관리`할 수 있다. 또한 이슈 상황에 대비해 여분의 서버를 미리 구비할 필요도 없으며 `Auto Healing` 기능을 통해 장애가 발생한 컨테이너를 자동으로 감지하고 복구할 수 있다.

또한 AG의 종류로는 `HPA`(Horizontal Pod Autoscaler)와 `VPA`(Vertical Pod Autoscaler)가 존재한다.  
`HPA`는 트래픽에 따라 컨테이너를 자동으로 확장 및 축소하는 기능을 제공한다. 이에반해 `VPA`는 컨테이너 리소스 사용량에 따라 컨테이너의 CPU, MEM을 조정하는 기능을 제공한다.

### 업데이트 방식 비교

<img src="./img/업데이트방식.png" width="650px">

- 서비스 중단 허용 되는 경우
  - 모든 서버 내리고, 업데이트 진행
- 서비스 중단 허용 안되는 경우
  - 1대의 서버씩 내리고 -> 업데이트 작업 진행
- `쿠버네티스`
  - `Deployment 오브젝트`를 통해 업데이트 처리

## 99. 참고 자료

- [[Kubernetes] KUBETM BLOG](https://kubetm.github.io/k8s/01-beginner-index/)
- [[F-Lab] 쿠버네티스(Kubernetes)의 기본 개념과 도입 이유](https://f-lab.kr/insight/basic-concepts-and-reasons-for-adopting-kubernetes)
- [[goormblog] {개발자}로 자라기 – 쿠버네티스, 왜 배워야 할까?](https://blog.goorm.io/kdt_kubernetes/)