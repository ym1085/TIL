# 01. Stream - findAny() vs findFirst()

> Java의 Stream에서 특정 조건에 만족하는 원소(element) 1개를 찾을 때, findAny() 또는 findFirst()를 사용할 수 있다  
> findFirst()의 경우 조건에 만족하는 원소 중에서 가장 첫번째에 위치한 원소를 반환하는 반면 findAny()의 경우에는  
> 원소의 위치 및 순서에 상관없이 조건에 만족하는 녀석을 반환하는 특징이 있다.

## 01-1. findFirst()

`Java8 stream API`

```java
package com.test;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class Test {

    public static void main(String[] args) {
        // List 방 생성
        List<String> elements = Arrays.asList("a", "b", "c", "d", "e", "b1", "c1");
        
        // b로 시작하는 원소를 반환
        Optional<String> findFirst = elements.stream()
                .filter(Objects::nonNull)
                .filter(element -> element.startsWith("b"))
                .findFirst();
        
        // findFirst에 일치하는 데이터가 없는 경우 => findFirst => Optional.empty
        // System.out.println("findFirst => " + findFirst);

        // b 출력, 값이 없으면 .get() 오류 나기에 orElse("")로 변경
        // System.out.println("findFirst => " + findFirst.get());
        System.out.println("findFirst => " + findFirst.orElse(""));
    }
}
```

- findFirst()의 경우 stream.filter()에서 `조건에 만족하는 원소 중 가장 1번째 위치한 원소를 Optional 형태로 반환`한다
- 만약 `조건에 일치하는 원소가 없는 경우에는 빈 Optional 객체를`를 반환 한다

## 01-2. findAny()

```java
package com.test;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class Test {

    public static void main(String[] args) {
        List<String> elements = Arrays.asList("aaaa", "b", "a1", "a2", "a4", "b1", "c1", "a5");
        Optional<String> findFirst = elements.stream()
                .filter(Objects::nonNull)
//                .filter(element -> element.startsWith("b"))
                .filter(element -> element.startsWith("a"))
                .findAny();

        System.out.println("findFirst => " + findFirst);
        System.out.println("findFirst => " + findFirst.orElse(""));
    }
}
```

- findAny()도 findFirst()와 마찬가지로 `조건에 맞는 원소 1개를 추출하는 것은 동일`하다
- findAny()도 조건에 일치하는 원소가 없는 경우 빈 Optional 객체를 반환 한다
- 대부분 첫번째 요소를 가져오지만 보장하지는 않는다고 한다
  - [java stream의 findAny와 findFirst의 차이점](https://rudaks.tistory.com/entry/java-stream%EC%9D%98-findAny%EC%99%80-findFirst%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90)

## 01-3. findFirst() vs findAny()

- Java Stream을 `병렬`이 아닌 `직렬`로 처리하는 경우 findFirst(), findAny()의 결과는 동일할 것이다
- 하지만 `직렬`이 아닌 `병렬`로 처리하는 경우에는 말이 달라진다
  - findFirst() `병렬` 처리 -> 여러 요소가 조건에 부합하여도 첫 번째 조건에 맞는 원소 반환 보장
  - findAny() `병렬` 처리 -> <u>**가장 먼저 찾은 원소를 반환한다**</u>

## findFirst()를 병렬 처리 예시

```java
package com.test;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class Test {

    public static void main(String[] args) {
        List<String> elements = Arrays.asList("ccsfafwq", "b", "a1", "a2", "a4", "b1", "c1", "a5");
        Optional<String> findFirst = elements.stream()
                .parallel()
                .filter(Objects::nonNull)
                .filter(element -> element.startsWith("c"))
                .findFirst();

        System.out.println("findFirst => " + findFirst);
        System.out.println("findFirst => " + findFirst.orElse(""));
    }
}
```

> 순서 보장이 필요한 경우 사용

- parallel() 을 통해 병렬 처리를 수행 한다
- parallel() 추가하였지만 여전히 결과는 아래와 같이 출력이 된다

```java
findFirst => Optional[ccsfafwq]
findFirst => ccsfafwq
```

## findAny() 병렬 처리 예시

```java
package com.test;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class Test {

    public static void main(String[] args) {
        List<String> elements = Arrays.asList("a", "a1", "b", "b1", "c", "c1");

        Optional<String> anyElement = elements.stream()
                .parallel()
                .filter(s -> s.startsWith("b"))
                .findAny();

        System.out.println("findAny: " + anyElement.get());
    }
}
```

> 순서 보장 필요 없고, 최대 성능으로 원소 찾아야 하는 경우 사용

- findAny()를 병렬 처리로 처리하게 되면 순서 보장이 안된다는 이슈가 존재한다
- 즉, 순서가 그렇게 중요하지 않고 Stream 내에서 특정 원소를 빠르게 찾아야 하는 경우 사용하면 될 것 같다
- 원래 return 값이 계속 변한다고 하는데 필자가 테스트 해본 결과 b1이 계속 출력되는 것으로 확인 하였다
  - (위 부분은 환경마다 상이할거라 예상이 되어 신경 안쓰는걸로)

## 99. 참고 자료

- [[JAVA] Stream - findAny()와 findFirst()의 차이점](https://devjjsjjj.tistory.com/entry/Java-Stream-findAny%EC%99%80-findFirst%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90)
- [Java 8 스트림 findFirst() 대 findAny()](https://www.baeldung.com/java-stream-findfirst-vs-findany)
- [https://has3ong.github.io/programming/java-streamintro3/](https://has3ong.github.io/programming/java-streamintro3)