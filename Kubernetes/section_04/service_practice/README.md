# Service - practice

## Sevice - ClusterIP 실습

```yaml
# labels를 app로 가지는 pod 생성
cat <<EOF> pod1.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod1
  labels:
    app: pod
spec:
  nodeSelector:
    kubernetes.io/hostname: k8s-node1
  containers:
  - name: container
    image: tmkube/app
    ports:
    - containerPort: 8080
EOF
```

```yaml
cat <<EOF> service1.yml
---
apiVersion: v1
kind: Service
metadata:
  name: svc1
spec:
  selector:
    app: pod
  ports:
  - port: 9000
    targetPort: 8080
  type: ClusterIP
EOF
```

```shell
$ curl 10.111.115.32:9000/hostname
Hostname : pod1
```

- curl 명령어 통해 9000 포트 통신 확인
- 외부(chrome)에서 ClusterIP에 직접 접근은 불가능

## Service - NodePort 실습

```yaml
# labels를 app로 가지는 pod 생성
cat <<EOF> pod1.yml
---
apiVersion: v1
kind: Pod
metadata:
  name: pod1
  labels:
    app: pod
spec:
  nodeSelector:
    kubernetes.io/hostname: k8s-node1
  containers:
  - name: container
    image: tmkube/app
    ports:
    - containerPort: 8080
EOF
```

```yaml
cat <<EOF> service2.yml
---
apiVersion: v1
kind: Service
metadata:
  name: svc2
spec:
  selector:
    app: pod
  ports:
  - port: 9000
    targetPort: 8080
    nodePort: 30001
  type: NodePort
  externalTrafficPolicy: Local
EOF
```

## Service - LoadBalancer

```yaml
cat <<EOF> lb.yml
---
apiVersion: v1
kind: Service
metadata:
  name: svc3
spec:
  selector:
    app: pod
  ports:
    - port: 9000
      targetPort: 8080
  type: LoadBalancer
EOF
```