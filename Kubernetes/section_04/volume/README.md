# Volume - emptyDir, hostPath, PV/PVC

## emptyDir

```yaml
# emptyDir 관련 설정
---
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

emptyDir은 Pod 안의 컨테이너들 간에 데이터를 공유할 때 사용하는 볼륨을 의미한다.  
최초에는 Volume이 비워져있기에 emptyDir라 지칭하며, 각 컨테이너는 해당 볼륨을 로컬 파일처럼  
사용할 수 있다.

> 😨 Volume 데이터는 휘발성이다?

emptyDir의 Volume은 기본적으로 휘발성 데이터로, Pod가 종료되는 경우 모든 데이터가 사라진다.  
하여 emptyDir Volume을 사용하는 경우에는 반드시 임시 데이터를 저장하는 용도로 사용해야 한다.

## hostPath

`hostPath`는 `클러스터 내`에서, `파드`가 올라가있는 `Node`의 `특정 Path`를 `볼륨`으로 `사용`하는 것이다.  
emptyDir과 다른 점은, Node의 특정 경로를 Pod들이 마운트(mount)해서 사용하기에 Pod가 죽어도 데이터는 유지된다.

> 🤔 데이터가 유지된다고 하니 좋아보이지만, 꼭 좋은 것은 아니라고 한다?

만약 Node1에 구동되고 있던 Pod1이 죽게되면 k8s 스케쥴러에 의해 파드가 다시 구동될 것인데,  
Node1 or Node2 중 어떤 Node에 Pod1이 생성될지는 모르는 법이다. 만약 Node1에 구동되고 있던 Pod1이  
Node2에 생성되면 기존 Volume은 사용하지 못하는 상황이 발생한다.

굳이 이러한 부분을 해소하기 위해, 신규 Node가 생길때마다 동일한 마운트 경로(path)를 만들고,  
직접 Node간의 Path를 마운팅 해주는 방법이 있으나, 운영자가 이러한 부분을 수동으로 처리해야 한다.

> 🥲 hostPath는 언제 사용하면 좋을까?

## PV/PVC