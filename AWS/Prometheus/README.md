# 01. Spring Boot Actuator

> Spring Actuator, Prometheus, Grafana 사용하여 ECS의 메트릭을 수집하기 위해 이번 글을 작성하게 되었다  
> 메트릭을 수집하는 과정은 아래와 같이 진행이 된다

- Spring Boot Actuator ← (Pulling) Prometheus측에서 메트릭 수집 ← Grafana 해당 메트릭 시각화
- Spring Boot Actuator는 스프링부트의 서브 프로젝트
  - 애플리케이션 모니터링 + 관리 가능
  - 메트릭 수집에 Micrometer라는 라이브러리 사용
- 우선 필요한 라이브러리를 아래와 같이 build.gradle에 추가해야 한다

## 01-1. Spring Boot Actuator, Prometheus 의존성 추가

```groovy
implementation 'org.springframework.boot:spring-boot-starter-actuator'
implementation 'io.micrometer:micrometer-registry-prometheus'
//runtimeOnly 'io.micrometer:micrometer-registry-prometheus'
```

- 위와 같이 2개의 라이브러리를 build.gradle에 추가한다
- 후에 Spring Boot class path 경로에 위치한 application.yml 파일을 수정한다

```yaml
# application.yml
...중략

management:
  server:
    port: 10901 # Actuator 엔드포인트 접근 시 사용하는 서버 포트 지정, 서버 포트 10091과 분리
  endpoints:
    web:
      base-path: "/management" # Actuator 엔드포인트 기본 경로 지정
      exposure:
        include: prometheus, health, metrics # 노출하고자 하는 Actuator 엔드포인트 옵션
    enabled-by-default: true #

  endpoint: # 엔드포인트별 개별 설정 지정
    health:
      enabled: true
      show-details: always
    metrics:
      enabled: true

```

- `endpoints`
  - endpoints는 노출하고자 하는 Actuator 엔드포인트 그룹 정의
    - `server`
      - `port`:  Actuator 엔드포인트 접근 시 사용하는 서버 포트
    - `web`
      - `base-path`: 엔드포인트 경로 지정, 기본값은 /management
      - `exposure.include`
        - 노출하고자 하는 Actuator 엔드포인트 그룹 정의
          - `prometheus`: Prometheus 서버용 메트릭 데이터 제공
          - `health`: 애플리케이션 상태 정보 제공
          - `metrics`: 다양한 애플리케이션 메트릭 제공
          - `caches`: 캐시 정보 제공
          - `dump`: JVM 힙 덤프 제공
      - `enabled-by-default`
        - `true`: include 설정이 비어있으면, 모든 엔드포인트 노출
        - `true`: include 설정이 존재하면 해당 엔드포인트만 노출
- `endpoint`: 특정 엔드포인트의 설정을 개별적으로 조정할 때 사용
  - `health`
    - `enabled: true` → 엔드포인트 활성화
    - `show-details: always` → 엔드포인트가 반환하는 정보 상세 수준 결정, 엔드포인트 모든 세부 정보 표시
  - `metric`
    - `enabled: true` → 엔드포인트 활성화
- 현재 필요한 엔드포인트는 `prometheus` 엔드포인트

## 01-2. Spring Actuator의 엔드포인트 경로

> Actuator의 엔드포인트 경로는 아래와 같습니다.  
> 자세한 옵션은 공식 문서나 블로그를 참고해주세요 😀

