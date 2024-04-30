# 01. 내용

```bash
**java.lang.IllegalStateException: Found multiple @SpringBootConfiguration annotated classes** [Generic bean: class [com.shoppingmall.ShopApplication]; scope=; abstract=false; lazyInit=null; autowireMode=0; dependencyCheck=0; autowireCandidate=true; primary=false; factoryBeanName=null; factoryMethodName=null; initMethodName=null; destroyMethodName=null; defined in file [C:\workspace-personal\springboot-shopping-mall\app\shop\build\classes\java\main\com\shoppingmall\ShopApplication.class], Generic bean: class [com.shoppingmall.CommonApplication]; scope=; abstract=false; lazyInit=null; autowireMode=0; dependencyCheck=0; autowireCandidate=true; primary=false; factoryBeanName=null; factoryMethodName=null; initMethodName=null; destroyMethodName=null; defined in file [C:\workspace-personal\springboot-shopping-mall\app\common\build\classes\java\main\com\shoppingmall\CommonApplication.class]]
```

- 쇼핑몰 프로젝트 멀티 모듈로 구성 후 테스트를 실행하였는데 위와 같은 오류 발생
- @SpringBootConfiguration 어노테이션이 2개로 중복이 된다는 내용
- 해결 방안은 어노테이션에 SpringBootApplication 클래스 타입을 지정해 중복을 피해야 한다

```java
@SpringBootTest(classes = ShopApplication.class)
public class ShopControllerTest {
    ...중략
}
```

- 위와 같이 테스트를 수행할 클래스 타입을 지정해야 오류가 발생하지 않는다 

# 99. 참고 자료

- [Spring boot test 경로가 다른 패키지 테스트 시 오류](https://unhosted.tistory.com/77)