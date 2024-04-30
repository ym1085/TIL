# UNION vs UNION ALL

# 01. UNION이란?

```sql
SELECT A AS one, B AS two 
FROM TABLE_A
UNION (또는 UNION ALL)
SELECT C AS one, D AS two 
FROM TABLE_B
;
```

- **서로 다른 테이블에서 각각의 테이블의 내용을 동일한 컬럼에 담아서 표현하고 싶은 경우 사용이 되는 방식**
- 여러 쿼리문을 합쳐서 하나의 쿼리문으로 만드는 방법
- **중복 데이터**는 **제거**하고 병합
- 중복 데이터 제거하기에 연산이 들어가서 UNION ALL에 비해 느리다

# 02. UNION ALL

```sql
SELECT A AS one, B AS two 
FROM TABLE_A
UNION (또는 UNION ALL)
SELECT C AS one, D AS two 
FROM TABLE_B
;
```

- UNION과 동일하게 여러 쿼리문을 하나의 쿼리로 만드는 방법
- 중복 데이터도 포함해서 병합 한다

# 03. 제약사항

- 두 개의 테이블의 **컬럼 수**, **컬럼 데이터 형식**이 모두 **일치**해야함

# 04. JOIN과 차이점

- JOIN: **새로운 열**로 결합 (수평결합)
- UNION: **새로운** **행**으로 결합 (수직결합)

# 99. 참고 자료

- [UNION 과 UNION ALL 이란](https://silverji.tistory.com/49)