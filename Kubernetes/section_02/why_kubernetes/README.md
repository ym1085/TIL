# Why Kubernetes?

> 왜 쿠버네티스를 사용해야 하는가?  
> 이번에는 쿠버네티스가 서비스 운영에서 어떤 부분을 자동화해주는지 알아본다

## 대량 트래픽으로 인한 서버 지연?

<img src="./img/서버폭파.png" width="700px">

서버 자원이 안정적일 때 우리는 좋은 서비스를 제공해줄 수 있다.  
하지만 대부분의 사용자는 위 이미지와 같이 지연을 경험한 적이 있을 것이다.

## 일반적인 서버의 처리 방법

<img src="./img/시나리오_01.png" width="700px">

> 9대의 서버 필요

한 회사에서 3개의 서비스(Application)을 운영중이다.  
A 서비스는 아침에만 점유율이 높고, B 서비스는 정오, C 서비스는 저녁에 점유율이 높다.  
결국 A, B, C 서버의 리소스를 동적으로 조정하지 못한다.

## Kubernetes의 트래픽 처리 방법

<img src="./img/kubernetes_서버관리.png" width="700px">

쿠버네티스는 점유율에 따라 AG(AutoScaling)을 사용하여 서버 자원을 동적으로 관리한다.  
위 사진을 보면 최초 서버는 `4대`이며 AutoScaling을 통해 서버를 관리하고 있다.  

<img src="./img" width="700px">

## 99. 참고 자료

- [[Kubernetes] KUBETM BLOG](https://kubetm.github.io/k8s/03-beginner-basic-resource/service/)