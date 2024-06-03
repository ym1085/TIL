# 01. Gradle bootJar vs Jar 차이점

> Gradle에서 사용하는 bootJar와 jar로 생성되는 jar의 차이를 확인한다  
> Gradle에서 jar, bootJar, build는 각기 다른 역할을 갖는다  
> 주로 자바 프로젝트에서 빌드와 패키징 방식에 차이가 있다

## 01-1. jar 작업은 클래스 파일 생성

```shell
tasks.jar {
    enabled = true
}
```

> 아카이브 파일??  
> 아카이브 파일이란 여러 개의 파일을 하나의 파일로 묶어 저장한 것  
> 이렇게 하면 파일을 '관리'하고 '배포'하는 것이 간편해진다

- 역할: `표준 JAR 파일 생성` -> `Gradle Task`
- 내용: 컴파일된 `클래스 파일`, `리소스 파일`(ex: src/main/resources)
- 목적: 주로 `공통 라이브러리 모듈(유틸리티 라이브러리)`, `비실행형 JAR 파일` 만들 때 사용
- 특징: 기본 `Java 플러그인에서` 제공, 실행 가능한 JAR가 아닌 `단순한 아카이브 파일` 생성

## 01-2. bootJar는 실행 가능한 Jar 파일 생성

```shell
tasks.bootJar {
    enabled = true
}
```

- 역할: `Spring Boot Application` -> `실행 가능한 JAR 파일로 패키징` -> `Gradle Task`
- 내용: `모든 의존성(dependency)`, `클래스 파일(.class)`, `리소스 파일(ex: src/main/resources)`, `실행에 필요한 모든 요소`
- 목적: `Spring Boot Application` -> `단일 JAR 파일로 패키징` -> `쉽게 배포 및 실행`시 사용
- 특징: `spring Boot 플러그인에서 제공`하며, 내장 웹 서버(예: Tomcat) 포함 가능

## 01-3. build는 전체 빌드 프로세스 수행(하위 jar, bootJar, test)

> {project-name}.jar, {project-name}-plain.jar 생성됨  
> 응용 프로그램 배포에서 실행 가능한 jar 파일이 필요하기에 plain.jar 필요없음

```shell
tasks.build {
    dependsOn jar, test
}
```

- 역할: `프로젝트 전체 '빌드 프로세스'를 관리` -> `Gradle Task`
- 내용: `컴파일`, `테스트`, `패키징` 등의 `모든 빌드 과정의 결과물 포함`
- 목적: `프로젝트 전체 빌드`할 때 `사용`, 기본적으로 `assemble`(`패키징`) 및 `check`(`테스트`) `Task 포함`
- 특징: `build 테스크`는 `jar`, `bootJar`, `test` 등 `하위 테스크 호출`하여 `전체 빌드 과정 수행`

> 여기서 check, assembl에 대해 조금 더 짚고 넘어간다

### check

```shell
# 코드 스타일의 경우 나중에 자세히 알아보자..
plugins {
    id 'java'
    id 'checkstyle'
}

checkstyle {
    toolVersion = '8.41'
}

check.dependsOn checkstyleMain
```

> 별도 검증 플러그인 실행 -> 없음? -> 기본 TEST 코드 실행

- `프로젝트 품질 검증`을 위한 모든 작업 포함
- 단순 테스트 코드 실행하는 것 이상의 기능 수행
- 별도 검증 플러그인 없는 경우 -> 기본 test 코드 실행
  - `코드 스타일 검사`
  - `정적 분석` 및 `보안 검사`

### assemble

> 다수의 파일들을 단일 파일로 아카이브 한다 보면 될 듯?

- `빌드 결과물 생성 작업`
- 컴파일된 클래스 파일, 리소스, JAR 파일 포함
- `여러 빌드 결과물 단일 작업으로 묶어서 생성`

## 99. 참고 자료

- [[Spring] Gradle "bootJar"와 "jar" 태스크로 생성되는 jar 파일의 차이점](https://www.devkuma.com/docs/gradle/bootjar-jar/)
- [[Spring] gradle build bootJar 차이](https://stir.tistory.com/239)