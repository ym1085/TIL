# 01-1. List vs Set

### List 자료구조

```java
String [] fruitsArr = { "apple", "banana", "kiwi", "mango" };
List<String> fruitsList = new ArrayList<>(Arrays.asList(fruitsArr));

for ( int i = 0; i < fruitsList..size(); i++) {
    log.debug("fruitsList = {}", fruitsList.get(i)); // "apple", "banana", "kiwi", "mango"
}
```

- **List는 순서를 보장하고 중복 역시 허용해주는 자료구조**
- index 기반으로 특정 위치의 데이터 조회 가능
  - 데이터의 저장 순서 보장
  - 중복 허용함

### List 자료구조 만들어보기

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

- List 자료구조의 경우 위와 같이 순차적으로 데이터를 출력하고, 중복 데이터 역시 출력하는 그림을 볼 수 있다

### Set 자료구조 만들어보기

```java
Set<String> fruits = new HashSet<String>();
fruits.add("apple");
fruits.add("banana");
fruits.add("kiwi");
System.out.println("fruits = " + fruits) // fruits: [banana, apple, kiwi]
```

- **Set은 순서를 보장하지 않으며, 중복 역시 허용하지 않는 자료구조**
- index 기반 데이터 조회 불가능
  - 데이터의 저장 순서를 보장하지 않음
  - 중복 데이터 허용하지 않음

### Set 자료구조 - 중복 허용 여부 확인

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

### List, Set 자료구조는 언제 사용해야 하는가?

- **List** : 데이터의 순서가 보장이 되어야하고 중복 역시 허용이 되어야 하는 경우 사용
  - contains(element) 호출 시 : O(1) 소요
- **Set** : 데이터의 순서의 보장보다는 중복을 허용하지 않고 속도 측면에 빠른 탐색이 필요한 경우 사용
  - contains(element) 호출 시 : O(n) 소요

### Map 자료구조 만들어보기

- TODO

# 참고 자료

- [[Java] List와 Set의 차이점](https://living-only-today.tistory.com/233)
