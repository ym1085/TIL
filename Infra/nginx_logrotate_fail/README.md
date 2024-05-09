# 01. 문제 상황 정의

> 상용 배포 운영 중에 갑자기 logrotate가 정상적으로 동작하지 않는 현상 발생  
> 해당 이슈로 인해 수동 logrotate 커멘드를 사용하여 디버깅 한 결과 아래와 같은 ERROR 로그가 남아있는 부분을 확인

```shell
xxx@ip-172-xx-xx-xx:/var/log/nginx# logrotate -f /etc/logrotate.d/nginx
error: Ignoring /etc/logrotate.d/nginx because it is writable by group or others.

xxx@ip-172-xx-xx-xx:/var/log/nginx# logrotate -f /etc/logrotate.conf
error: Ignoring nginx because it is writable by group or others.
```

> (중요 ERROR) error: Ignoring /etc/logrotate.d/nginx because it is writable by group or others.

> 핵심부터 말하자면 logrotate 관련 설정파일에는 그룹 권한이 주어지면 안되는데  
> 현재 설정 파일에 그룹 권한이 들어가 있어서 발생한 것으로 추정이 됨( 100% Fact X )

- 우선 logrotate의 그룹 쓰기 권한 문제를 논의하기 전 위 이슈는 `logrotate`의 `보안 관행`과 관련 있음
- logrotate는 시스템 로그 파일 관리를 담당하는 매우 중요한 도구로, `logrotate 관련 설정 파일은 엄격한 보안 조치 요구함`
- `설정 파일`이 `그룹 쓰기 권한`을 가지게 되면 `logrotate는 이를 문제로 간주한다`
- 그룹 쓰기 권한이 있으면, 해당 그룹에 속한 사용자는 누구든 파일 수정 가능하기 때문이다, 아래 예시를 보자면
  - 악의적으로 파일을 삭제하거나 손상 시킬 수 있음
  - 서버 들어와서 해당 로그를 rotating 해버린다는 등..
    - 이러한 이유로 인해 logrotate 설정 파일에는 그룹 권한을 주면 안된다
- 하여 /etc/logrotate.d/nginx logrotate의 설정 파일 권한을 아래와 같이 변경해야 한다
  - (AS-IS) 664 -> (잘못된 권한) -rw-rw-r--
  - (TO-BE) 644 -> (수정한 권한) -rw-r--r--
- 현재는 서버 상의 /etc/logrotate.d/**`nginx`** 경로에 존재하는 파일 권한을 수정해야 한다
- 필자의 환경은 AWS ECS(Docker)로 배포가 되어 있기에 아래와 같이 Nginx의 Dockerfile을 수정한다

## 01-1. Dockerfile 수정

```shell
# Dockerfile.production (nginx)
# base image 지정
FROM nginx:1.23.2
 
 # work dir 지정
WORKDIR /etc/nginx

# Add logrotate package 패키지 설치 및 업데이트
RUN apt-get update && apt-get install -y --no-install-recommends \
    logrotate \
    cron \
    vim \
    net-tools \
    telnet \
    procps \
    iputils-ping \
    dos2unix

COPY nginx.conf nginx.conf
COPY wait-for-it.sh wait-for-it.sh
COPY nginx /etc/logrotate.d/nginx

# Run dos2unix and convert CRLF to LF file type
RUN dos2unix /etc/logrotate.d/nginx /etc/nginx/wait-for-it.sh \
    && apt-get --purge remove -y dos2unix \
    && apt-get autoremove -y

RUN chmod +x wait-for-it.sh
RUN chmod 755 /var/log/nginx
# (추가된 부분) nginx logrotate 그룹 권한 제거 해야 -> rotate 동작하기에 추가
RUN chmod 644 /etc/logrotate.d/nginx

# Cron job at 02 am, 12 pm
RUN echo "중략" >> /etc/crontab

VOLUME ...중략

HEALTHCHECK --interval=5s --timeout=10s CMD curl --location --request GET 'http://127.0.0.1:80/health-check' || exit 1
EXPOSE 80

CMD ...중략
```

- 위 Dockerfile을 보면 기존에 존재하지 않았던 내용이 추가 되었다
  - RUN chmod 644 /etc/logrotate.d/nginx
  - 해당 파일 권한을 소유자만 읽기(r:4), 쓰기(w:2)가 가능하고 그룹 사용자, 게스트는 읽기만 가능하게 수정한다

## 01-2. ECS 배포 진행

> Dockerfile을 수정하였으니 AWS 상에 해당 패치 버전을 배포  

- STG에 신규 업데이트 된 Dockerfile을 기반으로 배포를 진행한다
- 이제 실제 ECS Fargate의 container에 접근(SSM)하여 파일 상태를 확인해보자

## 01-3. 파일 권한 확인

```shell
# nginx 파일 권한 확인
xx@ip-172-xx-xx-xx:/etc/nginx# ls -l /etc/logrotate.d
total 24
...중략
-rw-r--r-- 1 root root 297 Apr 22 18:33 nginx
-rw-r--r-- 1 root root 145 Oct 14  2019 wtmp
```

- nginx 파일의 파일 권한이 644로 설정 된 것을 확인할 수 있다
- 혹시 파일 권한이 수정이 되지 않은 경우 아래와 같이 폴더 이동 후 chmod 권한을 직접 주면 된다

```shell
# logrotate.d 디렉토리 이동
cd /etc/logrotate.d
```

```shell
# nginx logrotate 설정 파일에 그룹 권한은 빼고 읽기 권한만 준다
chmod 644 nginx 
```

- 혹시 Dockerfile을 수정하였는데도 불구하고 파일 권한이 변경되지 않았으면 644로 변경해야 한다
- AS-IS) rw-rw-r
- TO-BE) rw-r-r

```shell
# logrotate DEBUG + Verbose 옵션
logrotate -v /etc/logrotate.conf
logrotate -vd /etc/logrotate.conf
```

- `v:` verbose 옵션으로 실제 rotate가 처리된 파일 등에 대한 상세 정보 출력
- `d:` dry-run 옵션으로 file을 실제 지우지 않고 작동 과정만 출력하는 옵션

```shell
# logrotate force rotate -> 상용에서는 아래 명령어 절대 하면 안됨, 하더라도 논의 후 진행
logrotate -f /etc/logrotate.d/nginx
logrotate -f /etc/logrotate.conf
```

- `-f:` logrotate 옵션에 상관없이 강제 force rotate를 수행
- 상용에서 위 명령어는 사용하지 말자, rotate가 진행 되면서 서비스 부하로 이어질 수 있음

## 01-4. 결과

> 추후 문제 해결이 완료되면 나머지 내용은 기재하겠다

## 99. 참고

- [Linux logrotate의 log 및 작동하지 않을 때 test 방법](https://jason-heo.github.io/sys/admin/2016/08/30/logrotate-test.html)
- [[logrotate] 정상적으로 rotate되는지 debugging하기](https://blog.leocat.kr/notes/2018/01/30/logrotate-debugging)
- [Permissions of ./fs_overlay/**](https://github.com/SteveLTN/https-portal/issues/265)
- [Wrong permissions for /etc/logrotate.d/roundcubemail](https://github.com/remicollet/remirepo/issues/145)
- [Nginx logrotate후에 로깅이 안되는 문제 (Nginx not logging after](https://hodolman.com/42)
