### MERGE INTO란?

 > DB 테이블을 다룰 때, 특정 조건의 데이터가 존재하는 경우에는 해당 row를 원하는 값으로 update하고, 없는 경우에는 새로운 데이터를 insert해야 하는 경우에 사용한다. 또한, 정확한 정보는 아니지만 어드민 페이지에서 사용되는 비중이 높다 알고 있다.

### 예제

```sql
MERGE INTO 테이블명
	-- USING DUAL 
	USING ( update나 insert될 데이터 원천, 하나의 테이블만 이용한다면 FROM DUAL사용 )
	ON (UPDATE될 조건, 쿼리의 WHERE이라고 봐도 무방함)

	WHEN MATCHED THEN ( ON에서 조건에 해당하면 실행 될 문 )
		UPDATE SET 컬럼1 = 값1 ( UPDATE문 실행)
	WHEN NOT MATCHED THEN ( ON에서 조건에 해당하지 않으면 실행 될 문 )
		INSERT ( 컬럼 LIST ) VALUE ( VALUE );
```

```sql
MERGE INTO Product pd
USING DUAL
    ON ( pd.PRODUCT_ID = #{productId} )
WHEN MATCHED THEN
    UPDATE SET
        USE_YN = #{useYn}
        ,PRODUCT_NAME = #{productName}
        ,MODIFY_DATE = SYSDATE
WHEN NOT MATCHED THEN
    INSERT 
        (
            PRODUCT_ID
            ,PRODUCT_NAME
            ,USE_YN
            ,MODIFY_DATE
        ) 
	VALUES 
        (
            #{productId}
            ,#{productName}
            ,#{useYn}
            ,SYSDATE
        )
```

**MERGE INTO 테이블명**

- INSERT / UPDATE를 할 테이블

**USING**

- INSERT / UPDATE를 하기 위해 사용되는 또 다른 테이블의 데이터
- MERGE를 사용할 시 위같이 USING절에 테이블을 기입해 데이터로 사용 한다
- SELECT 할때 항시 해당 Table 의 PK전체를 변수로 받아야 한다, null 유의

**ON**

- SELECT문에서 사용되는 WHERE와 동이하다 보면 된다
- ON '조건절'

**WHEN MATCHED THEN**

- ON '조건절'의 결과가 TRUE를 반환하면 실행되는 절
- UPDATE 구문이 오면 된다

**WHEN NOT MATCHED THEN**

- ON '조건절'의 결과가 FALSE를 반환하면 실행되는 절
- INSERT 구문이 오면 된다

### WITH 구문(임시테이블 생성 쿼리)

WITH절은 서브쿼리가 여러 번 다시 사용될 때 편리하게 사용할 수 있다. (성능면에서도 이득이다)  
FROM에서 어떠한 조건을 가진 테이블을 불러올 때, 그 조건을 가진 테이블 자체에 이름을 붙여서,   
별도의 테이블로 인식하게 한다. 또한 WITH는 오라클9이상에서 지원한다.

### 장점

같은 서브쿼리가 여러 번 사용된다면, WITH구문을 사용하는 것이 가독성이 좋다.  
WITH구문이 여러 번 사용될 때 성능적으로도 이득이다.

### 단점

SELECT를 사용할 때는 보기 편한 장점이 있지만 INSERT나 UPDATE, DELETE 처럼 직접 데이터에 변경이 있는 구문에 WITH구문을  
'사용할 수는 있지만' WITH 구문을 통째로 넣어야하기 때문에 비효율적이다. (WITH를 사용하는 의미가 없다.)  
만약 직접 데이터의 변경이 있을 것 같을때는 사용하지 않는 편이 좋다. 나중에 다시 WITH를 제거해야할 때 귀찮음이 있다.

### 사용법

```sql
WITH [WITH절 명칭] AS (SELECT [컬럼명] from [테이블명])
SELECT [컬럼명] FROM [WITH절 명칭]
```

### 예제

```sql
1.사원명, 부서명 조회
/* Sub Query를 이용하는 방법 */
SELECT *
  FROM ( SELECT T1.ENAME
              , T2.DNAME
          FROM EMP T1, DEPT T2
          WHERE T1.DEPTNO = T2.DEPTNO   
        );
        
/* WITH 문을 이용하는 방법 */        
WITH TEMP01 AS
(
    SELECT T1.ENAME
         , T2.DNAME
      FROM EMP T1, DEPT T2
     WHERE T1.DEPTNO = T2.DEPTNO
)
SELECT *
  FROM TEMP01;
```

### 서브쿼리 상황

- 이름이 '조성규'인 사람의 키보다 작은 사람들만 출력
- 주소가 '해병대'인 사람들의 키보다 크거나 같은 경우의 사람들을 모두 출력(ANY)
- 주소가 '해병대'인 사람들의 키보다 크고 같은 경우의 사람들을 모두 출력(ALL)

### 예제

```sql
// 일반 서브쿼리
// 01. 틀린 예제
SELECT *
FROM TEST
WHERE name = '조성규'
AND height < 

// 02. 올바른 예제
SELECT *
FROM TEST
WHERE height < (
        SELECT height
        FROM TEST
        WHERE name = '조성규'
    );
// ANY 사용(OR)
SELECT *
FROM TEST
WHERE height > ANY (
        SELECT height
        FROM TEST
        WHERE name = '조성규'
    )

// ALL 사용(AND)
SELECT *
FROM TEST
WHERE height > ALL (
        SELECT height
        FROM TEST
        WHERE name = '조성규'
    )
```