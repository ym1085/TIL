# 01. WITH 절이란?

- `임시 테이블` 혹은 `가상 테이블`의 개념이며 `임시 테이블을 만드는 방법`이다
- `반복되는 서브 쿼리(SubQuery) 블록`을 `하나의 WITH절 블록으로 만들어 사용`
    - 즉, 반복적으로 사용되는 서브쿼리 혹은 그냥 쿼리가 있는 경우 사용
- 사용 목적은 무엇인가?
    - WITH절을 사용하는 이유는 `반복적으로 여러곳에서 사용`이되는 `공통적인 부분`이 있는 `서브쿼리`를 `임시테이블`에 담아 사용하고 `성능`을 높히기 위해 사용이 되는 목적을 가지고 있다
- VIEW와 비슷하지만 차이점은 아래와 같음
    - `VIEW`는 `CREATE로 생성`하여 `DROP 전`까지 `없어지지 않고` 모든 테이블에서 사용이 가능
    - 또한 VIEW는 쿼리 결과를 테이블에 저장하는게 아니라, 그냥 별칭만 해준다고 한다
    - WITH절의 경우 한번 실행할 `쿼리문 내 정의`하여 해당 `쿼리 안에서만 실행`된다

# 02. WITH 사용 예시

```sql
-- WITH 절 생성
WITH EMP_WITH AS (
    SELECT deptNo, SUM(sal) AS sal
    FROM emp
    GROUP BY deptNo
)

-- WITH 절 사용
SELECT a.deptNo, b.name, c.sal
FROM EMP_WITH a, dept b
WHERE a.deptNo = b.deptNo;
```

- 위와 같이 **서브 쿼리**를 WITH 절 안에 넣어서 테이블처럼 사용 가능하다.
    - 즉, 서브쿼리의 결과를 해당 테이블 안에 넣어둔다
    - 서브쿼리를 통해 가공된 데이터가 EMP_WITH에 들어가 있음
- **WITH** 이하에는 임의의 테이블명[EMP_WITH]을 지정할 수 있고
- AS 이하에는 사용할 쿼리[SELECT ~]를 입력한다
- **여러번 반복되는 서브쿼리를 WITH절로 사용하면 쿼리 성능 최적화 가능**
    - 코드의 중복 제거 가능
    - 쿼리 가독성의 향상

# **99. 참고 자료**

- [[MYSQL] With 절 사용 방법](https://dbaant.tistory.com/22)
- [[SQL] WITH 절이란?](https://cheershennah.tistory.com/203)
- [[MYSQL] 📚 WITH (임시 테이블 생성)](https://inpa.tistory.com/entry/MYSQL-📚-WITH-임시-테이블)