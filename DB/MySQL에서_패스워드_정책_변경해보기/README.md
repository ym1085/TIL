# 01. Mysql 패스워드 정책

- Mysql에서 새로운 사용자 추가 시 패스워드 정책 요구 관련 에러 발생
- Mysql 패스워드 정책 변경 방법 기재

## 01-1. mysql 서버 중지

```bash
mysql.server stop
```

## 01-2. 인증절차 제거

```bash
mysql.server start --skip-grant-tables
```

## 01-3. root 계정 접근

```bash
mysql -u root
```

- -u : 클라이언트 ID 기재 (root | ymkim)
- -p : 비밀번호 입력

```bash
mysql -u root
```

```bash
update mysql.user set authentication_string=null where user='root'; 
```

- Mysql 8.1 버전 사용중인 상태
- 8.0 부터 alter user를 이용해 비밀번호를 변경해야 함
- **—skip-grant-tables 옵션으로는 alter user 실행 불가능하기에 NULL로 바꾼다**
- 후에 다음 명령어를 통해 권한 설정

## 권한 변경

```bash
flush privileges
```

## 정책 확인

```bash
show variables like 'validate_password%';
```

## MySQL 재시작 후 비밀번호 변경

```bash
mysql.server restart
```

```bash
mysql -u root
```

- alter user 'root'@'localhost' identified with caching_sha2_password by '변경할 비밀번호';
- alter user 'root'@'localhost' identified with caching_sha2_password by '1234';

## 변경 내용 확인

```bash
mysql -u root -p 
```

- 비밀번호 입력란이 나오면 비밀번호를 입력

# 99. 참고 자료

- [[MySQL] Mac MySQL root 비밀번호 초기화하기](https://velog.io/@sorzzzzy/MySQL-Mac-MySQL-root-비밀번호-초기화하기)
- [[Mysql] 버전 확인하는 방법](https://deeplify.dev/database/troubleshoot/how-to-check-mysql-version)