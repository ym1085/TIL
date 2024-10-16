# Service - ClusterIP, NodePort, LoadBalancer

k8s의 Service 종류로는 ClusterIP, NodePort, LoadBalancer가 존재한다.  
ClusterIP의 경우 k8s 내부 통신만 지원하며, NodePort는 외부 IP+Port로 통신하고,  
LoadBalancer의 경우 벤더사(AWS, GCP, Azure)의 LB를 사용하여 외부 통신을 수행한다.

또한 Service는 k8s의 기본 오브젝트로써 수신한 트래픽을 여러 파드로 로드밸런싱(부하 분산) 하는 기능을 제공한다.  
ClusterIP는 k8s(클러스터) 내부에서만 사용 가능한 가상 IP를 가진 엔드포인트를 제공하는 LB를 구성(L4).  
NodePort는 외부 클라이언트가 서비스를 통해서 클러스터 내부의 파드로 접속할 때 사용 가능하다(L7)

## k8s Service - ClusterIP?

> ClusterIP는 k8s 내부에서의 통신만 지원, 외부(external) 통신은 지원안함

- `Service`는 기본적으로 `자기 자신만`의 `ClusterIP`를 가지고 있다
- 위 `Service`를 `Pod`에 `연결`해두면, `Service`를 통해 `Pod에 접근`이 `가능`해진다
- 하지만 Pod에도 IP가 존재하는데 왜 굳이 Service를 달아서 접근 해야 하는가?
  - Pod라는 존재는 k8s에서 언제든지 죽을 수 있음
  - Pod가 죽으면 재생성되고, IP는 다시 할당됨, 신뢰성이 떨어짐
- 이에 반해서 Service는 사용자가 지우지 않는 이상 삭제/중지되지 않음
  - 이를 통해 Service IP로 접근하게 되면 항상 연결되어 있는 Pod에 접근 가능
- `ClusterIP 방식?`
  - k8s 클러스터 내부에서만 접근 가능, 외부에서는 접근 불가능
  - 1개 이상의 Pod를 연결할 수 있으며, Service에 의해 트래픽 분배

```yaml
# Service 생성
---
apiVersion: v1 # k8s api version
kind: Service # kind of object resource
metadata:
  name: svc-1 # metadata
spec:
  selector:
    app: pod # label
  ports:
    - port: 9000 # Service의 노출 포트
      targetPort: 8080 # pod의 내부 포트
  type: ClusterIP # default가 ClusterIP
```

- `Service`의 `type 옵션`은 `default`가 `ClusterIP`이다
- port: Service의 외부 노출 포트 의미
- targetPort: Pod의 내부 포트 의미

```yaml
# Pod 생성
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-1
  labels:
    app: pod
spec:
  containers:
  - name: pod-1
    image: tmkube/app
    ports:
    - containerPort: 8080
```

## k8s Service - NodePort?

## 99. 참고 자료

- [[kubernetes]서비스 타입 비교(ClusterIP/NodePort/LoadBalancer)](https://kim-dragon.tistory.com/52)
- [[Kubernetes] Service (ClusterIP & NodePort) 이해하기](https://kim-dragon.tistory.com/52)