| Option | Description |
| --- | --- |
| /health | 어플리케이션의 health 상태 요약 |
| /metrics | 어플리케이션의 메트릭스를 자세히 설명, 일반 메트릭스뿐만 아니라 맞춤 메트릭스도 포함 가능 |
| /prometheus | Prometheus 서버와 함께 작동하도록 포맷된 메트릭스를 반환 |
| /threaddump | 기본 JVM의 스레드 정보를 덤프 |
| /auditevents | 사용자 로그인/로그아웃과 같은 보안 감사 관련 이벤트를 나열. 주체(principal)나 유형(type)별로 필터링을 지원 |
| /beans | BeanFactory에 있는 모든 사용 가능한 빈들을 반환. /auditevents와 달리 필터링을 지원하지 않습니다. |
| /env | 현재 환경 속성을 반환. 또한 단일 속성을 검색 가능 |
| /heapdump | 어플리케이션에 사용된 JVM에서 힙 덤프를 생성 후 반환 |
| /info | 일반 정보, 예를 들어 맞춤 데이터, 빌드 정보 또는 최신 커밋에 대한 세부 정보를 반환 |
| /logfile | 어플리케이션 로그 반환 |
| /loggers | 어플리케이션의 로깅 레벨을 조회 및 수정 가능 |
| /scheduledtasks | 어플리케이션 내의 모든 예약된 작업에 대한 세부 정보 제공 |
| /sessions | Spring Session을 사용하는 경우 HTTP 세션을 나열 |
| /shutdown | 어플리케이션의 Graceful shudown 수행 |

# 02. Prometheus

- `Prometheus`는 `SoundCloud`에서 개발한 `오픈소스`
  - `메트릭`을 `수집`하고 `저장`
  - 모니터링 하거나 경고(alert) 할 수 있게 도와줌
- `prometheus`의 `기본 포트`(default port)는 `9090`이다
  - 내부 Private IP 접근만 SG에 등록할거기에, 굳이 다른 포트로 변경하지 않아도 될 듯

> AWS EC2 서버에 현재 Grafana는 설치되어 있는 상황, 이번에는 Prometheus 설치를 위한 설정을 잡아보자

