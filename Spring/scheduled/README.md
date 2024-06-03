# 01. @Scheduled 스케줄러 간단히 사용 해보기

> 이번 시간에는 스프링에서 제공하는 스케쥴러 기능을 사용 해보자  
> 간단한 예시를 통해 스케쥴러의 특징에 대해서 알아본다

## 01-1. SpringBootScheduleApplication 설정

```java
package com.spring.schedule;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // 스케쥴링 기능 활성화
@SpringBootApplication
public class SpringBootScheduleApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootScheduleApplication.class, args);
    }
}
```

> Spring Context(IoC Container)에 'ScheduledAnnotationBeanPostProcessor' 가 등록 됨  
> 해당 빈은 스프링 빈 정의를 검사하여 @Scheduled 어노테이션이 붙은 메서드를 찾고, 해당 메서드를 스케쥴링 큐에 등록

- `Spring Scheduler`는 `별도의 의존성이 필요하지 않다`
  - `Spring Boot Starter`에 `기본 의존성` 제공
- SpringBootScheduleApplication 클래스에 `@EnableScheduling` 어노테이션을 선언한다
  - 스케쥴링 기능 활성화

## 01-2. SchedulerConfig 설정

```java
package com.spring.schedule.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.StopWatch;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Slf4j
@Component
@RequiredArgsConstructor
public class SchedulerConfig {

    /**
     * @Scheduled
     * - fixedDelay: 이전 작업이 종료된 후 설정 시간만큼 기다린 후 시작 (ms)
     * - fixedRate: 이전 작업이 종료되지 않아도 설정 시간만큼 기다린 후 시작 (ms)
     * - initialDelay: 스케쥴러 시작 후 최초 실행 지연 시간 (ms)
     * - cron: cron 표현식
     * - zone: cron 표현식을 실행할 때 사용할 TimeZone
     */

    // 2초마다 실행, 작업이 끝나야 실행 됨
    @Scheduled(fixedDelay = 1000)
    public void performTaskByFixedDelay() throws InterruptedException {
        StopWatch stopWatch = StopWatch.createStarted();
        Thread.sleep(2000);
        stopWatch.stop();
        log.info("[001] Scheduled Task Executed at performTaskFixedDelay = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    }

    // 3초마다 실행, 작업이 끝나야 실행
    @Scheduled(fixedDelay = 1000, initialDelay = 1000)
    public void performTaskByFixedDelayInitialDelay() throws InterruptedException {
        StopWatch stopWatch = StopWatch.createStarted();
        Thread.sleep(2000);
        stopWatch.stop();
        log.info("[002] Scheduled Task Executed at performTaskByFixedDelayInitialDelay = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    }

    // 2초마다 무조건 실행, 작업이 끝나지 않아도 실행 됨
    @Scheduled(fixedRate = 1000)
    public void performTaskByFixedRate() throws InterruptedException {
        StopWatch stopWatch = StopWatch.createStarted();
        Thread.sleep(2000);
        stopWatch.stop();
        log.info("[003] Scheduled Task Executed at performTaskByFixedRate = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    }

    // 3초 기다렸다가 2초마다 실행, 작업이 끝나지 않아도 실행 됨
    @Scheduled(fixedRate = 1000, initialDelay = 1000)
    public void performTaskByFixedRateInitialDelay() throws InterruptedException {
        StopWatch stopWatch = StopWatch.createStarted();
        Thread.sleep(1000);
        stopWatch.stop();
        log.info("[004] Scheduled Task Executed at performTaskByInitialDelay = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    }

    // crontab 사용
    @Scheduled(cron = "10 * * * * *") // 10초마다 동작
    public void performTaskByCron() throws InterruptedException {
        StopWatch stopWatch = StopWatch.createStarted();
        Thread.sleep(1000);
        stopWatch.stop();
        log.info("[005] Scheduled Task Executed at performTaskByCron = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    }
}
```

- 스케쥴러를 구현할 클래스 작성
  - 유의할 부분은 스케쥴러 클래스가 빈에 등록되어 있어야 함
    - @Component 어노테이션 사용 -> Bean로 등록
- 스프링 스케쥴러 관련 설정은 아래와 같음

## 01-3. @Scheduled

### fixedDelay

```java
@Scheduled(fixedDelay = 1000)
public void performTaskByFixedDelay() throws InterruptedException {
    log.info("[001] Scheduled Task Executed at performTaskFixedDelay = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    // 중간 비즈니스 로직이 있다고 가정
    // 해당 로직은 3s 정도 시간이 걸림
}
```

- 이전 작업이 종료된 시점을 기준으로 지정된 시간 기다린 후 시작
- 비즈니스 로직 작업 소요 시간(3s) -> 4s 있다가 -> 스케쥴러 실행

### fixedRate

```java
@Scheduled(fixedRate = 1000)
public void performTaskByFixedRate() throws InterruptedException {
    log.info("[002] Scheduled Task Executed at performTaskByFixedRate = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    // 중간 비즈니스 로직이 있다고 가정
    // 해당 로직은 3s 정도 시간이 걸림
}
```

- 이전 작업이 종료되든 말든, 지정된 시간 기다린 후 시작
- 비즈니스 로직 작업 소요 시간(3s) -> 3초 무시하고 -> 스케쥴러 실행

### initialDelay

```java
// initialDelay -> 최초 1번 실행
@Scheduled(fixedDelay = 1000, initialDelay = 3000)
public void performTaskByFixedDelayInitialDelay() throws InterruptedException {
    log.info("[003] Scheduled Task Executed at performTaskByFixedDelayInitialDelay = {}", stopWatch.getTime(TimeUnit.MILLISECONDS) + '\n');
    // 중간 비즈니스 로직이 있다고 가정
    // 해당 로직은 3s 정도 시간이 걸림
}
```

- 스케쥴러 시작 후 최초로 기다리는 시간
- 즉, 해당 메서드의 스케쥴러가 시작한 후 최초 지연 시간 의미
- 스케쥴러 시작 후 3s 기다림 -> 해당 메서드 실행 -> 1s 마다 반복

### cron

```java
1 2 3 4 5 6  // 순서
* * * * * *  // 실행주기 문자열

// 순서별 정리
1. 초(0-59)
2. 분(0-59)
3. 시간(0-23)
4. 일(1-31)
5. 월(1-12)
6. 요일(0-7)
```

- cron 표현식 사용
  - 초(second), 분(minute), 시(hours), 일(day), 월(month), 요일(week)
  - cron 설정은 yml 파일로 빼는게 관리 측면에서 좋음

### zone

- cron 표현식 실행 시 Timezone 설정
- zone = "Asia/Seoul"

## 99. 참고 자료

- [Spring Boot Scheduler(Cron) 사용방법](https://dbjh.tistory.com/56)
- [@Scheduled를 이용한 스케쥴러 구현하기](https://velog.io/@developer_khj/Spring-Boot-Scheduler-Scheduled)