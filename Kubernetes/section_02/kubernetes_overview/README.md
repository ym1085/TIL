# Kubernetes Overview

## Kubernetes Architecture

<img src="./img/eks_archi_03.png" width="700px">

- 클러스터(Cluster)
  - `1개 이상`의 `노드`로 `구성`된 `논리적인 그룹`
  - `클러스터 내부`는 `Master Node`와 `Data Node`로 구분
    - `Master Node`는 클러스터 전반 `관리` 및 `제어`를 담당
    - `Data Node`는 실제 `Application`이 `호스팅`되는 `물리적 서버 공간`
- 마스터 노드(Master Node)
  - API Server(`클러스터 내 모든 요청 처리르 위한 인터페이스`)
    - `클러스터`와 `외부` 간의 `중앙 제어 인터페이스`이며 `모든 송수신 요청` 처리
    - 클러스터의 모든 구성 요소는 API Server를 통해 통신한다
  - etcd(`클러스터 상태 데이터 저장`)
    - `클러스터 상태 데이터`(`노드 상태`, `설정 정보`)를 `분산 저장`(key-value)하는 `DB`
    - `데이터 일관성`, `HA 보장` + `클러스터 복구`에 `중요한 역할`
  - Sheduler(`리소스 관리 및 파드 배치`)
    - 새로운 파드가 어떤 노드에 배치될지 결정 -> 스케쥴링 작업 수행
    - 각 노드 리소스 상태 파악, 적합한 노드에 Pod 배치
  - Controller(`클러스터 상태 모니터링 및 자동 복구`)
    - 클러스터 상태 지속적인 모니터링
    - 원하는 상태 <--> 실제 상태 일치하도록 관리
    - Pod or Node 문제 발생 -> 자동 복구
- 데이터 노드(Data Node)
  - 노드(Node)
    - 물리적 가상 서버 + 실제 APP 호스팅 공간
    - 각 노드(Node)는 1개 이상의 Pod 구동
  - 파드(Pod)
    - 하나 이상의 컨테이너로 구성, k8s의 최소 실행 단위
    - 실제 애플리케이션이 동작하는 공간
  - Kubelet
    - 각 노드에서 실행되는 에이전트(agent)
    - API Server와 통신하여 노드에서 파드가 정상 실행 되도록 관리
  - Kube-Proxy
    - 클러스터 네트워킹 관리
    - API Server와 통신하여 노드와 파드 간 네트워크 트래픽 라우팅
    - 파드 간 통신 지원

## 쿠버네티스 전반 구성도 확인

<img src="./img/k8s.png" width="750px">

Kubernetes는 `1대의 서버`에는 `Master Node`, `이외 서버`에는 `Data Node`로 구성한다.  
Master노드는 주로 클러스터 전반의 관리 및 제어를 담당하고, Data Node는 실제 서비스가 구동되는 노드이다.  
또한 master노드 + data노드를 클러스터로 구성할 수 있다.

또한 Cluster 안에 namespace 기능을 통해 k8s 오브젝트를 독립된 공간으로 분리한다.  

### ✅ 1. namespace

<img src="./img/k8s_01_ns.png" width="450px">

1. namespace에는 k8s의 최소 배포 단위인 파드(Pod)가 존재
2. 이 `파드`(`Pod`)들의 `외부 연결`이 가능하도록, `IP를 할당`해주는 `서비스`(Service)를 통해 `외부 통신`
   1. ClusterIP: `클러스터 내부 통신`
   2. NodePort: 외부 IP + 포트 통해 접근 가능
   3. LoadBalancer: 클라우드 제공자 로드 밸런서를 통한 외부 접근
3. 하지만 다른 namespace에 있는 파드와의 통신은 불가능

<img src="./img/k8s_04_ns.png" width="450px">

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: rq-1
  namespace: nm-3
spec:
  hard:
    requests.memory: 1Gi
    limits.memory: 1Gi
```

1. ResourceQuota(클러스터 자원 고갈 방지)
   1. `네임스페이스별 총 리소스 사용량` 제한

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: lr-1
spec:
  limits:
  - type: Container
    min:
      memory: 0.1Gi
    max:
      memory: 0.4Gi
    maxLimitRequestRatio:
      memory: 3
    defaultRequest:
      memory: 0.1Gi
    default:
      memory: 0.2Gi
```

1. LimitRange(파드, 컨테이너 리소스 제한)
   1. `네임스페이스`에서 `움직이는` `포드 하나하나`의 `리소스 사용량 제한`

