## 01. 상수 - enum

```java
int x = 1;
```

- **상수는 변하지 않는 값**
- 위에서 **좌항**이 **변수**이고 우항이 **상수**이다

```java
1 = 2;
```

- 다음과 같은 구문은 있을 수 없다. 1은 2가 될 수 없다

### 01-1. 상수 예제

```java
public class ConstantDemo {
		
    /*
        * 1. 사과
        * 2. 복숭아
        * 3. 바나나
        */
    int type = 1;
    switch(type) {
        case 1:
            System.out.println(57);
        case 2:
            System.out.println(34);
        case 3:
            System.out.println(93);
    }
}
```

- 현재 switch ~ case 문을 통해 사과, 복숭아, 바나나를 출력하는 코드
- 위 코드는 개선할 점이 있다, 만약 주석이 없으면 1 ⇒ 57 이라는 숫자가 어떤 것을 의미하는지 알 수 없다
- 다음 소스를 통해 위 소스를 한번 개선 해보자

### 01-2. 상수 예제

```java
public class ConstantDemo {
    private final static int APPLE = 1;
    private final static int PEACH = 2;
    private final static int BANANA = 3;

    public static void main(String[] args) {
        // 개선된 로직, 이름만으로도 결과 값 구분이 가능
        int type = APPLE;
        switch(type) {
            case APPLE:
                System.out.println(57);
            case PEACH:
                System.out.println(34);
            case BANANA:
                System.out.println(93);
        }
    }		
}
```

- 위에서 작성한 소스 중에서 숫자(1,2,3)을 APPLE, PEACH, BANANA 라는 전역 변수에 담았다
    - final 키워드를 통해 변하지 않는 값(상수)으로 선언 하였다
    - **여기서 중요한 부분은 ‘case의 조건 값’으로 변수를 선언할 수 있다는 점이다**
- 다음 소스에서는 과일 뿐만이 아니라, 기업 이름도 같이 필요한 경우의 리팩토링을 진행 해보자

### 01-3. 상수 예제

```java
// AS-IS : 변경 전
public class ConstantDemo {
    private final static int APPLE = 1;
    private final static int PEACH = 2;
    private final static int BANANA = 3;

    private final static int GOOGLE = 1;
    private final static int APPLE = 2; // ERROR, 동일한 이름의 상수가 2번 선언 되었음 (상수는 한번 값 할당 시 변경이 불가능)
    private final static int ORACLE = 3;

    public static void main(String[] args) {
        // 개선된 로직, 이름만으로도 결과 값 구분이 가능
        int type = APPLE;
        switch(type) {
            case APPLE:
                System.out.println(57);
            case PEACH:
                System.out.println(34);
            case BANANA:
                System.out.println(93);
        }
    }		
}
```

```java
// TO-BE : 변경 후 -> 변수명 앞에 접두사 기재
public class ConstantDemo {
    private final static int FRUIT_APPLE = 1;
    private final static int FRUIT_PEACH = 2;
    private final static int FRUIT_BANANA = 3;

    private final static int COMPANY_GOOGLE = 1;
    private final static int COMPANY_APPLE = 2; // ERROR, 동일한 이름의 상수가 2번 선언 되었음 (상수는 한번 값 할당 시 변경이 불가능)
    private final static int COMPANY_ORACLE = 3;

    public static void main(String[] args) {
        // 개선된 로직, 이름만으로도 결과 값 구분이 가능
        int type = FRUIT_APPLE;
        switch(type) {
            case FRUIT_APPLE :
                System.out.println(57);
            case FRUIT_PEACH :
                System.out.println(34);
            case FRUIT_BANANA :
                System.out.println(93);
        }
    }		
}
```

- 변수명 앞에 접두사 기재하여 상수의 중복을 피한다
- 하지만 여전히 코드가 깔끔하지는 않은 상태, 인터페이스를 사용하여 위 코드를 수정 해보자

```java
// TO-BE : 변경 후 -> 인터페이스 생성을 통한 리팩토링
interface FRUIT {
		int APPLE = 1, PEACH = 2, BANANA = 3;
}

interface COMPANY {
		int GOOGLE = 1, APPLE= 2, ORACLE= 3;
}

// TO-BE : 변경 후 -> 인터페이스 사용
public class ConstantDemo {

    public static void main(String[] args) {
        // 개선된 로직, 이름만으로도 결과 값 구분이 가능
        int type = FRUIT.APPLE;
        switch(type) {
            case FRUIT.APPLE :
                System.out.println(57);
            case FRUIT.PEACH :
                System.out.println(34);
            case FRUIT.BANANA :
                System.out.println(93);
        }
    }		
}
```