- `대부분 Docker`를 통해 설치하지만, AWS EC2 서버에 `tar 파일을 기반으로 설치`한다 (아래 링크 참조)
  - [다운로드 파일 경로](https://prometheus.io/download)
    - 현재 Amazon EC2의 서버 아키텍처(archi)가 `x86_64`를 사용하기에 `amd64`로 설치 진행
    - [prometheus-2.45.5.linux-amd64.tar.gz](https://github.com/prometheus/prometheus/releases/download/v2.45.5/prometheus-2.45.5.linux-amd64.tar.gz)
  - 설치 관련 참고 자료
    - <https://byeongkwandev.tistory.com/2>
- 위 파일 다운로드 후 Cloud9(bastion host)로 파일업로드 → Cloud9 → Private EC2로 파일 전송
  - tar -xvzf [prometheus-2.45.5.linux-amd64.tar.gz](https://github.com/prometheus/prometheus/releases/download/v2.45.5/prometheus-2.45.5.linux-amd64.tar.gz)
  - /prometheus-2.45.5.linux-amd64
- prometheus.yml 파일 설정

```yaml
# my global config
global:
    scrape_interval: 10s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
    evaluation_interval: 10s # Evaluate rules every 15 seconds. The default is every 1 minute.
    # scrape_timeout is set to the global default (10s).

# Alertmanager configuration
alerting:
    alertmanagers:
    - static_configs:
        - targets:
            # - alertmanager:9093

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
    # - "first_rules.yml"
    # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
    # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
    - job_name: "prometheus"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
        - targets: ["localhost:9090"]

    - job_name: 'ecs-tasks'
      metrics_path: "/management/prometheus"
      scrape_interval: 10s
      file_sd_configs:
        - files:
          - /home/ec2-user/prometheus/targets-stg.json
```

- global.scrape_interval
  - 메트릭 수집 주기
- global.evaluation_interval
  - 메트릭 규칙 평가 주기
- scrape_configs.static_configs.targets
  - 메트릭을 수집할 호스트 정보 명시
  - 만약 스프링부트 APP이 localhost:8080로 돌고 있으면, 그것을 적으면 됨
- scrape_configs.static_configs.metric_path
  - 메트릭 정보의 경로를 명시한다. Actuator를 사용하였으므로, 위와 같이 작성
- target-stg.json 파일은 아래와 같다

```json
[
  {
    "targets": [
      "172.21.50.xx:10xxx",
      "172.21.50.xx:10xxx",
      "172.21.50.xx:10xxx",
      "172.21.50.xx:10xxx"
    ],
    "labels": {
      "job": "ecs-tasks",
      "env": "production",
      "service": "task1"
    }
  },
  {
    "targets": [
      "172.21.60.xx:10xxx",
      "172.21.60.xx:10xxx",
      "172.21.60.xx:10xxx",
      "172.21.60x.xx:10xxx"
    ],
    "labels": {
      "job": "ecs-tasks",
      "env": "production",
      "service": "task2"
    }
  },
  {
    "targets": [
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx"
    ],
    "labels": {
      "job": "ecs-tasks",
      "env": "production",
      "service": "task3"
    }
  },
  {
    "targets": [
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx",
      "172.21.70.xx:10xxx"
    ],
    "labels": {
      "job": "ecs-tasks",
      "env": "production",
      "service": "task4"
    }
  }
  ...중략
]
```

## 02-1. prometheus foreground 실행

```bash
# 프로메테우스 설치 경로 이동
$ cd /home/ec2-user/prometheus

# 실행
$ ./prometheus
```

- 백그라운드 없이 prometheus 실행하는 경우 위와 같이 실행 하면 된다

## 02-2. prometheus background 실행

```bash
nohup ./prometheus --config.file=prometheus.yml > ./logs/prometheus.log 2>&1 &
```

- prometheus 백그라운드 실행 방법
- 로그의 경우 ./logs/prometheus.log 경로에 로그 저장
- 필자는 백그라운드 실행을 위한 shell script를 아래와 같이 작성 하였다

## 02-3. start-prometheus.sh

```bash
#!/bin/bash

# Prometheus 실행 디렉토리 설정
PROMETHEUS_DIR="/home/ec2-user/prometheus"

# Prometheus 설정 파일 경로 설정
CONFIG_FILE="prometheus.yml"

# 로그 파일 경로 설정
LOG_FILE="prometheus.log"

echo '프로메테우스 실행 파일 위치 => ' $PROMETHEUS_DIR
echo '설정 파일 위치 => ' $CONFIG_FILE
echo '로그 파일 위치 => ' $LOG_FILE

# Prometheus 실행
echo "Starting Prometheus..."
nohup $PROMETHEUS_DIR/prometheus --config.file=$PROMETHEUS_DIR/$CONFIG_FILE > $PROMETHEUS_DIR/$LOG_FILE 2>&1 &

echo "Prometheus is running in the background."
```

## 02-4. stop-prometheus.sh

```bash
#/bin/bash

echo 'stop prometheus process'
echo

PGREP_PROCESS=$(pgrep prometheus)
echo 'pgrep proecess =>' $PGREP_PROCESS

kill -9 $PGREP_PROCESS

END_PROCESS=$(pgrep prometheus)
if [ -z "$END_PROCESS" ]; then
  echo '프로세스가 종료 되었습니다.'
  exit 1
fi
```

## 02-5. ECS IP 유동적 변경에 따른 대처 방안

- ECS의 경우 배포(deploy)를 진행하게 되면 사설 IP가 변하게 된다
  - 사설 IP인 이유는 현재 ECS의 Task가 Private Subnet에 위치하기 때문이다
- 그렇기에 이렇게 동적으로 변화되는 ECS의 IP를 Prometheus의 Service Discovery를 사용해 처리해야 할 것으로 보인다
  - 위 내용은 서비스 구성이 완료되면, 추후 기재하도록 하겠다
    - 방안 1: Event Bridge + Lambda 활용
    - 방안 2: Private EC2 서버에 ecs endpoint 추가 + aws ecs cli 활용