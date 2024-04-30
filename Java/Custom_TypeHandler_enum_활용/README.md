# 01. Mybatis Enum DB 저장시 이슈

```java
public enum Role {
	USER("ROLE_USER", "일반 사용자"),
    GUEST("ROLE_GUEST", "손님"),
    ADMIN("ROLE_ADMIN", "관리자"),

	...중략
}
```

- **JPA와 다르게 Mybatis에서는 Enum 타입 자체를 넣어주면 Enum 상수 자체를 DB에 저장**해버린다
- 내가 원했던건 DB에 **ROLE_USER, ROLE_ADMIN**와 같은 값이 들어가기를 원했음
- 물론 Member VO의 role 필드의 자료형 타입을 String으로 하면 잘 들어가겠지만 나는 Role(enum)으로 유지하고 싶었음

# 02. CodeEnum 인터페이스 생성

```java
public interface CodeEnum {
    String getCode();
}
```

- 위 인터페이스는 하위 Enum 객체에서 구현을 하여 getCode() 함수를 오버라이딩 하여 사용한다
- 실제로는 위 함수는 TypeHander<T> 내에서 사용이 된다고 봐도 무방

# 03. Role enum 객체 수정

```java
package com.shoppingmall.constant;

import com.fasterxml.jackson.annotation.JsonValue;
import com.shoppingmall.handler.CodeEnumTypeHandler;
import org.apache.ibatis.type.MappedTypes;

public enum Role implements CodeEnum {
    USER("ROLE_USER", "일반 사용자"),
    GUEST("ROLE_GUEST", "손님"),
    ADMIN("ROLE_ADMIN", "관리자"),
    ;

    private final String code;
    private final String title;

    Role(String code, String title) {
        this.code = code;
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    /**
        @MappedTypes(Role.class)
        -> 해당 함수가 다룰 클래스(Class)를 명시하기 위한 어노테이션
        -> 간단히 말해서 Mybatis에게 TypeHandler가 처리할 Class가 Role 타입을 처리한다고 알려주는 역할의 어노테이션
     */
    @MappedTypes(Role.class)
    public static class TypeHandler extends CodeEnumTypeHandler<Role> {
        public TypeHandler() {
            super(Role.class);
        }
    }

    @Override
    @JsonValue // 자바 객체(Obj) -> Json = 직렬화 하는 경우 사용하는 어노테이션
    public String getCode() {
        return this.code.toUpperCase();
    }
}
```

- CodeEnum을 구현하고 getCode() 함수를 오버라이딩 한다

# 04. CodeEnumTypeHandler 생성

```java
package com.shoppingmall.handler;

import com.shoppingmall.constant.CodeEnum;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeException;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class CodeEnumTypeHandler <E extends Enum<E> & CodeEnum> implements TypeHandler<CodeEnum> {

    private final Class<E> type;

    public CodeEnumTypeHandler(Class<E> type) {
        if (type == null) {
            throw new IllegalArgumentException("Type argument cannot be null!");
        }
        this.type = type;
    }

    @Override
    public void setParameter(PreparedStatement ps, int i, CodeEnum parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getCode());
    }

    @Override
    public CodeEnum getResult(ResultSet rs, String columnName) throws SQLException {
        return getCodeEnum(rs.getString(columnName));
    }

    @Override
    public CodeEnum getResult(ResultSet rs, int columnIndex) throws SQLException {
        return getCodeEnum(rs.getString(columnIndex));
    }

    @Override
    public CodeEnum getResult(CallableStatement cs, int columnIndex) throws SQLException {
        return getCodeEnum(cs.getString(columnIndex));
    }

    private CodeEnum getCodeEnum(String code) {
        try {
            CodeEnum[] enumConstants = (CodeEnum[]) type.getEnumConstants();
            for (CodeEnum codeEnum : enumConstants) {
                if (codeEnum.getCode().equals(code)) {
                    return codeEnum;
                }
            }
            return null;
        } catch (Exception e) {
            throw new TypeException("Can't make enum object '" + type + "'", e);
        }
    }
}
```

- 공통 Enum을 처리하는 위한 **추상 클래스** **CodeEnumTypeHandler**를 생성한다
    - 각각의 생성되는 Enum 객체는 위 추상 클래스를 상속하여 사용한다
    - @MappedTypes(Enum이름.class) 어노테이션을 Enum 안에서 사용
- **setParameter**
    - Role 타입의 객체가 DB의 데이터로 매핑될 때 동작
        - **쉽게 말해 Mybatis의 PrepareStatement + ResultSet 사용 → 값 세팅시 변경된 값을 셋팅**
    - Component ===> DB 요청 과정중
        - DB Query의 i번째 인자 값을 순수한 parameter가 아닌 parameter.getCode()한 값으로 지정
        - getCode() signature는 Role의 @Overide getCode() 함수 사용
- **getResult**
    - `DB의 데이터가 Role 타입의 객체로 매핑될 때(값을 가져올 때) 동작`
    - `해당 값을 우리가 사용하는 Enum Class로 알맞게 변경시켜 줄 함수`

# 99. 참고 자료

- [Spring Boot에서 myBatis의 TypeHandler와 Enum 관리하기](https://www.holaxprogramming.com/2015/11/12/spring-boot-mybatis-typehandler/)
- [[MyBatis] Custom TypeHandler를 사용하여 Enum Type 다루기](https://goodgid.github.io/MyBatis-Handling-TypeHandler-Enum/)
- [[Mybatis] 여러 type의 Enum에 사용할 수 있는 공용 TypeHandler 구현하기](https://velog.io/@lsjbh45/Mybatis-여러-type의-Enum에-사용할-수-있는-공용-TypeHandler-구현하기)
- [mybatis의 custom typehandler 만들기(JAVA Enum 타입)](https://velog.io/@ghk4889/mybatis의-custom-typehandler-만들기JAVA-Enum-타입)