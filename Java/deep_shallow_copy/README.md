# 01. 깊은 복사 vs 얕은 복사 차이?

> 👍 이번 시간에는 Java의 깊은 복사 그리고 얕은 복사에 대해 알아보자.

## 01-1. 깊은 복사와 얕은 복사란?

> 얕은 복사와 깊은 복사를 알아야 하는 이유는 primitive type(int, short..)의 경우는 얕은 복사로 사용 가능하지만,  
> reference type(Array, object..)은 깊은 복사를 사용해야 객체의 실제 데이터 저장이 가능하다.

- 깊은 복사: 메모리(memory) 상에 새로운 공간을 할당하고 해당 메모리에 값을 복사하는 것을 의미
- 얕은 복사: 기존 A 객체가 바라보고 있는 메모리(memory)의 주소값(reference value)를 복사하는 것을 의미

> 🤔 그러면 해당 키워드에 대해서는 정리를 했으니 소스 레벨에서 2가지의 차이점을 한번 보자

## 01-2. 얕은 복사

```java
package com.test;

class Person {
    private String name;
    private int age;

    public Person() {
    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}

public class Test {

    public static void main(String[] args) {
        // given
        Person person = new Person("홍길동", 26);
        Person copyPerson = person;

        // when
        copyPerson.setName("김영민");
        copyPerson.setAge(26);

        // then
        System.out.println(person); // Person{name='김영민', age=26}
        System.out.println(copyPerson); // Person{name='김영민', age=26}
    }
}
```

> Java 프로그래밍을 하다보면 배열이나, 컬렉션(List, Set..)을 복사할 일이 자주 발생하는데,  
> 얕은 복사, 깊은 복사에 대한 개념 없이 마구잡이로 복사하지말자... 이슈로 이어질수도 있다.

- `얕은 복사`는 `주소에 의한 참조`, `call by reference`와 유사한 개념을 갖는다
- `복사`하려는 `원본 객체`에 대해서 `새로운 단일 객체`를 만들고 `원본 객체 참조`

위 예시를 보면 현재 name, age를 인스턴스 변수로 가지고 있는 Person 클래스가 존재한다.  
main 함수에서 생성자를 통해 신규 Person 객체를 만들고 후에 copyPerson 변수에 얕은 복사를 하였다.  

기대한 부분은 person 변수는 '홍길동', 26 이라는 값이 나오고, copyPerson 변수는 '김영민', '26'이 나올 것이라 예상하지만  
실제 결과에서는 `2개의 객체 모두 아래와 같이 '김영민', 26이라는 값을 응답`하게 된다.

```java
// 콘솔 결과
Person{name='김영민', age=26}
Person{name='김영민', age=26}

Process finished with exit code 0
```

> ❓ 왜 2개의 객체가 동일한 값을 반환하는 것일까?

2개의 객체가 동일한 값을 반환한 이유는 person 변수의 객체 참조 값을 copyPerson 변수에 얕은 복사 하였기 때문이다.  
아마 실제 메모리 구조 상에서는 다음과 같은 그림으로 생성이 될 것 이다. (같은 메모리 주소 번지 참조)

> 🤔 왜 굳이 얕은 복사를 해야 할까? 그리고 어떠한 경우에 주로 사용할까?

![shallow_deep_copy.png](./img/shallow_deep_copy.png)

만약 객체의 주소값 복사가 아닌 실제 값을 복사하고자 한다면 깊은 복사(deep copy)를 수행해야 한다.  
다음은 깊은 복사에 대해 알아본다.

## 01-3. 깊은 복사

> 깊은 복사(deep copy)란 객체의 주소값이 아닌 새로운 메모리 공간에 값을 복사하여 저장하는 것을 의미한다.  
> 깊은 복사를 구현하는 방법은 대표적으로 3가지 존재한다.

1. `복사 생성자` 또는 `복사 팩토리` 이용하여 복사
2. `직접 객체 생성` 후 `복사`
3. `Clonable 인터페이스` 구현하여 `clone() 함수 오버라이딩` 후 복사

### ✅ 복사 생성자 또는 복사 팩토리 사용

```java
package com.test;

class CopyObject {
    private String name;
    private int age;

    /* NoArgsConstructor */
    public CopyObject() {
    }

    /* 복사 생성자 */
    public CopyObject(CopyObject copyObject) {
        this.name = copyObject.getName();
        this.age = copyObject.getAge();
    }

    /* 복사 팩토리 */
    public static CopyObject copy(CopyObject copyObject) {
        CopyObject copy = new CopyObject(copyObject.getName(), copyObject.getAge()); // 기본 생성자 호출
        return copy;
    }

    /* 생성자 */
    public CopyObject(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

public class Test {

    public static void main(String[] args) {
        CopyObject original = new CopyObject("YM", 30); // 원본
        CopyObject copyConstructor = new CopyObject(original); // 생성자 복사
        CopyObject copyFactory = CopyObject.copy(original); // 팩토리 복사

        System.out.println("[변경 전] original = " + original.getName()); // [변경 전] original = YM
        System.out.println("[변경 전] copyConstructor = " + copyConstructor.getName()); // [변경 전] copyConstructor = YM
        System.out.println("[변경 전] copyFactory = " + copyFactory.getName() + "\n"); // [변경 전] copyFactory = YM

        copyConstructor.setName("KIM");
        copyFactory.setName("JUNE");

        System.out.println("[변경 후] original = " + original.getName()); // [변경 후] original = YM
        System.out.println("[변경 후] copyConstructor = " + copyConstructor.getName()); // [변경 후] copyConstructor = KIM
        System.out.println("[변경 후] copyFactory = " + copyFactory.getName()); // [변경 후] copyFactory = JUNE
    }
}
```

```java
// 콘솔 결과
[변경 전] original = YM
[변경 전] copyConstructor = YM
[변경 전] copyFactory = YM

[변경 후] original = YM
[변경 후] copyConstructor = KIM
[변경 후] copyFactory = JUNE
```

- `복사 생성자` 그리고 `복사 팩토리`는 `깊은 복사`

### ✅ 직접 객체 생성 후 복사

```java
public class Test {

    public static void main(String[] args) {
        CopyObject c1 = new CopyObject("AAA", 40);
        CopyObject c2 = new CopyObject(c1.getName(), c1.getAge());
        c2.setName("변경하지롱");
        c2.setAge(3333);
        //System.out.println(c1);
        //System.out.println(c2);
        System.out.println(c1.getName());
        System.out.println(c2.getName());
    }
}
```

```java
// 콘솔 결과
//com.test.CopyObject@3796751b
//com.test.CopyObject@67b64c45

AAA
변경하지롱
```

- 메모리 주소가 서로 다르며, 데이터도 다름

### ✅ Clonable 인터페이스 구현하여 clone() 함수 오버라이딩 후 복사

- TODO
- TODO

## 99. 참고 자료

- [최블랙의 개발로그 - Java shallow copy와 Deep Copy](https://choiblack.tistory.com/41)
- [java :) 얕은복사와 깊은복사, Arrays.copyOf()와](https://kimeuncheol.tistory.com/98)
- [Java - 깊은 복사(Deep Copy) vs 얕은 복사(Shallow Copy)](https://zzang9ha.tistory.com/372)