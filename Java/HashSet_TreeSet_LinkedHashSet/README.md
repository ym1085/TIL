# 01. HashSet vs TreeSet vs LinkedHashSet

> 기본적으로 Set은 중복 요소를 허용하지 않고 순서도 보장하지 않는다.  
> 이번에는 Set 인터페이스의 구현 클래스인 HashSet, TreeSet, LinkedHashSet에 특징에 대해 알아보자.

## 01-1. HashSet

```java
public class HashSet<E>
    extends AbstractSet<E>
    implements Set<E>, Cloneable, java.io.Serializable
{
    static final long serialVersionUID = -5024744406713321676L;

    private transient HashMap<E,Object> map;

    // Dummy value to associate with an Object in the backing Map
    private static final Object PRESENT = new Object();

    /**
     * Constructs a new, empty set; the backing {@code HashMap} instance has
     * default initial capacity (16) and load factor (0.75).
     */
    public HashSet() {
        map = new HashMap<>(); // new HashSet() 호출 시 new HashMap()을 map 변수에 담는다
    }
    //...중략
}
```

```java
package com.test;

import java.util.HashSet;
import java.util.Set;

public class SetTest {

    public static void main(String[] args) {
        Set<Integer> set = new HashSet<>();
        set.add(3);
        set.add(2);
        set.add(1);
        set.add(4);
        set.add(10);
        System.out.println("set => " + set + "\n");

        Set<Integer> set2 = new HashSet<>();
        set2.add(5);
        set2.add(2);
        set2.add(1);
        set2.add(3);
        set2.add(89);
        set2.remove(0);
        System.out.println("set2 => " + set2);
        System.out.println("set2.size() => " + set2.size());
        System.out.println("set2.contains() => + " + set2.contains(5));
    }
}
```

- `HashSet`의 `기본 구조`는 `HashTable`
  - Java에서 `HashMap`은 `HashTable`을 구현한 클래스이다
- 내부적으로 `HashMap`을 `사용`한다
  - `Key`에는 `hashSet.add('값1')`을 저장하고, `Value`에는 `PRESENT` 값을 항상 저장
  - `PRESENT`는 `DUMMY 객체`
    - HashSet 요소의 고유성을 보장하기 위해 HashMap을 기본적으로 사용하면서 불필요 값 저장을 피하기 위함
    - `메모리 절약` 및 `성능 최적화` 가능
- `순서 보장 안함`
- NULL 입력 가능, 하지만 null도 한 번만 저장되고 중복 불가능
- 평균적으로 `O(1)`의 `시간 복잡도`로 `요소`를 `추가`, `삭제`, `조회` 가능

## 01-2. TreeSet

```java
public class TreeSet<E> extends AbstractSet<E>
    implements NavigableSet<E>, Cloneable, java.io.Serializable
{
    /**
     * The backing map.
     */
    private transient NavigableMap<E,Object> m;

    // Dummy value to associate with an Object in the backing Map
    private static final Object PRESENT = new Object();

    /**
     * Constructs a set backed by the specified navigable map.
     */
    TreeSet(NavigableMap<E,Object> m) {
        this.m = m;
    }

    // 기존 default 생성자 호출, 이 때 new TreeMap<>()을 매개변수로 전달
    public TreeSet() {
        this(new TreeMap<>());
    }
```

```java
package com.test;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class SetTest {

    public static void main(String[] args) {
        // 001. 숫자 - 기본 오름차순
        // 예상 : [1, 2, 3]
        // 결과 : [1, 2, 3]
        Set<Integer> treeSet = new TreeSet<>();
        treeSet.add(3);
        treeSet.add(1);
        treeSet.add(2);
        System.out.println("treeSet => " + treeSet + "\n");

        // 002. 문자 - 기본 오름차순
        // 예상 : [A, B, C, E, F]
        // 결과 : [A, B, C, E, F]
        Set<String> treeSet2 = new TreeSet<>();
        treeSet2.add("B");
        treeSet2.add("A");
        treeSet2.add("C");
        treeSet2.add("F");
        treeSet2.add("E");
        System.out.println("treeSet2 => " + treeSet2 + "\n");

        // 003. Comparator를 생성자로 전달
        Comparator<Integer> descendingOrder = new Comparator<Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                return b - a;
            }
        };
        Set<Integer> treeSet3 = new TreeSet<>(descendingOrder);
        treeSet3.add(3);
        treeSet3.add(2);
        treeSet3.add(1);
        treeSet3.add(0);
        treeSet3.add(4);
        System.out.println("treeSet3 = " + treeSet3);
    }
}
```

- `TreeSet`의 기본 구조는 `Red-Black-Tree`(이진 탐색 트리)로 되어있다
- 내부적으로 `TreeMap`을 `사용`한다
- `순서`는 `기본`적으로 `오름차순` 정렬, `인자`로 `Comparator` 전달 시 Comparator 기준 정렬
- `NULL` 값은 `허용하지 않는다`
- 평균적으로 삽입, 삭제, 조회 모두 `O(log n)`의 시간 복잡도를 갖는다

## 01-3. LinkedHashSet

```java
// LinkedHashSet.java
public class LinkedHashSet<E>
    extends HashSet<E>
    implements Set<E>, Cloneable, java.io.Serializable {

    //..중략

    /**
     * Constructs a new, empty linked hash set with the default initial
     * capacity (16) and load factor (0.75).
     */
    public LinkedHashSet() {
        super(16, .75f, true);
    }

    //..중략
}
```

```java
// HashSet.java
public class HashSet<E>
    extends AbstractSet<E>
    implements Set<E>, Cloneable, java.io.Serializable
{
    //..중략

    /**
     * Constructs a new, empty linked hash set.  (This package private
     * constructor is only used by LinkedHashSet.) The backing
     * HashMap instance is a LinkedHashMap with the specified initial
     * capacity and the specified load factor.
     *
     * @param      initialCapacity   the initial capacity of the hash map
     * @param      loadFactor        the load factor of the hash map
     * @param      dummy             ignored (distinguishes this
     *             constructor from other int, float constructor.)
     * @throws     IllegalArgumentException if the initial capacity is less
     *             than zero, or if the load factor is nonpositive
     */
    HashSet(int initialCapacity, float loadFactor, boolean dummy) {
        map = new LinkedHashMap<>(initialCapacity, loadFactor); // LinkedHashMap 생성자 호출 시 HashSet에서 new LinkedHashMap 객체 생성
    }
    
    //..중략
}
```

- `LinkedHashSet`의 기본 구조는 `해시 테이블`, `이중 연결 리스트` 사용
- 내부적으로 `LinkedHashMap` 사용
- `순서 보장`(입력한 순서대로)
- NULL 입력 가능, 하지만 null도 한 번만 저장되고 중복 불가능

## 99. 참고 자료

- [[Data Structure] HashSet, LinkedHashSet, TreeSet](https://developyo.tistory.com/166)
- [Set ->hashset, treeset, linkedhashset, sortedset](https://shyvana.tistory.com/14)