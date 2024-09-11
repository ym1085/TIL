# parallel-ssh(PSSH) 사용

> 성능 테스트를 위해 각기 다른 서버에서 똑같은 명령어를 반복해야 하는 경우가 생김  
> EC2에 구동되어 있는 검색엔진 master, cordi, data 노드를 일괄 명령으로 실행시키고 싶었음

## pssh 사용

> pssh를 사용하기 위해서는 서버에 사용할 공개키가 존재하는지 우선 확인 해야 한다.  
> 또한 접속하고 하는 서버와 네트워크 통신이 가능한지도 확인 해야함

### 옵션

```shell
pssh -h <호스트파일> -l <Linux 사용자 이름> -i "<출력할 명령>"
pssh -h hosts.txt -l ec2-user -i "uptime"
```

- `-i:` 명령의 결과를 즉시 출력하여 각 서버의 결과를 실시간으로 확인
- `-x:` ssh 명령어 옵션
- `-h:` 호스트 파일 지정
- `-l:` Linux 사용자 이름 입력
- `-A:` 패스워드 입력
- `-O:` ssh config 명령어 옵션
- `-H:` 목적지 주소 기재

## TODO

## 99. 참고 자료

- [[Linux] parallel-ssh(PSSH)에대해 알아보자!](https://blog.embian.com/40)