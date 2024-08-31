# Docker 명령어 정리

## Docker 실행

```bash
# docker status 확인
sudo systemctl status docker

# docker 시작
sudo /etc/init.d/docker start
```

- 실행 방식은 환경에 따라 상이할 수 있으니 공식 문서를 참고 할 것

## Docker image 관련 명령어

```bash
# 이미지 빌드
docker build -f {Dockerfile명} -t {이미지명:태그명} {Dockerfile 경로 - context}
```

```bash
# 단일 도커 이미지 삭제
docker image rm {이미지 ID or 이름}

# cmd
docker image rm -f my-image:1.0
```

```bash
# 모든 도커 이미지 삭제
docker rmi {옵션} {이미지 ID or 이름}

# cmd: 특정 image force 삭제
docker rmi -f my-image:1.0

# cmd: 모든 로컬 시스템 이미지 삭제
docker rmi $(docker images -q) -f
```

```bash
# 도커 이미지 목록 조회
docker images

# 현재 이미지 목록 확인
docker image ls

# 도커 허브에서 이미지 검색
docker search {이미지 이름]
```

```bash
# 도커 허브에서 이미지 다운
docker image pull {이미지명:태그}
```

```bash
# 실행한 도커 컨테이너를 이미지로 생성
docker container dommit {컨테이너 이름} {커밋 내용}
```

## Docker container 관련 명령어

```bash
# 도커 컨테이너 생성 후 실행
docker run {옵션} --name {컨테이너이름} {이미지 Repsitory} | {이미지 경로}

# 주로 사용하는 생성 후 실행 명령어
docker run -it --name nginx-container:1.0.0 -p {호스트포트}:{컨테이너포트}
```

```bash
# 도커 컨테이너 생성
docker create {옵션} --name {컨테이너이름} {이미지 Repostitory} | {이미지 경로}
```

| 옵션 | 설명 |
| --- | --- |
| -i | 표준 입력(stdin)을 활성화, 보통 이 옵션을 사용하여 Bash 에 명령을 입력한다. |
| -t | TTY 모드(pseudo-TTY)를 사용Bash를 사용하려면 이 옵션을 설정해야 한다. <br> 이 옵션을 설정하지 않으면 명령을 입력할 수는 있지만, Shell이 표시되지 않는다. |
| -d | 데몬 프로세스로 실행(백그라운드)해 프로세스가 끝나도 유지 |
| --name {이름} | 컨테이너 이름 지정 |
| -p | 호스트와 컨테이너의 포트를 연결 - 외부 접근 설정 <br> (도커 컨테이너는 기본적으로 외부에서 접근할 수 없게 구성되어 있다) |
| --rm | 컨테이너가 종료되면{내부에서 돌아가는 작업이 끝나면} 컨테이너를 제거 |
| -v | 호스트와 컨테이너의 디렉토리를 연결(VOLUME) |

```bash
# 컨테이너 이름 변경
docker rename {기존 이름} {변경할 이름}
```

```bash
# 컨테이너 구동 확인
docker ps

# 모든 컨테이너 구동 확인
docker container ps -a
```

```bash
# 컨테이너 삭제
docker rm {컨테이너 ID or 컨테이너 이름}

# 모든 컨테이너 삭제
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f
```

```bash
# 컨테이너 실행, 종료
docker start {이미지 이름:태그}

# 단일 컨테이너 중지
docker stop {컨테이너 ID or 컨테이너 이름}

# 모든 컨테이너 중지
docker stop $(docker ps -aq)
```

```bash
# 실행중인 컨테이너 접속
docker exec -it {컨테이너 ID 또는 컨테이너 이름} /bin/bash

# 실행중인 컨테이너 접속 종료
exit 또는 Ctrl + D
```

## Docker compose 관련 명령어

```bash
# 컴포즈 파일에 정의된 컨테이너들을 빌드 후 포그라운드 실행
docker-compose up

# 컴포즈 파일에 정의된 컨테이너들을 빌드 후 백그라운드 실행
docker-compose up -d
```

```bash
# 컴포즈 파일로 실행된 컨테이너들을 재시작
docker-compose restart

# 컴포즈 파일로 실행된 컨테이너들을 중 해당 컨테이너만 재시작
docker-compose restart {컨테이너 이름 또는 ID} 
```

```bash
# 컴포즈 파일로 실행된 컨테이너들을 종료
docker-compose down

# 컴포즈 파일로 실행된 컨테이너들을 종료 및 볼륨 제거
docker-compose down -v
```

```bash
# 컴포즈 파일로 실행된 컨테이너들을 종료하고 삭제
docker-compose down
```

```bash
# 컴포즈 파일로 실행된 컨테이너들을 확인
docker-compose ps
```

```bash
# 컴포즈 파일에 정의된 컨테이너들을 빌드
docker-compose build

# 컴포즈 파일에 정의된 컨테이너들 중 해당 컨테이너만 빌드
docker-compose build {컨테이너 이름 또는 ID}
```

## 99. 참고 자료

- [[Docker] 도커 명령어 총모음집 (image, container, compose)](https://hstory0208.tistory.com/entry/Docker-도커-명령어-총모음집-image-container-compose)
- [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)