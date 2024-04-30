# 01. **MySQL 계정 권한 관련 이슈**

- Macbook Intel 로컬에 MySQL 설치 후(brew install mysql@8.0) 아래와 같은 계정 이슈 발생
- 요새 로컬에서 작업할 때, Spring Boot 서버를 올리기만해도 MySQL이 종료되는 이슈가 발생하여 다운그레이드를 시도하였다

# 02. **brew를 통해 mysql 버전 다운그레이드**

```bash
youngminkim  /usr/local/var  brew search mysql
==> Formulae
automysqlbackup        mysql++                mysql-client@5.7       mysql-connector-c++    mysql@5.7              mysqltuner
mysql                  mysql-client           mysql-client@8.0       mysql-search-replace   mysql@8.0 ✔            qt-mysql

==> Casks
mysql-connector-python      mysql-shell                 mysqlworkbench              navicat-for-mysql           sqlpro-for-mysql
```

- 현재 설치 가능한 mysql 패키지가 있는지 먼저 확인 해보자
- 이전에는 mysql 패키지를 설치하였으나 현재 오류가 발생하니 8.0 버전을 설치 해보자

```bash
brew install mysql@8.0
```

- mysql 8.0 설치

```bash
brew services start mysql@8.0
```

- 위 명령어를 통해 mysql8.0 버전을 실행 해준다

```bash
youngminkim  /usr/local/var  nag | grep 33
tcp4       0      0  127.0.0.1.3306         *.*                    LISTEN
tcp4       0      0  127.0.0.1.33060        *.*                    LISTEN
tcp4       0      0  127.0.0.1.63342        *.*                    LISTEN
```

- nag는 alias로 지정된 부분이니 참고 해주세요(netstat -an | grep LISTEN)

```bash
youngminkim  /usr/local/var  ps -ef | grep mysql
  501  6897     1   0  8:39PM ??         0:00.05 /bin/sh /usr/local/opt/mysql@8.0/bin/mysqld_safe --datadir=/usr/local/var/mysql
  501  7001  6897   0  8:39PM ??         0:02.43 /usr/local/opt/mysql@8.0/bin/mysqld --basedir=/usr/local/opt/mysql@8.0 --datadir=/usr/local/var/mysql --plugin-dir=/usr/local/opt/mysql@8.0/lib/plugin --log-error=youngminkimui-MacBookPro.local.err --pid-file=youngminkimui-MacBookPro.local.pid
```

- 현재 프로세스을 확인한 결과 8.0 mysql이 정상적으로 작동하는 것을 볼 수 있다
- Mysql 정상 구동 후 아래와 같은 메시지가 나오는 것을 발견

> 🚨 Access denied for user 'root'@'localhost' (using password: YES)

`root` 사용자가 `localhost`에서 데이터베이스에 접속하려고 했으나 사용된 비밀번호가 잘못되었거나  
해당 사용자에게 `localhost`에서의 접속 권한이 없음을 나타낸다.

> 우선 로컬 DB의 root 비밀번호 초기화 진행 후 다시 접속 해보자

# 03. MySQL 로컬 비밀번호 초기화

```bash
mysql -u root
```

- 우선 위 명령어를 통해 mysql에 비밀번호 없이 접속을 한다

```bash
UPDATE mysql.user SET authentication_string=null WHERE User='root';
```

- 후에 접속이 완료 되었으면 root 계정의 비밀번호를 null로 셋팅한다

```bash
FLUSH PRIVILEGES;
```

- 수정 사항을 FLUSH 하여 반영한다

```bash
exit;
```

- 반영 후 mysql 밖으로 이동

```bash
mysql -u root
```

- mysql 재접속을 진행 한다

```bash
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '1234';
```

- 이제 진짜 MySQL의 비밀번호를 지정한다

```bash
# 권한 적용
FLUSH PRIVILEGES;
```

- 다시 한번 플러싱 수행

> 위와 같은 과정을 거치게 되면 로컬에서 MySQL DB에 접근이 가능해진다

# 99. 참고자료

- [[MySQL] 비밀번호 초기화](https://it-mesung.tistory.com/135)
- [[Mysql] Public key retrieval is not allowed 에러 해결](https://deeplify.dev/database/troubleshoot/public-key-retrieval-is-not-allowed)