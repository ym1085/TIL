# 01. new ArrayList<>()와 Arrays.asList()와 List.of() 차이

## 01-1. 차이점?

```java
import java.util.ArrayList; // new ArrayList<>()
import java.util.Arrays; // Arrays.asList()
import java.util.List; // List.of()
```

각 클래스에서 제공되는 함수의 `차이점`은 `데이터를 추가 or 삭제 할 수 있냐`에 따라서 달라진다.  
위 패키지에서 제공되는 차이점을 아래 표로 간단히 확인 후 내용 정리를 진행한다.

| 생성 방법          | 원소 추가/삭제 | `set` 사용 가능 |
|---------------------|----------------|-----------------|
| `new ArrayList<>()` | 가능           | 가능            |
| `Arrays.asList()`   | 불가능         | 가능            |
| `List.of()`         | 불가능         | 불가능          |

## 01-1. 자바에서 리스트를 만드는 방법

```java
public static void main(String[] args) {
    // 생성자 방식
    List<Integer> list = new ArrayList<>();
    list.add(1);
    list.add(2);
    list.add(3);

    // Arrays 클래스의 asList 함수
    List<Integer> list2 = Arrays.asList(1,2,3);

    // List 인터페이스 of 함수(jdk 9)
    List<Integer> list3 = List.of(1,2,3);
}
```

자바에서 `List`를 `만드는 방법`은 총 3가지 정도가 존재한다고 보면 될 것 같다.  
생성자 기반 생성(`new ArrayList`), Arrays 클래스의 `Arrays.asList()` 그리고 List 인터페이스의 `List.of()` 함수가 존재한다.  

여기서 `Arrays.asList()` 함수의 경우 `배열`을 `리스트로 변환`하는 함수이고,  
`List.of()` 함수의 경우 `List 인터페이스`의 `default method`인 정적 팩토리 메서드이다.

## 01-2. Arrays.asList와 List.of 차이점과 리스트 변경 가능 여부

> Arrays.asList -> 반만 불변인 리스트 반환  
> List.of -> 완전 불변한 리스트 반환

```java

```

`생성자`로 `리스트를 만드는 것`과 달리 `메서드`로 `리스트를 만드는 경우` 반환하는 리스트는 모두 `불변 리스트`가 된다.  
이렇듯 메서드 기반 불변 리스트로 만드는 경우 `추가/삭제`가 `불가능`해진다.

하지만 Arrays.asList의 경우 `수정`(`set`)은 가능하지만 List.of의 경우 `수정`(`set`)도 허용하지 않는다.  
`List.of`의 경우 `UnsupportedOprationException` 예외 발생.

| 생성 방법          | 원소 추가/삭제 | `set` 사용 가능 |
|---------------------|----------------|-----------------|
| `new ArrayList<>()` | 가능           | 가능            |
| `Arrays.asList()`   | 불가능         | 가능            |
| `List.of()`         | 불가능         | 불가능          |

## 99. 참고 자료

- [Arrays.asList() 와 List.of() 차이 한방 정리](https://inpa.tistory.com/entry/JAVA-%E2%98%95-ArraysasList-%EC%99%80-Listof-%EC%B0%A8%EC%9D%B4-%ED%95%9C%EB%B0%A9-%EC%A0%95%EB%A6%AC)
- [new ArrayList<>()와 Arrays.asList()와 List.of()](https://giron.tistory.com/98)