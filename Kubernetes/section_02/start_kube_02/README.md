# Getting started - Kubernetes(2/2)

> 실습은 Oracle VM VirtualBox를 사용하여 진행한다.  
> Vagrant를 통해 2개의 가상 서버를 생성한다.

## Vagrant, Oracle VM VirtualBox 설치

> 자세한 내용은 기재하지 않음

```shell
# Homebrew 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```shell
# Vagrant 설치
brew install vagrant
```

```shell
# Vagrant 버전 확인
vagrant -v
```

> 아래 링크에서 VirtualBox 설치  
> [[VM] VirtualBox Install from Oracle](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0)

```shell
# Vagrantfile 생성
# 필자도 Vagrant는 잘 모름, 테스트를 위해 생성
Vagrant.configure("2") do |config|
    # 공통 설정: VM의 기본 메모리 및 CPU 리소스를 증가시켜 성능 향상
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"   # 2GB 메모리 할당
      vb.cpus = 2          # CPU 2개 할당
    end
  
    # A 서버 (Node.js 설치 및 구동)
    config.vm.define "A_server" do |node|
      node.vm.box = "ubuntu/bionic64"  # Ubuntu 18.04 (bionic) 사용
      node.vm.hostname = "A-server"    # 호스트네임 설정
      node.vm.network "forwarded_port", guest: 3000, host: 3000  # 포트 포워딩 (3000번 포트)
  
      # A 서버 Node.js와 npm 설치 (APT 캐시 업데이트, 설치 병렬화)
      node.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update -y && sudo apt-get install -y --no-install-recommends nodejs npm
        node -v && npm -v  # Node.js 및 npm 버전 확인
      SHELL
    end
  
    # B 서버 (Docker 및 Kubernetes 설치)
    config.vm.define "B_server" do |kube|
      kube.vm.box = "ubuntu/bionic64"  # Ubuntu 18.04 (bionic) 사용
      kube.vm.hostname = "B-server"    # 호스트네임 설정
      kube.vm.network "private_network", type: "dhcp"  # DHCP로 IP 자동 할당
      kube.vm.network "forwarded_port", guest: 3000, host: 3001  # 포트 포워딩 (3000번 포트)
  
      # B 서버 Docker와 Kubernetes 설치 (APT 캐시 업데이트, 설치 병렬화)
      kube.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update -y
        sudo apt-get install -y --no-install-recommends docker.io kubeadm kubectl kubelet
        sudo systemctl enable --now docker  # Docker 서비스 시작 및 부팅 시 자동 시작
      SHELL
    end
  end
```

```shell
# A 서버 접속
vagrant ssh A_server

# B 서버 접속
vagrant ssh B_server
```

## Linux A 서버에서 node.js 실행

```js
var http = require('http');
var content = function(req, resp) {
 resp.end("Hello Kubernetes!" + "\n");
 resp.writeHead(200);
}
var w = http.createServer(content);
w.listen(3000);
```

1. 간단한 Hello World를 출력하는 node.js APP
2. node 명령어를 통해 실행 해보자

```shell
# hello.js 파일 실행
node hello.js
```

```shell
# 브라우저 접속
curl http://localhost:3000
```

## Linux B 서버 - Docker 기반 node.js 실행

```shell
# B 서버 접속
vagrant ssh B_server
```

```shell
# hello.js 파일 생성
vi hello.js
```

```js
// hello.js 파일 내용
var http = require('http');
var content = function(req, resp) {
 resp.end("Hello Kubernetes!" + "\n");
 resp.writeHead(200);
}
var w = http.createServer(content);
w.listen(3001);
```

현재 B서버에는 Docker와 K8s만 설치되어 있고 node.js는 설치되어 있지 않다.  
그렇기에 node hello.js를 실행해도 실행이 불가능하다.

이번에는 Dockerfile을 만들고 해당 Dockerfile을 기반으로 node.js 컨테이너를 실행 해본다.

```shell
# Dockerfile 파일 생성
vi Dockerfile
```

```Dockerfile
# https://hub.docker.com/_/node
# 베이스 이미지
FROM node:slim

# 포트 노출
EXPOSE 3001

# 파일 복사
COPY hello.js .

# 컨테이너 구동 후 실행할 명령어
CMD ["node", "hello.js"]
```

```shell
# docker build -t <이미지이름> <Dockerfile 경로>
$ docker build -t node-test .

Sending build context to Docker daemon   16.9kB
Step 1/4 : FROM node:slim
slim: Pulling from library/node
302e3ee49805: Pull complete 
f09acf3eb611: Pull complete 
41ec6ae33593: Pull complete 
e1068effa50f: Pull complete 
0255ce87cb40: Pull complete 
Digest: sha256:6e6df5c992a4b2ca100d9f99f2fff6e1bc7a978c60c39630a2390adbbc7b332b
Status: Downloaded newer image for node:slim
 ---> 173b45636487
Step 2/4 : EXPOSE 8000
 ---> Running in 8067b6e63805
Removing intermediate container 8067b6e63805
 ---> 5821e4462d47
Step 3/4 : COPY hello.js .
 ---> 72aaef1f301e
Step 4/4 : CMD node hello.js
 ---> Running in 4b21993c3e26
Removing intermediate container 4b21993c3e26
 ---> 264376d6e4e9
Successfully built 264376d6e4e9
Successfully tagged node-test:latest
```

- Dockerfile 기반 node.js docker image build 진행
- Dockerfile 기반 빌드 > 이미지 생성 > 이미지 기반 컨테이너 구동 진행

```shell
# docker 실행 명령어
docker run -d -p 3001:3001 node-test
```

```shell
# Docker Hub에 로그인
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: youngmin1085
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

```shell
# Docker Hub에 이미지 업로드
docker tag node-test youngmin1085/node-test:1.0
docker push youngmin1085/node-test:1.0
```

## Linux B 서버 - Kubernetes 클러스터 생성

### Kubernetes 대시보드 구성

> ⁉️ 실제 운영 환경에서는 k8s 보안을 위해 대시보드 사용은 안하는 것이 좋다.  
> 대시보드 관련 내용은 다음 [링크](https://curiousjinan.tistory.com/entry/mac-kubernetes-setup/)를 참고하자.

### hello-pod.yaml 생성

```yaml
# hello-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: hello-pod
  labels:
    app: hello
spec:
  containers:
  - name: hello
    image: youngmin1085/node-test:1.0
    ports:
    - containerPort: 3001
```

우선 Docker Hub에 업로드한 이미지를 기반으로 node.js Pod를 생성한다.  
후에 외부 통신을 위해 hello-service.yaml 파일을 생성한다.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: hello-service
spec:
  selector:
    app: hello
  ports:
  - port: 3001
    targetPort: 3001
  externalIPs:
  - 192.168.0.30
```

## 99. 참고 자료

- [[Kubernetes] KUBETM BLOG](https://kubetm.github.io/k8s/03-beginner-basic-resource/service/)
- [[Kubernetes] Kubernetes Official Document](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [[Kubernetes] Kubernetes 대시보드 구성](https://curiousjinan.tistory.com/entry/mac-kubernetes-setup/)
- [[VM] VirtualBox Install from Oracle](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0)
