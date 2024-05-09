# 01. Stream - isPresent() vs ifPresent()

> Java에서의 Stream은 Optional 안의 값이 존재하는지 판단하는 2개의 메서드를 제공한다.  
> isPresent() vs ifPresent() 2가지 메서드를 통해 Optional 안의 값의 존재 여부 판단 후 특정 행위를 수행 할 수 있다.  
>   
> Optional isPresent ifPresent를 사용하면 NullPointerException을 미연에 방지할 수 있으며 보다 안전한 코드 작성이 가능해진다. 우선 isPresent부터 시작해보자 😃

## 왜 사용 해야 하는가?

Optional의 isPresent ifPresent 함수는 Optional 내부에 있는 값의 NULL 체크를 불필요한 로직 없이  
처리 할수 있다는 장점이 있다. 만약 아래와 같은 코드가 있다고 가정을 해보자.

```java
@Test
void is_get_member_test() {
    String memberId = "ymkim";

    Member member = memberRepository.findMemberByMemberId(memberId);
    if (member != null) {
        // 회원이 존재하는 경우 로직 수행
    }
}
```

위와 같이 회원 ID를 기반으로 회원 정보를 가져오고 후에 해당 회원이 존재하는지 확인해야 한다.  
이때 Optional을 사용하지 않으면 직접 NULL 체크에 대한 처리를 수행해야 한다.  
그렇다면 Optional은 어떻게 NULL체크를 수행할 수 있는지 간략히 알아보자.  
방법은 isPresent, ifPresent 순으로 이어진다.

## 01-1. isPresent 메서드

> Optional 내부의 값이 존재하면 true, 아니면 false 반환

```java
// Optional.isPresent 함수
public boolean isPresent() {
    return value != null;
}
```

- Optional 객체가 값을 가지고 있으면 `true`, 그렇지 않다면 `false` 반환한다
- Optional.isPresent 함수의 return 타입은 위와 같이 `boolean` 타입을 반환한다

```java
@Test
void is_optional_is_present_test() {
    String memberId = "ymkim"; // 회원 ID

    Optional<Member> member = memberRepository.findByMemberId(memberId); // 회원 ID 기반 조회
    if (member.isPresent()) {
        log.info("member is present");
    } else {
        log.info("member is not present");
    }
} 
```

- 회원 ID를 기반으로 하여 회원 데이터를 조회한다
- 기존에는 회원이 존재하는지 확인하려면 `member != null` 이러한 로직을 추가했어야 한다
- 하지만 `Optional.isPresent()` 함수를 사용하면 Optional 내에 존재하는 데이터의 NULL 체크가 가능해진다

## 01-2. ifPresent 메서드

> Optional 내부의 값이 존재하면 람다식 함수 로직 수행, 없으면 빠져나간다

```java
/**
* If a value is present, performs the given action with the value,
* otherwise does nothing.
*
* @param action the action to be performed, if a value is present
* @throws NullPointerException if value is present and the given action is
*         {@code null}
*/
public void ifPresent(Consumer<? super T> action) {
    if (value != null) {
        action.accept(value);
    }
}
```

- Optional.ifPresent 함수는 Optional 객체가 값을 가지고 있으면 특정 행위를 수행하고 없으면 아무 행위도 하지 않는다
- return 타입의 경우 `void` 타입으로 선언이 되어있다

```java
// 001. 해당 회원 ID가 존재하는 경우 예외 처리
@Test
void is_optional_if_present_test() {
    String memberId = "ymkim";

    memberRepository.findDuplicateMemberByMemberId(memberId).ifPresent(member -> {
        throw new IllegalStateException("해당 회원이 이미 존재합니다.");
    });
}
```

```java
@Test
void is_optional_if_present_test() {
    String memberId = "ymkim";
    memberRepository.findMemberByMemberId(memberId).ifPresent(member -> {
        if (member.isAdmin()) { // admin?
            member.addAdminPermissions();
        } else {
            member.addDefaultPermissions();
        }
    })
}
```

- `Optional.ifPresent`의 경우 `Optional 객체 안의 값이 존재`하고 `특정 행위`를 해야 하는 경우 사용한다
- Optional.ifPresent는 함수형 인터페이스(람다식)을 기반으로 실행이 된다
- isPresent() 통해 값이 있는지 확인 -> get() 을 통해 값을 꺼낸다
  - ifPresent()는 위와 같은 과정없이 바로 값을 꺼낼 수 있는 함수형 스타일의 작성법으로, 코드가 간결해진다

## 정리: Optional 클래스 메소드 비교

> (핵심) isPresent() : 값의 존재 여부에 따라 분기 처리가 필요한 경우  
> (핵심) ifPresent() : 객체가 값을 포함할때 단일 동작으로 축약되는 경우 사용

| 메소드        | 반환 타입  | 설명 |
|--------------|----------|----------------------------------------------|
| `isPresent()` | `boolean` | `Optional` 객체에 값이 존재하면 `true`를 반환하고, 값이 없으면 `false`를 반환합니다. 주로 값의 존재 여부만을 확인할 때 사용 |
| `ifPresent()` | `void`    | `Optional` 객체에 값이 존재하면 주어진 람다 표현식을 실행하여 값을 사용합니다. 값의 존재 여부와 동시에 특정 동작을 실행할 수 있는 함수형 프로그래밍 방식을 제공 |