- 인터페이스에는 직접 작성하지 않아도, public final static 이 내부적으로 붙어 있다
- 기존 전역 변수로 선언된 부분은 제거하고, 인터페이스를 안에 변수를 생성 하였다
    - 기존 복잡해 보였던 전역 변수가 제거되는 효과를 가져옴
    - 기존 상수의 이름 때문에 충돌이 나는 부분은 인터페이스 단위로 격리 시켜서 우회 시켰다

> ⚠️ 여기서 만약 다음과 같은 비교문이 있다는 가정을 해보자

```java
// TO-BE : 변경 후 -> 인터페이스 생성을 통한 리팩토링
interface FRUIT {
    int APPLE = 1, PEACH = 2, BANANA = 3;
}

interface COMPANY {
    int GOOGLE = 1, APPLE= 2, ORACLE= 3;
}

// TO-BE : 변경 후 -> 인터페이스 사용
public class ConstantDemo {

    public static void main(String[] args) {       
        if (FRUIT.APPLE == COMPANY.APPLE) { // 추가 된 로직
                System.out.println("과일 애플과 회사 애플이 같다.")
        }
            
        int type = FRUIT.APPLE;
        switch(type) {
            case FRUIT.APPLE :
                System.out.println(57);
            case FRUIT.PEACH :
                System.out.println(34);
            case FRUIT.BANANA :
                System.out.println(93);
        }
    }		
}
```

- 위 비교문을 살펴보자, 일단 APPLE 이라는 이름이 같다고 해서, 두 개의 값을 비교하는 것은 말도 안되는 행위이다
- 이러한 일은 실무에서도 비일비재하게 발생 할 수 있는 부분인데, 위 소스를 한번 더 리팩토링 해보자

```java
// TO-BE : 변경 후 -> 클래스 생성을 통한 리팩토링
class Fruit {
    public static final Fruit APPLE = new Fruit();
    public static final Fruit PEACH = new Fruit();
    public static final Fruit BANANA = new Fruit();
}

class Company {
    public static final Company GOOGLE = new Company();
    public static final Company APPLE = new Company();
    public static final Company ORACLE = new Company();
}

public class ConstantDemo {

    public static void main(String[] args) {
        if (FRUIT.APPLE == COMPANY.APPLE) { // 추가 된 로직 -> 빨간색 밑줄 ERROR가 발생 한다
            System.out.println("과일 애플과 회사 애플이 같다.")
        }
        
        Fruit type = FRUIT.APPLE;
        switch(type) {
            case FRUIT.APPLE :
                System.out.println(57);
                break;
            case FRUIT.PEACH :
                System.out.println(34);
                break;
            case FRUIT.BANANA :
                System.out.println(93);
                break;
        }
    }		
}
```

- 컴파일러가 컴파일을 거부하여 ERROR 가 발생하게 된다
- switch문을 사용할 때 한가지 주의할 것은 switch의 조건으로는 몇가지 제한된 타입만 사용이 가능하다
    - byte
    - short
    - char
    - int
    - enum
    - String
    - Character
    - Byte
    - Short
    - Integer

## 02. enum (열거형)

- enum은 열거형(enumerated type)이라고 부른다
- 열거형은 서로 **연관된 상수들의 집합**이라 할 수 있다
    - 배열은 동일한 값 타입을 갖는 서로 ‘연관된 값들의 집합’이라고 하는 것을 비유로 들 수 있다
- 자바 1.5부터 이러한 enum, 열거형 타입을 지원하기 시작 하였다
- 그렇다면 enum이 무엇인지 간략히 알아보았으니, 위에서 작성한 소스를 enum을 사용하여 리팩토링 해보자

### 02-1. enum 예제

```java
/*class Fruit {
    public static final Fruit APPLE = new Fruit();
    public static final Fruit PEACH = new Fruit();
    public static final Fruit BANANA = new Fruit();
}*/

//class Fruit과 아래 enum 로직은 같은 역할을 수행 한다
enum Fruit {
    APPLE, PEACH, BANANA
}

enum Company {
    GOOGLE, APPLE, ORACLE
}

/*class Company {
    public static final Company GOOGLE = new Company();
    public static final Company APPLE = new Company();
    public static final Company ORACLE = new Company();
}*/

public class ConstantDemo {

    public static void main(String[] args) {
        if (FRUIT.APPLE == COMPANY.APPLE) { // 추가 된 로직 -> 빨간색 밑줄 ERROR가 발생 한다
            System.out.println("과일 애플과 회사 애플이 같다.")
        }
        
        Fruit type = Fruit.APPLE;
        switch(type) {
            case APPLE :
                System.out.println(57);
                break;
            case PEACH :
                System.out.println(34);
                break;
            case BANANA :
                System.out.println(93);
                break;
        }
    }		
}
```

- 기존 class Fruit이 하던 역할을 enum Fruit을 통해 리팩토링 하였다
    - 코드가 매우 단순해진다
    - 인스턴스의 생성과 상속을 방지할 수 있다
