# 01. 데이터 삭제

> 아래 작업은 상용이 아닌 LOCAL, DEV 작업에서만 하는게 좋을 것 같다고 생각한다.  
> DEV도 회사에 따라서 중요한 데이터로 사용이되고 있을 수 있기에 조심해서 사용하자.

```sql
DELETE TABLE [테이블명] or TRUNCATE [테이블명] ERROR 1217 (23000): 
Cannot delete or update a parent row: a foreign key constraint fails
```

- 로컬에서 테스트 중 시퀸스(seq)를 1부터 다시 초기화하고, 새로운 데이터를 넣고 있었던 과정
- 로컬이기에 데이터를 밀어버리고 다시 넣으려고 하였으나, A 테이블과 B 테이블이 서로 참조 관계에 있었기에 삭제 불가능
- 이는 MySQL이 `테이블 간 관계가 있는 데이터를 함부로 삭제할 수 없게 안전장치`를 해두었기 때문이다

# 02. 해소 방안

```sql
# 외래키 검사 활성화 or 비활성화
# 0: 비활성화, 1: 활성화 -> 해당 옵션은 웬만하면 건들지 말자
SET foreign_key_checks = 0;

DELETE TABLE [테이블명] or TRUNCATE [테이블명]

SET foreign_key_checks = 1; // 다시 체크 설정
```

- 그럼에도 불구하고 데이터를 삭제한다고 가정하면, 위 명령어를 통해 해소 가능하다
- 위 명령어는 DELETE, TRUNCATE에 국한되지 않고 DROP에서도 사용이 가능하다 한다
- 여튼 DELETE, TRUNCATE, DROP은 조심해야 할 부분이 있으니, 사용할거면 어려번 체크하고 사용하자

# 99. 참고 자료

- [Mysql - foreign key 무시하고 데이터 삭제하기](https://velog.io/@bigbrothershin/Mysql-foreign-key-무시하고-데이터-삭제하기)
- [[MariaDB/Mysql] 제약조건 무시하고 테이블 삭제하기](https://yenbook.tistory.com/39)