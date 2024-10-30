# Volume - practice

## emptyDir

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-volume-1
spec:
  containers:
  - name: container1
    image: tmkube/init
    volumeMounts:
    - name: empty-dir
      mountPath: /mount1
  - name: container2
    image: tmkube/init
    volumeMounts:
    - name: empty-dir
      mountPath: /mount2
  volumes:
  - name: empty-dir
    emptyDir: {}
```

우선 신규로 Pod 1개를 생성한 후에, 1번, 2번 컨테이너 내에서 Volume을 공유하는지 확인해야 한다.  
Pod 1번에 접속하여 신규 파일 추가 후 2번 컨테이너에서 mount2 경로를 확인하면 신규 파일이 보인다.  
이렇듯 emptyDir 사용을 통해 1개의 Pod의 N개의 컨테이너 간의 데이터 공유가 가능해진다.

또한 Pod를 중지하고 다시 재생성하는 경우, 기존에 존재하던 데이터는 모두 삭제된다.  
emptyDir은 기본적으로 Pod의 데이터를 기억하지 않기 때문이다.

## hostPath

## PV/PVC