- enum 역시 하나의 클래스다, enum 클래스라 지칭

### 02-2. enum 예제

```java
/*class Fruit {
    public static final Fruit APPLE = new Fruit();
    public static final Fruit PEACH = new Fruit();
    public static final Fruit BANANA = new Fruit();
}*/

//class Fruit과 아래 enum 로직은 같은 역할을 수행 한다
enum Fruit {
    APPLE, PEACH, BANANA;

    // enum 생성자
    Fruit() {
        System.out.println("Call Constructor");
    }
}

enum Company {
	GOOGLE, APPLE, ORACLE
}

/*class Company {
    public static final Company GOOGLE = new Company();
    public static final Company APPLE = new Company();
    public static final Company ORACLE = new Company();
}*/

public class ConstantDemo {

    public static void main(String[] args) {          
        if (FRUIT.APPLE == COMPANY.APPLE) { // 추가 된 로직 -> 빨간색 밑줄 ERROR가 발생 한다
            System.out.println("과일 애플과 회사 애플이 같다.")
        }
        
        Fruit type = Fruit.APPLE;
        switch(type) {
            case APPLE :
                System.out.println(57);
                break;
            case PEACH :
                System.out.println(34);
                break;
            case BANANA :
                System.out.println(93);
                break;
        }
    }		
}
```

```java
// print 내용, 생성자가 3번 호출 되었음
Call Constructor
Call Constructor
Call Constructor
```

- enum은 생성자(Constructor)를 가질 수 있다, 여기에서 상당히 중요한 부분이 있다
    - 생성자가 3번 호출 되었다는 점 (왜? 생성자가 3번 호출 되었을까? 객체 생성을 따로 하지도 않았는데)

```java
// 3번의 객체 생성이 이루어진다 가정하고, 생성자가 있으면 3번 생성자를 호출
class Fruit {
    public static final Fruit APPLE = new Fruit();
    public static final Fruit PEACH = new Fruit();
    public static final Fruit BANANA = new Fruit();
}
```

```java
// 눈에 보이지는 않지만, public static final Fruit APPLE = new Fruit(); 이런 식으로 저장이 된다
enum Fruit {
    APPLE, PEACH, BANANA;

    // enum 생성자
    Fruit() {
        System.out.println("Call Constructor");
    }
}
```

- enum이 다음과 같은 형태를 내부적으로 나타내기 때문에 생성자가 3번 호출 되었다는 것을 알아야 한다
- 또한 enum 생성자를 통해 다음과 같이 사용이 가능하다

```java
// 눈에 보이지는 않지만, public static final Fruit APPLE = new Fruit(); 이런 식으로 저장이 된다
enum Fruit {
    APPLE, PEACH, BANANA;

    // enum 생성자
    Fruit() {
        System.out.println("Call Constructor" + this);
    }
}
```

```java
// print
Call Constructor APPLE
Call Constructor PEACH
Call Constructor BANANA
```

- this 키워드를 통해서 enum의 상수 필드 APPLE, PEACH, BANANA를 위와 같이 출력 가능
- 그렇다면 필드를 가질수도 있는가?
    - 당연히 가능하다

```java
// 눈에 보이지는 않지만, public static final Fruit APPLE = new Fruit(); 이런 식으로 저장이 된다
enum Fruit {
    APPLE("red"), PEACH("pink"), BANANA("yellow");

    private String color

    public String getColor() {
        return this.color;
    }

    // enum 생성자
    Fruit(String color) {
        System.out.println("Call Constructor" + this);
        this.color = color;
    }
}
```

```java
public class ConstantDemo {

    public static void main(String[] args) {    
        if (FRUIT.APPLE == COMPANY.APPLE) { // 추가 된 로직 -> 빨간색 밑줄 ERROR가 발생 한다
            System.out.println("과일 애플과 회사 애플이 같다.")
        }
        
        Fruit type = Fruit.APPLE;
        switch(type) {
            case APPLE :
                System.out.println(57 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
            case PEACH :
                System.out.println(34 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
            case BANANA :
                System.out.println(93 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
        }
    }		
}
```

### 02-3. enum 예제

```java
public class ConstantDemo {

    public static void main(String[] args) {
        for (Fruit f : Fruit.valued()) {
            System.out.println(f + ", " + f.getColor());
        }
        
        Fruit type = Fruit.APPLE;
        switch(type) {
            case APPLE :
                System.out.println(57 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
            case PEACH :
                System.out.println(34 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
            case BANANA :
                System.out.println(93 + "color " + Fruit.APPLE.getColor()); // enum의 color 필드 사용
                break;
        }
    }		
}
```

- for - each 를 사용하여 enum 안에 있는 값을 꺼내 사용도 가능