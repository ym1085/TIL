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

## pssh 사용 예시

### host_cm.txt

```shell
# 검색엔진 ingest node ip
172.21.50.xxx
172.21.60.xxx
172.21.70.xxx
```

### host_d.txt

```shell
# 검색엔진 data node ip
172.21.50.xxx
172.21.60.xxx
172.21.70.xxx
```

### start_all.sh

```shell
#!/bin/bash
echo -e '검색 엔진 전체 구동 시작'
sleep 2
echo

# 키 경로
PEM_KEY_PATH="<PEM 키 FULL PATH 파일 경로>"
echo -e "PEM_KEY_PATH: $PEM_KEY_PATH"

# cordi 서버 실행 (apps 경로)
echo "cordi 검색엔진 노드 시작..."
pssh -h <호스트 FULL PATH 파일 경로> -l ec2-user -x "-i $PEM_KEY_PATH" -i "<ES 실행 shell script 경로>"

# master 서버 실행 (apps-m 경로)
echo "master 검색엔진 노드 시작..."
pssh -h <호스트 FULL PATH 파일 경로> -l ec2-user -x "-i $PEM_KEY_PATH" -i "<ES 실행 shell script 경로>"

# cordi 및 master 서버에서 Elasticsearch 구동 확인
echo "Elasticsearch 실행 확인 중 (cordi/master 서버)..."
pssh -h <ES 실행 shell script> -l ec2-user -x "-i $PEM_KEY_PATH" -i '
for i in {1..30}; do
  if curl -s http://localhost:9200 > /dev/null; then
    echo "Elasticsearch가 실행되었습니다."
    exit 0
  else
    echo "Elasticsearch가 아직 실행되지 않았습니다. 대기 중... ($i 초)"
    sleep 1
  fi
done
echo "Elasticsearch가 30초 내에 실행되지 않았습니다. 스크립트를 종료합니다."
exit 1
'

# cordi/master 서버에서 Elasticsearch 구동이 성공했을 경우, data 서버 실행
if [ $? -eq 0 ]; then
  echo "Executing on data servers..."
  pssh -h <ES 실행 shell script> -l ec2-user -x "-i $PEM_KEY_PATH" -i "<ES 실행 shell script>"

  # data 서버에서 Elasticsearch 구동 확인
  echo "Elasticsearch 실행 확인 중 (data 서버)..."
  pssh -h <ES 실행 shell script> -l ec2-user -x "-i $PEM_KEY_PATH" -i '
  for i in {1..30}; do
    if curl -s http://localhost:9200 > /dev/null; then
      echo "데이터 노드 Elasticsearch가 실행되었습니다."
      exit 0
    else
      echo "데이터 노드 Elasticsearch가 아직 실행되지 않았습니다. 대기 중... ($i 초)"
      sleep 1
    fi
  done
  echo "데이터 노드 Elasticsearch가 30초 내에 실행되지 않았습니다. 스크립트를 종료합니다."
  exit 1
  '
else
  echo "cordi/master 서버에서 Elasticsearch 구동 실패. 스크립트를 종료합니다."
  exit 1
fi
```

## 99. 참고 자료

- [[Linux] parallel-ssh(PSSH)에대해 알아보자!](https://blog.embian.com/40)
