# 01. List vs Set vs Map

> List: 순서가 있으며, 데이터 중복 허용  
> Set: 순서가 없으며, 데이터 중복 허용 안함  
> Map: key, value 구조, key는 중복 허용 안함, value는 중복 허용함

## 01-1. Collection(컬렉션)

- Java에서의 `컬렉션`이란 `객체`, `데이터`를 `효율적`으로 `관리` 할 수 있는 `자료구조들이 모여있는` `라이브러리`
- `데이터`의 `집합`, `그룹` 의미

## 01-2. List 자료구조

```java
String [] fruitsArr = { "apple", "banana", "kiwi", "mango" };
List<String> fruitsList = new ArrayList<>(Arrays.asList(fruitsArr));

for ( int i = 0; i < fruitsList..size(); i++) {
    log.debug("fruitsList = {}", fruitsList.get(i)); // "apple", "banana", "kiwi", "mango"
}
```

> 구현체의 특징의 경우 따로 정리 예정입니다.

- `순서 보장`
- `중복 허용`
- 인덱스(index) 기반으로 특정 위치의 데이터 조회 가능하기에 속도 빠름
- 구현체
  - `Vector`
  - `Stack`
  - `ArrayList`
    - 배열 기반 데이터 저장
    - 단방향 포인터 구조
    - 데이터 순차적 접근에 강점 가짐
    - 데이터 조회 및 검색 빠름
  - `LinkedList`
    - 노드 기반 데이터 저장
    - 양방향 포인터 구조
    - 데이터 삽입, 삭제 빠름
    - ArrayList보다 조회 및 검색 속도 느림

## 01-3. List 자료구조 만들어보기

```java
List<String> fruits = new ArrayList<>();
fruits.add("apple");
fruits.add("banana");
fruits.add("kiwi");
fruits.add("kiwi");
fruits.add("kiwi");
fruits.add(null);
System.out.println("fruits: " + fruits);
```

```java
// output
fruits: [apple, banana, kiwi, kiwi, kiwi, null]
```

- List는 위와 같이 `순차적 데이터 출력`
- `중복 데이터` 그대로 출력

## 02-1. Set 자료구조

- `순서 보장 안함`
- `중복 허용 안함`
- `HashTable 기반`
- 인덱스가 따로 존재하지 않음, `iterator` 사용 필요
- 구현체
  - HashSet
    - 인스턴스 `해시`(Hash) `값 기준 저장`, 순서 보장 X
    - NULL 값 허용
    - `TreeSet`보다 `삽입`, `삭제` `빠름`
  - LinkedHashSet
    - 입력 순서 보장
    - NULL 값 허용
  - TreeSet
    - `이진 탐색 트리`(Reg-Black Tree) 기반
    - NULL 값 허용 안함
    - 데이터 `오름차순` 정렬
    - 데이터 `삽입`, `삭제` 시간 `오래걸리지만` `검색 및 정렬 빠름`

## 02-2. Set 자료구조 만들어보기

```java
Set<String> fruits = new HashSet<String>();
fruits.add("apple");
fruits.add("banana");
fruits.add("kiwi");
System.out.println("fruits = " + fruits) // fruits: [banana, apple, kiwi]
```

- **Set은 순서를 보장하지 않으며, 중복 역시 허용하지 않는 자료구조**
  - 가끔 Hash 값 일치하는 경우 발생, 동일하게 나오는 것처럼 보임
- index 기반 데이터 조회 불가능

## 02-3. Set 자료구조 - 중복 허용 여부 확인

```java
Set<String> fruits = new HashSet<>();
fruits.add("apple");
fruits.add("banana");
fruits.add("kiwi");
fruits.add("kiwi");
fruits.add("kiwi");
System.out.println("fruits: " + fruits);
```

```java
// output
fruits: [banana, apple, kiwi]
```

- Set<T> 자료구조의 경우 데이터의 순서를 보장하지 않고, 데이터의 중복 역시 제거되는 것을 확인할 수 있다

## 02-4. List, Set 자료구조는 언제 사용해야 하는가?

- **List** : 데이터의 순서가 보장이 되어야하고 중복 역시 허용이 되어야 하는 경우 사용
  - O(n) 소요
- **Set** : 데이터의 순서의 보장보다는 중복을 허용하지 않고 속도 측면에 빠른 탐색이 필요한 경우 사용
  - O(1) 소요

## 03-1. Map 자료구조

```java
import java.util.HashMap;
import java.util.Map;

public class MapExample {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        
        // key 중복되지 않음, value는 중복될 수 있음
        map.put("key1", "value1");
        map.put("key2", "value2");
        map.put("key3", "value1"); // value1은 중복 가능
        map.put("key4", "value3");
        map.put("key5", "value2"); // value2는 중복 가능

        // key 중복 허용 안됨 (기존 key1을 덮어씀)
        map.put("key1", "newValue");

        // 결과 출력
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }
    }
}
```

- key, value 한쌍의 그룹으로 구성
- key 중복 허용 안함, value는 중복 허용
- 구현체
  - HashMap
    - key에 중복 허용 안함, value 중복 허용
    - 순서 보장하지 않음
    - `동기화 보장 안함` -> ConcurrentHashMap(성능 + 동기화 제공)
    - `key, value NULL 허용`
  - HashTable
    - key에 중복 허용 안함, value 중복 허용
    - 순서 보장하지 않음
    - 동기화 보장 -> 병렬 프로그래밍 가능하지만 HashMap보다 속도 느림
    - `key, value NULL 허용 안함`
  - LinkedHashMap
    - 입력 순서 보장
    - `key, value NULL 허용`
  - TreeMap
    - 이진 탐색 트리(Red-Black Tree) 기반 key,value 저장
    - key 값 기준 오름차순 정렬, 빠른 검색 가능
    - 저장 시 정렬하기에 시간 다소 걸림
    - `key는 NULL 허용 안함`

## 03-2. Map 자료구조 만들어보기

```java
package com.test;

import java.util.*;

public class Test {

    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        map.put("1", "1");
        map.put("3", "5");
        map.put("4", "2");
        map.put("3", "4"); // 중복 key -> 3:4 로 값 덮어쓴다
        map.put("6", "3");
        map.put("8", "1");
        map.put(null, null);
        System.out.println(map);
        System.out.println();

        Map<String, String> map2 = new Hashtable<>();
        map2.put("1", "1");
        map2.put("1", "2");
        map2.put("2", "1");
        map2.put("3", "1");
        map2.put("4", "1");
        map2.put("5", "1");
        map.put(null, null);
        System.out.println(map2);
        System.out.println();

        Map<String, String> map3 = new LinkedHashMap<>();
        map3.put("332", "1");
        map3.put("2", "2");
        map3.put("111", "4");
        map3.put("123", "5");
        map3.put("144", "7");
        map3.put("13", "2");
        System.out.println(map3);
        System.out.println();

        Map<String, String> map4 = new TreeMap<>();
        map4.put("133", "1");
        map4.put("12", "3");
        map4.put("11", "4");
        map4.put("134", "6");
        map4.put("11", "1");
        map4.put("615", "3");
        map4.put("1312", "9");
        System.out.println(map4);
    }
}
```

## 99. 참고 자료

- [[Java] List와 Set의 차이점](https://living-only-today.tistory.com/233)
- [[Java] List, Set, Map 특징 및 차이점](https://hahahoho5915.tistory.com/35)