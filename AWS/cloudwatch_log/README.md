# Cloudwatch Agent를 통한 EC2 로그 수집

> ISMS 심사를 위해 EC2 서버의 보안 취약점 조치를 진행하는 중  
> U-43 로그의 정기적 검토 및 보고를 위해 EC2에서 Cloudwatch로  
> 백업 로그를 저장해야 하는 상황이 존재했다.

## 시스템 레벨 Cloudwatch 구성

시스템 수준 메트릭, 로그는 모니터링 및 로깅 솔루션의 핵심 구성 요소이다.  
EC2 서버 상에 Cloudwatch Agent를 설치하고 보안 조치 관련된 내용을 기재한다.

### 시스템 수준 로그 구성

시스템 수준 로그는 온프레미스나 AWS 상에서 문제를 진단하고 해결하는데 필수적인 로그이며,  
Linux 시스템의 `시스템`, `응용 프로그램`, `보안` 로그는 일반적으로 `/var/log` `디렉토리 밑`에 저장이 된다.

| 페도라 배포 (Amazon Linux, CentOS, Red Hat Enterprise Linux) | 경로 및 설명                |
| ------------------------------------------------------------ | --------------------------- |
| /var/log/boot.log*                                           | 부팅 로그                   |
| /var/log/dmesg                                               | 커널 로그                   |
| /var/log/secure                                              | 보안 및 인증 로그           |
| /var/log/messages                                            | 일반 시스템 로그            |
| /var/log/cron*                                               | Cron 로그                   |
| /var/log/cloud-init-output.log                               | 출력 Userdata 시작 스크립트 |

| Debian (Ubuntu)                | 경로 및 설명                |
| ------------------------------ | --------------------------- |
| /var/log/syslog                | 부팅 로그                   |
| /var/log/cloud-init-output.log | 출력 Userdata 시작 스크립트 |
| /var/log/auth.log              | 보안 및 인증 로그           |
| /var/log/kern.log              | 커널 로그                   |

### syslog 체계

`AmazonLinux2`의 경우 `CentOS 7`과 `호환`되는 OS로 `생성되는 로그`는 `syslog.d`가 아닌 rsyslog.d 데몬에 의해 관리가 된다.  
/etc/rsyslog.conf 파일을 보면 어디에서 메시지가 생성되면, 어디에 메시지를 남겨라 라고 설정이 되어 있다.

| 로그 파일 경로            | 설명                                                                              |
| ------------------------- | --------------------------------------------------------------------------------- |
| /var/log/messages         | 시스템에서 발생하는 거의 모든 표준 메시지가 기록되는 파일로, 대부분의 로그가 저장 |
| /var/log/secure           | 보안 관련 로그 파일. ssh, telnet 등 사용자 접근 정보가 기록                       |
| /var/log/maillog          | 메일 서버 사용 시 메일 송수신 내용이 기록                                         |
| /var/log/cron             | cron이 동작할 때 발생하는 로그가 기록                                             |
| /var/log/boot.log         | 서비스 데몬들의 부팅 관련 정보(시작, 종료, 실패)가 기록                           |
| /var/log/dmesg            | 리눅스 부팅 시의 로그가 기록                                                      |
| /var/log/wtmp             | 최근 접속 사항이 기록됨. `last` 명령어로 내용을 확인할 수 있음                    |
| /var/log/lastlog          | 사용자의 마지막 로그인 내용이 기록됨. `lastlog` 명령어로 확인 가능                |
| xferlog                   | FTP 데몬을 사용하여 파일을 전송한 정보가 기록                                     |
| /var/log/httpd/access_log | Apache 설치 시 생성되는 로그로, 서비스 접근에 대한 정보가 기록                    |
| /var/log/httpd/error_log  | Apache 설치 시 생성되는 로그로, 서비스의 에러 정보가 기록                         |

### EC2에서 사용할 IAM Role 생성

- trusted entity를 EC2로 지정
- CloudwatchAgentServerPolicy, AmazonSSMFullAccess Policy Policy 추가

### syslog를 Cloudwatch Logs로 백업

```shell
# rpm 다운로드
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm 

# rpm 설치
sudo rpm -U /usr/local/share/amazon-cloudwatch-agent.rpm
```

> Cloudwatch Agent 실행 명령어

```shell
# 예시 샘플 로그 저장
sudo echo '{"logs": {"logs_collected": {"files": {"collect_list": [{"file_path": "/var/log/messages","log_group_name": "/var/log/messages"},{"file_path": "/var/log/secure","log_group_name": "/var/log/secure"}]}}}}' > /opt/aws/amazon-cloudwatch-agent/bin/logs.json
```

```shell
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/logs.json -s
```

```shell
# EC2에 IAM Role 적용
```

```shell
로그 보관 주기의 경우 콘솔 상에서 제어 가능
```

## 참고 자료

- [[AWS] 시스템 레벨 CloudWatch 구성](https://docs.aws.amazon.com/ko_kr/prescriptive-guidance/latest/implementing-logging-monitoring-cloudwatch/system-level-cloudwatch-configuration.html)
- [[AWS] amazonlinux2의 로그(/var/log)를 AWS cloudwatch logs로 백업하기](https://kim-dragon.tistory.com/109)
- [[AWS] EC2에 CloudWatch Agent 구성하여 모니터링하는 방법](https://medium.com/@labcloud/ec2%EC%97%90-cloudwatch-agent-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-e7113cdc396e)