### ✅ 2. 파드(Pod) 관련 내용

<img src="./img/k8s_02_pod.png" width="450px">

1. 이러한 Pod 안에 1개 이상의 컨테이너 동작 가능
2. 컨테이너가 재기동되는 경우를 대비하여 Volume 기능 제공

<img src="./img/k8s_03_configmap_secret.png" width="450px">

1. `Pod 생성` 시 `컨테이너 안`에 `환경 변수 값`을 넣거나 `파일`을 `마운트` 할 수 있음
   1. ConfigMap: 민감하지 않은 정보를 저장하는 오브젝트(환경 변수, 설정 파일)
   2. Secret: 민감한 정보를 저장하는 오브젝트(보안을 위해 암호화된 데이터 다룸)
   3. ConfigMap, Secret는 파일 형태로 컨테이너 특정 경로에 마운트 가능

### ✅ 3. 컨트롤러(Controller)

<img src="./img/controller.png" width="450px">

1. 컨트롤러를 통해 파드(Pod) 관리 가능하며, 각 구성요소는 아래와 같다

### Replication Controller, ReplicaSet

<img src="./img/controller_01.png" width="400px">

> 여기서는 간단히 정리하고 넘어간다.  
> 뒷편에서 자세히 정리한다.

1. Replication Controller, ReplicaSet이 가장 기본이 되는 컨트롤러이다
2. `ReplicaSet`은 `ReplicationController`의 향상된 버전
   1. `지정된 Pod 복제본 수`를 항상 `유지`하고, `실패한 Pod`는 `자동 복구`
   2. 레이블 셀렉터 지원
   3. k8s의 Deployment의 핵심 구성 요소로 사용(ReplicasSet)

- ReplicationController와 ReplicaSet은 가장 기본이 되는 컨트롤러이다
- ReplicationController은 ReplicaSet의 이전 버전으로, 요새는 사용 안하고 ReplicaSet을 주로 사용
- ReplicaSet은 k8s의 핵심 기능인 Deployment와의 통합 지원, ReplicationController는 지원 안함
- 2개다 레이블 셀렉터를 지원하지만, ReplicaSet이 더 많이 지원
- 결론: Pod의 복제본을 관리하기 위한 오브젝트(Object)이다

### Deployment

> ReplicaSet을 관리, Rolling Update, 롤백 등등 제공

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app-container
        image: my-app-image:1.0
        ports:
        - containerPort: 80
```

- `자동 복구`(Self-healing): 문제 생긴 파드 있는 경우 새로운 파드 자동 생성 후 교체
- `자동 롤링 업데이트`: 애플리케이션의 새로운 버전 배포 시, 트래픽 중단 없이 점진적 업데이트
- `스케일링`: 오토스케일링 규칙에 따라 파드 개수 자동 조절
- `롤백`: 문제가 있는 업데이트를 원래 상태 롤백
- `ReplicaSet 관리`: 파드 복제를 통해 APP이 항상 실행중인 상태 유지

### DaemonSet

> 특정 데이터 노드에 특정 Pod가 1:1로 반드시 구동

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: my-daemonset
spec:
  selector:
    matchLabels:
      app: my-daemon
  template:
    metadata:
      labels:
        app: my-daemon
    spec:
      containers:
      - name: my-daemon-container
        image: my-daemon-image:1.0
        ports:
        - containerPort: 8080
```

- 특정 노드마다 동일한 1개의 파드(ex: Filebeat Pod)가 실행되도록 보장하는 리소스
- ex) Fluentd, Filebeat와 같은 로그 수집기는 각 노드에 무조건 1개씩 구동되어야 함

### CronJob

> Linux crontab과 비슷함

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: my-cronjob
spec:
  schedule: "0 3 * * *"  # 매일 오전 3시에 실행
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: my-job
            image: my-job-image:latest
          restartPolicy: OnFailure
```

- k8s에서 정해진 일정에 따라 주기적 작업을 실행하는 리소스
- Linux의 cron과 비슷한 개념으로, 특정 시간에 작업 실행 후 종료 되는 리소스

## 99. 참고 자료

- [[Kubernetes] KUBETM BLOG](https://kubetm.github.io/k8s/03-beginner-basic-resource/service/)
- [[Kubernetes] Namespace, ResourceQuota, LimitRange](https://kimjingo.tistory.com/130)