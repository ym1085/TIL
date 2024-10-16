# Pod - practice

## 2개의 컨테이너를 가진 1개의 Pod 생성

```yaml
# pod-1 관련 yml 파일
cat <<EOF > pod-1.yml
apiVersion: v1
kind: Pod
metadata:
  name: pod-1
spec:
  containers:
  - name: container1
    image: tmkube/p8000
    ports:
    - containerPort: 8000
  - name: container2
    image: tmkube/p8080
    ports:
    - containerPort: 8080
EOF
```

- vagrant로 구동한 k8s master 노드 접속 후 EOF를 통해 pod-1.yml 파일 생성

```shell
# pod 배포
kubectl apply -f pod-1.yaml
```

```shell
# 8000 포트 확인
[root@k8s-master pods]# curl 20.96.169.132:8000
containerPort : 8000

# 8080 포트 확인
[root@k8s-master pods]# curl 20.96.169.132:8080
containerPort : 8080
```

```shell
# k8s worker-01 / 02 에서 요청 시 모두 정상 통신 가능
# Pod 안에 container들은 하나의 Host로 묶인다고 봐야함
localhost:8000
localhost:8080
```

- pod-1.yml 파일을 k8s 명령어를 통해 구동
- 해당 Pod의 IP는 k8s 클러스터 내에서만 접근 가능, 외부 접근은 Service 생성 필요

## 1개의 Pod에서 중복된 포트를 가진 컨테이너 구동하는 경우?

```yaml
cat <<EOF > pod-2.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-2
spec:
  containers:
  - name: container1
    image: tmkube/p8000
    ports:
    - containerPort: 8000
  - name: container2
    image: tmkube/p8000
    ports:
    - containerPort: 8000
EOF
```

```shell

container2
안
pod-2
events.js:177
      throw er; // Unhandled 'error' event
      ^
Error: listen EADDRINUSE: address already in use :::8000
    at Server.setupListenHandle [as _listen2] (net.js:1226:14)
    at listenInCluster (net.js:1274:12)
    at Server.listen (net.js:1362:7)
    at Object.<anonymous> (/port8000.js:7:3)
    at Module._compile (internal/modules/cjs/loader.js:774:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:785:10)
    at Module.load (internal/modules/cjs/loader.js:641:32)
    at Function.Module._load (internal/modules/cjs/loader.js:556:12)
    at Function.Module.runMain (internal/modules/cjs/loader.js:837:10)
    at internal/main/run_main_module.js:17:11
Emitted 'error' event at:
    at emitErrorNT (net.js:1253:8)
    at processTicksAndRejections (internal/process/task_queues.js:84:9) {
  code: 'EADDRINUSE',
  errno: 'EADDRINUSE',
  syscall: 'listen',
  address: '::',
  port: 8000
}
```

- 1개의 Pod에 동일한 Port를 갖는 컨테이너를 구동하면 Pod가 종료될 수 있음
- 즉, 1개의 Pod 내에서 동일한 PORT는 사용하면 안됨

## Pod 재생성시 IP 변동 확인

```yaml
cat <<EOF > pod-3.yml
apiVersion: v1
kind: ReplicationController
metadata:
  name: replication-1
spec:
  replicas: 1
  selector:
    app: rc
  template:
    metadata:
      name: pod-1
      labels:
        app: rc
    spec:
      containers:
      - name: container
        image: tmkube/init
EOF
```

- Pod를 재기동하는 경우 Pod의 IP가 변경되는지 확인한다
- ReplicationController는 Controller Manager의 가장 기본이 되는 종류 중 하나로
  - 특정 Pod 개수를 유지하게 도와주는 오브젝트
  - 특정 Pod가 죽는 경우 빠르게 재생성 지원

## Pod의 Label 기능 사용 예시

> 여기서는 6개의 파드를 생성한다  
> DEV 3개의 파일을 기반으로 PROD도 동일하게 만든다  
> lo 레이블만 production로 변경

```yaml
# 아래 yml 파일을 통해 6개의 Pod 생성
cat <<EOF > pod-1.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-1
  labels:
    type: web
    lo: dev
spec:
  containers:
  - name: container
    image: tmkube/init
EOF

cat <<EOF > pod-2.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-2
  labels:
    type: db
    lo: dev
spec:
  containers:
  - name: container
    image: tmkube/init
EOF

cat <<EOF > pod-3.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-3
  labels:
    type: server
    lo: dev
spec:
  containers:
  - name: container
    image: tmkube/init
EOF
```

```yaml
# 아래 yml 파일을 통해 6개의 Pod 생성
cat <<EOF > pod-4.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-4
  labels:
    type: web
    lo: production
spec:
  containers:
  - name: container
    image: tmkube/init
EOF

cat <<EOF > pod-5.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-5
  labels:
    type: db
    lo: production
spec:
  containers:
  - name: container
    image: tmkube/init
EOF

cat <<EOF > pod-6.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-6
  labels:
    type: server
    lo: production
spec:
  containers:
  - name: container
    image: tmkube/init
EOF
```

- 위와 같이 6개의 Pod를 개발환경(profile)에 맞춰서 생성
- 이러한 Pod의 외부 통신을 위해 아래와 같이 Service 생성

```yaml
cat <<EOF> service-1.yml
apiVersion: v1
kind: Service
metadata:
  name: svc-1
spec:
  selector:
    type: web
  ports:
    - port: 8080
EOF
```

- 위 서비스를 지정하면 `Label`이 `web`인 파드가 해당 Service에 포함된다
- 다음으로는 `lo`가 `production`인 파드만 포함해보자

```yaml
cat <<EOF> service-2.yml
---
apiVersion: v1
kind: Service
metadata:
  name: svc-1
spec:
  selector:
    lo: production
  ports:
    - port: 8080
EOF
```

- 위와 같이 지정하면 Label이 production인 Pod만 연결된다
- Pod에 Label을 지정하면 목적에 따라 분리가 가능해진다

## k8s 노드에 Pod를 배치하는 방법

> 1. 사용자가 직접 Pod를 특정 노드에 배치 가능  
> 2. k8s에 의해 자동으로 특정 노드에 배치 가능

```yaml
cat <<EOF> pod-1.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-3
spec:
  nodeSelector:
    kubernetes.io/hostname: k8s-node1
  containers:
  - name: container
    image: tmkube/init
EOF
```

- nodeSelector 를 통해 node-01번에 위 pod 구동
- 실제 k8s 대시보드를 보면 node-01에 구동된 것을 확인 가능

```yaml
cat <<EOF> pod-2.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-4
spec:
  containers:
  - name: container
    image: tmkube/init
    resources:
      requests:
        memory: 2Gi
      limits:
        memory: 3Gi
EOF
```

- 위와같이 리소스 제어를 수행하면서 k8s에 의해 Pod 자동 배치 가능