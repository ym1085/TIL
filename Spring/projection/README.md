# Spring Querydsl Projection DTO 조회

대표적으로 사용되는 Querydsl 관련 Projections 종류는 `bean`, `constructor`, `fields`, `@QueryProjection`이 존재한다.  
Projections을 사용하는 이유는 `Querydsl`에서 `DB 쿼리 결과`를 `특정 형태`(DTO 등등..)로 `변환`하기 위해 사용한다.

## Projections.bean

```java
// bean 사용 -> setter + 기본 생성자 필수 -> Reflection -> 속도 저하 있음
return queryFactory
    .select(Projections.bean(MemberDetailResDto.class, 
        member.id, 
        member.name.as("memberName"))) // 필드명과 DTO Setter로 매핑
    .from(member)
    .fetch();
```

- `Projections.bean`은 `DTO의 setter 기반 동작`
- `DTO 객체`에 `setter와 기본 생성자`가 필수적으로 있어야함
- `Reflection`을 사용하기에 `속도`가 느릴 수 있음
- DTO 필드와 querydsl의 필드명(네이밍)이 다른 경우 값 셋팅 안됨
- 일반적으로 Req, Res 객체는 `불변 객체`를 지향하는게 바람직하기에, 권장하는 패턴이 아님

## Projections.constructor

```java
// 생성자 입력 순서 + 타입으로 매핑, 실수 발생 가능
return queryFactory
    .select(Projections.constructor(MemberDetailResDto.class, 
        member.id, 
        member.name)) // DTO 생성자의 순서와 타입에 따라 매핑
    .from(member)
    .fetch();
```

- `Projections.constructor`은 `DTO의 생성자 기반 동작`
- DTO 필드와 querydsl의 필드명 달라도, 생성자 필드 셋팅 순서로 값을 매핑
- 생성자 셋팅 순서와 타입으로 매핑하기에, 필드가 많은 경우 사용자 실수 발생 가능

## Projections.fields

```java
// 필드 + 기본 생성자 필수 -> 속도 가장 빠름
return queryFactory
    .select(Projections.fields(MemberDetailResDto.class, 
        member.id, 
        member.name.as("memberName"))) // 필드명과 DTO 필드로 직접 매핑
    .from(member)
    .fetch();
```

- `Projections.fields`은 `DTO의 필드에 직접 데이터를 넣는다`
- `DTO 객체`에 `필드`와 `기본 생성자`가 필수적으로 있어야함
- `가장 빠른 속도` 반환을 보장한다
- DTO 필드와 querydsl의 필드명(네이밍)이 다른 경우 값 셋팅 안됨

## @QueryProjection

```java
// 컴파일 시점에 안정성 보장, 생성자 일일이 수정해야 하는 부분은 불편한듯
return queryFactory
    .select(new QMemberDetailResDto(member.id, member.name))
    .from(member)
    .fetch();
```

- `불변 객체 선언` + `생성자`를 `그대로 사용 가능`하기에 권장되는 패턴
- DTO의 생성자를 사용하는 것이 아닌, `QDTO 객체의 생성자를 사용`

## 참고 자료

- [[QueryDSL] Projections, @QueryProjection 을 사용하여 DTO로 반환하기](https://jong-bae.tistory.com/63)
- [[Querydsl] Querydsl 프로젝션으로 DTO 조회](https://green-bin.tistory.com/102)