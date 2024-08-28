# Spring Boot JUnit5 자주 사용되는 어노테이션 정리

> JUnit5 테스트 시 사용하는 어노테이션 및 부가 기능에 대해 간략히 정리한다

## @DisplayName

> 테스트 이름 명시

- 어떤 테스트를 의미하는지 테스트명 결정

## @SpringBootTest vs @WebMvcTest

> 통합 테스트와 웹 레이어 기반 단위 테스트

- `@SpringBootTest`
  - 목적
    - `애플리케이션 전체 컨텍스트 로드` 후 `통합 테스트` 수행
  - 테스트 범위
    - 애플리케이션 전체 컨텍스트 로드하기에, DB, 서비스 계층, 리포지토리, 보안 등 모든 빈을 포함한 전체 테스트 수행 가능
  - 장점
    - 애플리케이션 실제 실행되는 환경과 동일한 환경 테스트 가능
  - 단점
    - 테스트 시간이 길어짐, 모든 컨테스트 로드 하기에
- `@WebMvcTest`
  - 목적
    - `MVC (Controller) 계층`만 `테스트` 하기 위해 사용
  - 테스트 범위
    - `웹 계층`(`Controller`)` Bean만 로드`, `서비스, 리포지토리, DB 관련 빈은 로드 안됨`
    - HTTP 요청 및 응답 테스트
  - 장점
    - 필요한 빈만 로드하기에 테스트 실행이 빠름
    - 단위 테스트와 비슷한 방식의 테스트 가능
  - 단점
    - 애플리케이션 전체 동작 테스트 불가능
    - 웹 계층만 테스트 가능

## @ContextConfiguration(classes = { ShopApplication.class })

```java
@ContextConfiguration(classes = 클래스 이름.class)
@ContextConfiguration(locations = "파일의 경로")
```

> Spring F/W에서 사용되는 어노테이션으로, 테스트 클래스가 사용할 Application Context 클래스 지정

- JUnit5 테스트 클래스가 사용할, Application Context 설정
- Application Context의 파일 혹은 클래스 위치 지정
- @SpringBootApplication 클래스 경로 지정 이유?
  - 위 어노테이션을 사용한 클래스는 기본적으로 컴포넌트 스캔, Spring 빈 등록, 자동 설정 등의 중요한 설정을 포함하기에
  - 해당 어노테이션 붙은 클래스가 진입점이자 전체 컨텍스트를 구성하는 핵심 역할을 담당
  - 하여 위 클래스를 지정하면 필수 설정이 자동 로드 됨

## @WithMockUser

```java
@WithMockUser(username = "admin", password = "admin1234!")
```

- Spring Security에서 제공되는 어노테이션
- `테스트 환경`에서 `가상의 인증된 사용자`(Mock User)를 `생성`하여 `테스트 가능`하게 만들어줌

## @ExtendWith

> 확장 기능 추가

- 단위 테스트 or 통합 테스트 시에 사용할 확장 기능 추가
- 생명주기 관리(테스트 라이프사이클 관리 or 후킹)
- 테스트 실행 전후 or 클래스 인스턴스화 전후 등 다양항 지점에서 동작 추가 가능
- 의존성 주입(DI)
- 테스트 메서드, 클래스, 인자에 DI를 수행할 수 있다

### @ExtendWith(SpringExtension.class)

- SpringExtenstion은 JUnit5와 Spring 프레임워크를 연결하는 확장 기능
- JUnit5의 다른 확장 기능과 다르게, Spring이 제공하는 모든 테스트 기능 사용 가능
- Spring 컨테스트 통합
  - JUnit 테스트에서 Spring Application Context를 로드 및 관리
  - 의존성 주입(DI) 활성화
  - @Autowired 등을 사용해 Spring Bean 주입 가능
- Spring 기능 사용
  - 트랜잭션 관리, DB와 통합된 테스트, Spring Security 설정 등등

### @ExtendWith(MockitoExtension.class)

- JUnit5에서 Mockito의 확장 기능 적용
- @Mock, @InjectMock, @Spy 등의 어노테이션 자동 처리(Mock 객체 자동 초기화 및 주입)
- 테스트 라이프사이클 관리
  - 테스트 메서드 실행 전후 필요한 설정 및 정리 작업 자동 수행
  - 예를 들어, @InjectMocks이 달린 객체의 의존성 주입 + 객체 초기화 자동 수행

## @TestInstance(TestInstance.Lifecycle.옵션)

```java
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
```

```java
public class TestInstanceAnnotation {

    public int i=0;

    @Test // 1번 테스트 객체 생성
    void test_1() {
        assertTrue(++i == 1);
    }

    @Test // 2번 테스트 객체 생성
    void test_2() {
        assertTrue(++i == 1);
    }
}
```

- JUnit은 설정된 `테스트 단위`로 `테스트 객체를 생성`, 이를 `테스트 인스턴스`라 지칭
- 즉, `기본적으로 Test 메서드 단위로 객체를 생성`
- TestInstance `기본 라이프 사이클 옵션`은 `PER_METHOD`
- 만약 `테스트 메서드간에 영향이 가는 테스트`를 할때는 위 옵션을 `PER_CLASS`로 변경 해야 함

## @TestMethodOrder

```java
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
```

> @TestMethodOrder 선언하지 않으면 기본 알고리즘에 의해 순서가 결정됨

- `테스트 메서드의 실행 순서가 보장`되어야 한다면, `@TestMethodOrder`를 사용해야 한다
- 옵션 타입
  - MethodName: 메서드명
  - DisplayName: @DisplayName
  - OrderAnnotation: @Order(n)
  - Random: 랜덤

## 99. 참고 자료

- [[Spring] SpringBoot 테스트 시 @WebMvcTest와 @SpringBootTest의 차이](https://ksh-coding.tistory.com/53)
- [@WebMvcTest 에서 Spring Security 적용, 401/403 에러 해결하기 - csrf](https://sedangdang.tistory.com/303)
- [[Spring]Security적용 후 Controller 테스트코드 작성 시 발생했던 오류들 (Feat. Junit5, csrf)](https://velog.io/@tjdtn0219/SpringSecurity%EC%A0%81%EC%9A%A9-%ED%9B%84-Controller-%ED%85%8C%EC%8A%A4%ED%8A%B8%EC%BD%94%EB%93%9C-%EC%9E%91%EC%84%B1-%EC%8B%9C-%EB%B0%9C%EC%83%9D%ED%96%88%EB%8D%98-%EC%98%A4%EB%A5%98%EB%93%A4-Feat.-Junit5-csrf)
- [JUnit 5 사용법 (6) - 테스트 인스턴스 (@TestInstance)](https://effortguy.tistory.com/119)
- [JUnit 5 사용법 (7) - 테스트 순서 (@TestMethodOrder)](https://effortguy.tistory.com/120)