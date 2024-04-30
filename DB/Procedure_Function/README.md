# Section 01

---

### 저장 프로시저 (Stored Procedure)

- SP는 `리턴값이 있을수도 없을수도` 있다 (IN 또는 OUT)
- SP는 `리턴값`이 `여러개` 있을 수 있다 (OUT 여러개)
- `서버`에서 `실행`이되기 때문에 `속도가 빠르다`
- CALL 프로시저명() 또는 EXECUTE 프로시저명()

### 함수 (Function)

- `리턴값`이 `필수`이다
- `클라이언트`에서 `실행`이되기 때문에 `프로시저보다는 느리다`
- 호출방법 : SELECT 함수명() FROM DUAL;

### 실행 및 수정 권한 구문

```jsx
// 프로시저 생성 및 수정 권한 주기
GRANT CREATE, ALTER ROUTINE ON DB명.* TO 'user_id';
FLUSH PRIVILEGES;
```

```jsx
// 특정 프로시저 실행 권한 주기
GRANT EXECUTE ON PROCEDURE db_name.procedure_name TO 'user_id'@'host' ;
FLUSH PRIVILEGES;
```

### 프로시저 생성

- **DEFINER**: 접근 권한
- **PROCEDURE** [프로시저이름]
- 매개변수 + 타입
- **SET** 변수설정
    - 기호가 없으면 프로시저 실행이 끝나면 초기화
    - **@** **있으면 프로시저가 끝나도 계속 유지**
- **CONCAT**(): 문자열 합치기
- **PREPARE**: 실행준비 (한번만 해주면 계속 EXECUTE 해줄 수 있음)
- **EXECUTE**: PREPARE 된 것을 실행

### 프로시저의 기본 형태

```sql
CREATE DEFINER=`DB아이디`@`%` PROCEDURE `프로시저명`
BEGIN

  SELECT * 
  FROM 테이블명

END
```

**DB**에 접속하는 **ID명**을 적어준다.  
여기서 ID는 권한이 있는 ID를 적어야 한다.

### 프로시저 인자값 및 파라미터 받을 때

```sql
CREATE DEFINER=`DB아이디`@`%` PROCEDURE `프로시저명`(
    IN 변수명 자료형   // 들어오는 변수
	OUT 변수명 자료형  // 반환 변수
)
BEGIN
    SELECT *
    FROM 테이블명
    WHERE 컬럼명 = 변수명
END
```

받을 **변수명**과 **자료형** (INT, VARCHAR(40) 등)을 입력해준다. 받을때는 **IN** 을 사용

### 프로시저 변수 할당

```sql
CREATE DEFINER=`DB아이디`@`%` PROCEDURE `프로시저명`(
    IN 변수명 자료형
)
BEGIN
    SET @v_code = '123'; // 이 부분에서 서브쿼리 사용 가능
    SELECT *
    FROM 테이블명
    WHERE 컬럼 = 변수명 AND
    	  컬럼 = @v_code
END
```

**변수**를 **할당**할때 바로 값을 적어도 되지만 **서브쿼리**를 사용하여  
@v_code = (select 컬럼명 from 테이블 where 조건...) 등으로 할당 할 수 있다.

### 프로시저 **조건문 사용하기 IF, ELSEIF, OR, AND..**

```sql
CREATE DEFINER=`DB아이디`@`%` PROCEDURE `프로시저명`(
    IN 변수명 자료형
)
BEGIN
    SET @v_code = '123';
    IF @v_code!='' THEN
      SELECT *
      FROM 테이블명
      WHERE 컬럼 = 변수명 AND
    	    컬럼 = @v_code
    END IF;
END

[IF 절]
IF 조건문 OR 조건문 THEN
실행문구
ELSE IF 조건문 THEN
실행문구
END IF;
등의 형태로 쓸 수 있으며
NULL 체크는 IS NOT NULL / IS NULL 을 쓸 수 있다.
같지 않음은 !=와 <> 둘다 가능
```

- 프로시저 생성이 안될땐, 프로시저의 상단에 **DELIMITER ;;** 혹은 **DELIMITER $$** 를 붙여주면 된다

### 프로시저 생성 예제

```sql
CREATE DEFINER='root'@'%' PROCEDURE test_prc(id int(10))
BEGIN
SET @t1 = CONCAT('SELECT * FROM test_', id);
PREPARE s FROM @t1;
EXECUTE s;
END
```

- 이런 식의 프로시저는 테이블이름을 배열 변수에 담아서 **LOOPING** 돌려 한번에 처리 가능

### 프로시저 생성 예제

```sql
CREATE DEFINER='sp_user'@'localhost' PROCEDURE `phoneResvInsert`(
	IN `game_code` VARCHAR(50),
	IN `lang` VARCHAR(50),
	IN `inflow_code` VARCHAR(50),
	IN `phone_num` VARCHAR(50),
	IN `ipaddress` VARCHAR(50),
	IN `device` VARCHAR(50),
	IN `application` VARCHAR(50),
	OUT `returnValue` VARCHAR(50)
)
    COMMENT 'procedure, function'
BEGIN
	DECLARE EXIT HANDLER FOR 1062
	SET returnValue = '-1';
	SET returnValue = '0';

	SET block_encryption_mode = 'aes-256-cbc';
	SELECT SHA2(cipher_passphrase,512) INTO @cipher_passphrase FROM cipher_info;
	SELECT cipher_initvector INTO @cipher_initvector FROM cipher_info;

	START TRANSACTION;
		INSERT INTO advance_marketing_phone (
            game_code
            ,LANGUAGE
            ,inflow_code
            ,secure_phone_num
            ,ipaddress
            ,device
            ,application
            ,regist_date
            ) 
        VALUES (
            game_code
            ,lang
            ,inflow_code
            ,HEX(AES_ENCRYPT(phone_num,@cipher_passphrase,@cipher_initvector))
            ,ipaddress
            ,device
            ,application
            ,SYSDATE()
		);
	COMMIT;
END
```