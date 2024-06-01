# 01. Spring Cache

> 이번 시간에는 Spring Boot에서 제공하는 Cache 기능에 대해 간단히 사용해보자  
> 원래 Cache를 적용 할때는 Redis와 같은 별도의 글로벌 저장소를 활용하는게 일반적이다  
> 하지만 이번에는 간단히 Spring Boot의 기본 캐시인 ConcurrentMapCache를 사용한다

## 01-1. 서론

> 캐시란 동일한 요청이 들어오면 복잡한 작업을 수행해서 만드는 대신 이미 보관된 결과를 바로 돌려주는 방식  
> 참고 : [기억보다 기록을 : SpringBoot + Ehcache 기본 예제 및 소개](https://jojoldu.tistory.com/57)

- 즉, `캐시`는 `서버 부하를 감소`하고 `성능을 높히고자` 사용하는 기술
- 필자의 회사에서는 `실시간 인기 검색어(10분 주기)`와 `TOP 200 실시간 차트(1시간 주기)`에 사용되고 있다
- 이렇듯 `데이터`가 `유동적으로 변하지 않고` `빈번한 호출`이 있는 경우 우리는 `캐시` 를 사용한다
- 이어서 Spring Boot의 Cache 셋팅을 진행 해보자

## 01-2. build.gradle

```groovy
dependencies {
    // spring boot cache dependencies 추가
    implementation 'org.springframework.boot:spring-boot-starter-cache'
    runtimeOnly 'com.h2database:h2'
}
```

> 참고 : [Spring Boot 에서 Cache 사용하기](https://bcp0109.tistory.com/385)

- 우선 `build.gradle` 파일에 `spring cache dependencies`를 `추가`한다
- 사실 spring-boot-starter-cache를 추가하지 않아도 캐시 기능은 사용이 가능
  - springb-boot-starter-web 스타터 모듈에 자동으로 포함되어 있는 spring-context 모듈 덕분
  - Spring 3.0.5 가이드를 보면 spring-boot-starter-cache 모듈을 추가해야  
  spring-context-support 모듈을 가져와서 캐시 관련된 여러 기능을 제공한다고 한다
  - 위와 같은 이유로 인해 의존성을 추가한다
- 다음으로는 Cache 객체를 Bean으로 등록하기 위해 Configuration 클래스를 생성한다

## 01-3. Configuration

```java
package com.spring.practice.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

// @SpringBootApplication에 추가해도 되지만, 어차피 캐시 설정을 위해 config 클래스 사용한다면 여기에 추가해도 됨
@EnableCaching
@Configuration
public class CachingConfig {

    /**
     * ConcurrentMapCacheManager
     * - 스레드 안정성 제공(동시성 제어 해준다는 의미)
     * - 요청 시 자동으로 캐시 생성, 개발자가 직접 만들 필요 없음
     * - SimpleCacheManager에 비해 다양한 캐시 기능 없음, ConcurrentMap만 내부적으로 사용
     */
    @Bean // spring IoC 컨테이너에 의해 관리가 되어지는 bean 객체로 등록
    public CacheManager cacheManager() {
        ConcurrentMapCacheManager cacheManager = new ConcurrentMapCacheManager();
        //cacheManager.setCacheNames(List.of("member-list-caches"));
        cacheManager.setCacheNames(List.of("member-id-caches"));
        cacheManager.setAllowNullValues(false);
        return cacheManager;
    }

    /**
     * SimpleCacheManager
     * - 스레드 안정성 제공 안함, 개발자가 직접 동시성 제어 필요(CacheService + 함수 레벨 synchronized 사용)
     * - 캐시(Cache) 인스턴스 미리 설정(생성)해야 함
     * - 다양한 캐시 구현체 사용 가능하도록 유연성 제공
     */
    /*@Bean
    public CacheManager cacheManager() {
        SimpleCacheManager cacheManager = new SimpleCacheManager();
        List<Cache> caches = new ArrayList<>();
        caches.add(new ConcurrentMapCache("hot-trendwords-cache"));
        caches.add(new ConcurrentMapCache("deily-trendwords-cache"));
        cacheManager.setCaches(caches);
        return cacheManager;
    }*/
}
```

- Cache 사용을 위해 CacheConig 클래스 추가
- @EnableCaching
  - 캐싱 기능 활성화
- @Configuration
  - bean을 등록할 때 `싱글톤`(singleton)이 되도록 보장
  - `스프링 IoC 컨테이너`에서 `bean을 관리`할 수 있게 됨
- Spring Boot에서 Cache Manager를 사용하는 방식은 아래 2가지다(2개다 CacheManager 인터페이스 구현)
  - ConcurrentCacheManager
    - `스레드 안정성 제공`(동기화 -> 동시성 제어 해줌)
    - 요청 시 `자동`으로 `캐시 객체 생성`, 개발자가 직접 만들 필요 없음
    - SimpleCacheManager에 비해 `다양한 캐시 기능 없음`, `ConcurrentMap`만 내부적 사용
  - SimpleCacheManager
    - `스레드 안정성 제공 안함`(동기화 -> 동시성 제어 안해줌), 개발자가 직접 동시성 제어 필요
      - CacheService를 모듈화 시켜서 사용
      - 이때 `synchronized` 키워드를 `함수`에 붙혀서 제어
    - `캐시`(new ConcurrentMapCache) `인스턴스 미리 생성` 해야 함
    - 다양한 캐시 구현체 사용 가능
- member-id-caches 이름으로 서버의 메모리(JVM Heap)에 해당 이름으로 해시 테이블 생성

```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cache")
public class CacheController {

    private final CacheService cacheService;

    @Autowired
    public CacheController(CacheService cacheService) {
        this.cacheService = cacheService;
    }

    // 캐시 추가
    @PostMapping("/put")
    public String put(@RequestParam String key, @RequestParam String value) {
        cacheService.put(key, value);
        return "Value cached successfully";
    }

    // 캐시 조회
    @GetMapping("/get")
    public String get(@RequestParam String key) {
        Object value = cacheService.get(key);
        return value != null ? "Cached value: " + value : "No value found in cache";
    }
}
```

```java
// 단일 캐시 처리만 필요한 경우 사용
public class CacheService {
    private final Cache cache;

    public CacheService(Cache cache) {
        this.cache = cache;
    }

    public synchronized void put(String key, Object value) {
        cache.put(key, value);
    }

    // 동기화 직접 해야함
    public synchronized Object get(String key) {
        Cache.ValueWrapper valueWrapper = cache.get(key);
        return valueWrapper != null ? valueWrapper.get() : null;
    }
}
```

## 01-4. Cache 어노테이션 사용

```java
// 안좋은 예시 : Cache를 내부에서 호출하는 경우
@Service
public class CacheService {
    
    @Cacheable("sampleCache")
    public String getData(String key) {
        return "Data for " + key;
    }

    public String getCacheData(String key) {
        // 내부 호출은 @Cacheable("sampleCache") 동작 안함
        return getData(key);
    }
}
```

```java
// 올바른 예시 : Cache를 외부에서 호출하는 경우
@Service
public class CacheService {
    
    @Cacheable("sampleCache")
    public String getData(String key) {
        return "Data for " + key;
    }
}

// 컨트롤러(외부) 에서 캐시 Service 호출
@RestController
public class CacheController {

    @Autowired
    private CacheService cacheService;

    @GetMapping("/cache")
    public String getCachedData(@RequestParam String key) {
        return cacheService.getData(key);
    }
```

- 위와 같이 설정을 하면 이제 Spring Boot에서 Cache 사용이 가능하다
- `캐시 어노테이션(@Cacheable(등록), @CachePut(수정), @CacheEvict(삭제))`은 내부적으로 `AOP`로 동작하기에 내부 호출은 피해야한다(위 소스 참고)
  - `Spring AOP`는 `같은 클래스에서 메서드 호출` 시, `AOP 프록시가 적용되지 않음`
  - `AOP`는 `프록시 기반 동작`하는데 `프록시`의 경우 `Spring 컨테이너가 관리하는 빈 외부에서 호출`될 때 적용
  - 클래스 내에서 자기 자신의 메서드 호출 시 프록시가 아닌 실제 메서드 호출 -> AOP 적용 안됨

### @Cacheable

> 사용자 요청 -> key에 맞는 데이터를 캐시에서 찾고 있으면 바로 반환

- 사용자 `요청 데이터`를 `캐시에 저장`할 때 사용
- 캐시 호출 순서
  - 메서드 호출 시 캐시 키(key)와 값(value) 먼저 확인, key에 맞는 데이터 존재시 해당 데이터 반환
  - 만약 key에 맞는 데이터가 없으면 메서드 호출 결과를 캐시에 저장 후 데이터 반환

### @CachePut

> 사용자 요청 -> key에 맞는 데이터를 캐시에서 찾고 갱신

- @Cacheable과 비슷하게 데이터를 캐시에 저장
- `차이점`은 `@Cacheable`은 `캐시에 데이터가 존재하면 메서드를 수행하지 않음`, `@CachePut은 항상 메서드 수행`
- 주로 캐시 데이터를 갱신할 때 사용이 된다

### @CacheEvict

- 캐시에 있는 데이터 삭제
- `key`를 기반으로 삭제 가능
- `allEntries`를 통해 `모든 캐시 삭제 가능`
- beforeInvocation 속성을 통해 메서드 전/후로 캐시 삭제 가능
  - beforeInvocation `true` : 메서드 호출 전 캐시 삭제
  - beforeInvocation `false` : 메서드 호출 후 캐시 삭제

### @Caching

```java
@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Caching(
        put = {
            @CachePut(value = "members", key = "#member.id"),
        },
        evict = {
            @CacheEvict(value = "membersCache", allEntries = true)
        }
    )
    public Member saveMember(Member member) {
        return memberRepository.save(member);
    }
}
```

- Cache에 대한 `여러 동작`(@CachePut, @CacheEvict)을 `수행`하고자 할 때 사용

> 지금까지 Cache에 대해 간단히 알아보았으니, 지금부터 실습을 진행 해보자

# 02. 실습 진행

## 02-1. Domain 클래스 정의

```java
package com.spring.practice.domain.member.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * @NoArgsConstructor 사용 이유?
 * - JPA의 기본 스펙에 따라, 엔티티 클래스는 기본 생성자 필요 + JPA가 리플랙션 사용하여 객체 사용 시 기본 생성자 사용
 * - JPA는 지연 로딩을 위해 프록시 객체 생성 -> 이때 기본 생성자 사용 -> 기본 생성자 없으면 오류 발생 할 수 있음
 */
@Getter
@NoArgsConstructor
@Entity
@Table(name = "member")
public class Member {

    // org.h2.jdbc.JdbcSQLSyntaxErrorException: Sequence "HIBERNATE_SEQUENCE" not found; SQL statement:
    // https://mungmange.tistory.com/entry/Sequence-HIBERNATESEQUENCE-not-found
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String memberName;

    @Column(nullable = false)
    private Integer memberAge;

    @Builder
    public Member(Long id, String memberName, Integer memberAge) {
        this.id = id;
        this.memberName = memberName;
        this.memberAge = memberAge;
    }

    /**
     * 회원 정보 수정 - Dirty Checking
     */
    public void updateMember(String memberName, Integer memberAge) {
        this.memberName = memberName;
        this.memberAge = memberAge;
    }
}
```

```java
package com.spring.practice.domain.member.repository;

import com.spring.practice.domain.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {

}
```

- 우선 회원 정보 조회를 위해 간단한 Member 엔티티, 리포지토리 생성
- 다음으로는 Service 생성을 진행 한다

## 02-2. MemberService

```java
package com.spring.practice.service;

import com.spring.practice.domain.member.entity.Member;
import com.spring.practice.domain.member.repository.MemberRepository;
import com.spring.practice.web.dto.request.MemberRequest;
import com.spring.practice.web.dto.response.MemberResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class MemberService {

    private final MemberRepository memberRepository;
    private final CacheManager cacheManager;

    /**
     * @Cacheable
     * - Spring Boot에서 해당 어노테이션을 통해 캐싱 기능 제공
     * - 캐시는 메서드의 리턴(return)값 과, 파라미터를 저장할 내용으로 주 타깃으로 삼는다
     * - 보통 함수 단위에 설정, 클래스 + 인터페이스에 캐시 하는일은 드문 일
     * - @Cacheable -> 캐싱 수행 or 캐싱 적용 어노테이션
     *
     * @Mechanism
     *  - 1) 함수 호출 시 먼저 캐시에서 해당 키 검색
     *  - 2) 키가 존재하면 캐시된 값 반환, 함수는 실행되지 않음
     *  - 3) 키가 존재하지 않으면 함수 실행 후 반환값을 캐시에 저장
     *  - 4) unless 속성을 통해 캐시에 저장하지 않을 조건 지정 가능
     *
     * value
     * - 캐시의 이름 지정(캐시로 사용할 이름)
     *
     * key
     * - 캐시의 키 지정(캐시의 키로 사용할 값), 해당 key로 캐시에 저장된 데이터를 찾음
     *
     * unless
     * - 캐시의 조건 지정(캐시에 저장할 조건 지정), 해당 조건이 true면 캐시에 저장하지 않음
     * - 여기서 #result 는 해당 함수의 반환값(return)을 의미
     */
    @Cacheable(value = "member-id-caches", key = "#id", unless = "#result.id == null")
    public MemberResponseDto.MemberInfo getMemberById(Long id) {
        log.info("[Cache::member-id-caches] getMemberById -> id = {}", id);
        return memberRepository.findById(id)
                .map(MemberResponseDto.MemberInfo::toDto)
                .orElseThrow(() -> new IllegalArgumentException("해당 id의 회원이 존재하지 않습니다."));
    }

    /**
     * @CachePut
     * - 메서드를 항상 실행하고 결과를 캐시에 저장
     * - 이미 캐시된 값이 있으면 덮어 씌운다
     * - 캐시된 값을 UPDATE(업데이트) 해야 하는 경우 사용
     *
     * @Mechanism
     * - 1) 함수 호출 시 항상 실행
     * - 2) 메서드 실행 결과를 캐시에 저장 후 캐시 데이터 갱신
     * - 3) 데이터의 UPDATE(업데이트) 발생 시 사용
     */
    @CachePut(value = "member-id-caches", key = "#id")
    @Transactional
    public MemberResponseDto.MemberInfo updateMemberById(Long id, MemberRequest.MemberUpdate memberUpdate) {
        log.info("[Cache::member-id-caches] updateMemberById -> id = {}", id);
        Member member = memberRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("해당 id의 회원이 존재하지 않습니다."));
        member.updateMember(memberUpdate.getMemberName(), memberUpdate.getMemberAge());
        return MemberResponseDto.MemberInfo.toDto(member);
    }

    /**
     * @CacheEvict
     * - 기본적으로 메서드의 키에 해당하는 캐시 제거
     * - 만약 아래와 같이 메서드에 @CacheEvict 적용 하면 같은 id 값을 가진 데이터만 캐시에서 삭제
     * - id 기반으로 하여 특정 데이터 DB에서 삭제 시 캐시의 id 값도 삭제하는 경우 사용할 수 있을 듯
     */
    @CacheEvict(value = "member-id-caches", key = "#id")
    @Transactional
    public void deleteMemberById(Long id) throws InterruptedException {
        log.info("[Cache::member-id-caches] deleteMemberById -> id = {}", id);
        memberRepository.deleteById(id);
    }

    /**
     * allEntries = true: 해당 캐시의 모든 데이터를 삭제
     */
    @CacheEvict(value = "member-id-caches", allEntries = true)
    public void clearMemberIdAll() {
        log.info("[Cache::member-id-caches] clear all caches");
    }

    /**
     * beforeInvocation = true: 메서드 실행 '전'에 캐시를 삭제
     * beforeInvocation = false: 메서드 실행 '후'에 캐시를 삭제
     */
    @CacheEvict(value = "member-id-caches", beforeInvocation = true)
    public void clearMemberIdBeforeInvocation() {
        log.info("[Cache::member-id-caches] clear all caches before invocation");
    }

    /**
     * 회원 저장용
     */
    @Transactional
    public Long saveMember(MemberRequest.MemberSave memberSave) {
        Member saveMember = memberRepository.save(memberSave.toEntity());
        return saveMember.getId();
    }

    /**
     * 모든 캐시 목록 출력
     */
    public void getAllCacheContents() {
        cacheManager.getCacheNames().forEach(cacheName -> {
            Cache cache = cacheManager.getCache(cacheName);
            if (cache != null) {
                log.info("Cache Name = {}", cacheName);
                Object nativeCache = cache.getNativeCache();
                log.info("nativeCache = {}", nativeCache);
                if (nativeCache instanceof ConcurrentHashMap) {
                    ConcurrentHashMap<?, ?> cacheMap = (ConcurrentHashMap<?, ?>) nativeCache;
                    cacheMap.forEach((key, value) -> log.info("cacheMap key = {}, value = {}", key, value));
                }
            }
        });
    }
}
```

- 각 내용에 대해서는 소스 상의 주석으로 표시 해두었습니다

## 02-3. MemberController

```java
package com.spring.practice.web.api;

import com.spring.practice.service.MemberService;
import com.spring.practice.web.dto.request.MemberRequest;
import com.spring.practice.web.dto.response.MemberResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/v1")
@RestController
public class CacheRestController {

    private final MemberService memberService;

    /**
     * 단일 회원 조회
     * @param id : 회원 id
     */
    @GetMapping(value = "/member/{id}")
    public ResponseEntity<MemberResponseDto.MemberInfo> getMemberById(@PathVariable("id") Long id) {
        log.info("[Select One] Test cache, id = {}", id);
        return ResponseEntity.ok(memberService.getMemberById(id));
    }

    /**
     * 단일 회원 수정
     * @param id : 회원 id
     */
    @PutMapping(value = "/member/{id}")
    public ResponseEntity<MemberResponseDto.MemberInfo> updateMemberById(
            @PathVariable("id") Long id,
            @RequestBody @Valid MemberRequest.MemberUpdate memberUpdate,
            BindingResult bindingResult) {
        log.info("[Update] Test cache, id = {}", id);
        if (bindingResult.hasErrors()) return ResponseEntity.badRequest().build();
        return ResponseEntity.ok(memberService.updateMemberById(id, memberUpdate));
    }

    /**
     * 단일 회원 삭제
     * @param id : 회원 id
     */
    @DeleteMapping(value = "/member/{id}")
    public void deleteMemberById(@PathVariable("id") Long id) throws InterruptedException {
        log.info("[Delete] Test cache, id = {}", id);
        memberService.deleteMemberById(id);
    }

    /**
     * 캐시 전체 초기화(삭제)
     */
    @PostMapping(value = "/member/management-caches/all/clear")
    public void clearMemberIdAll() {
        log.info("[Clear] Test cache, all clear");
        memberService.clearMemberIdAll();
    }

    /**
     * 캐시 초기화(함수 호출 전 캐시 삭제 후 로직 진행)
     */
    @PostMapping(value = "/member/management-caches/before/clear")
    public void clearMemberIdBeforeInvocation() {
        log.info("[Clear] Test cache, before clear");
        memberService.clearMemberIdBeforeInvocation();
    }

    /**
     * 회원 등록
     * @param memberSave : 회원 등록 정보
     */
    @PostMapping(value = "/member")
    public ResponseEntity<Long> saveMember(
            @RequestBody @Valid MemberRequest.MemberSave memberSave,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return ResponseEntity.badRequest().build();
        return ResponseEntity.ok(memberService.saveMember(memberSave));
    }

    @GetMapping(value = "/member/management-caches/all")
    public void getAllCacheContents() {
        log.info("[Cache] member-list-caches, member-id-caches");
        memberService.getAllCacheContents();
    }
}
```

## 02-4. API 테스트

```java
2024-06-01 15:08:05.977 DEBUG 21826 --- [nio-8080-exec-7] o.s.web.servlet.DispatcherServlet        : GET "/v1/member/1", parameters={}
2024-06-01 15:08:05.977 DEBUG 21826 --- [nio-8080-exec-7] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped to com.spring.practice.web.api.CacheRestController#getMemberById(Long)
2024-06-01 15:08:05.978  INFO 21826 --- [nio-8080-exec-7] c.s.p.web.api.CacheRestController        : [Select One] Test cache, id = 1
2024-06-01 15:08:05.984  INFO 21826 --- [nio-8080-exec-7] c.spring.practice.service.MemberService  : [Cache::member-id-caches] getMemberById -> id = 1
Hibernate: 
    select
        member0_.id as id1_0_0_,
        member0_.member_age as member_a2_0_0_,
        member0_.member_name as member_n3_0_0_ 
    from
        member member0_ 
    where
        member0_.id=?
...중략
2024-06-01 15:08:24.615 DEBUG 21826 --- [nio-8080-exec-6] o.s.web.servlet.DispatcherServlet        : GET "/v1/member/1", parameters={}
2024-06-01 15:08:24.616 DEBUG 21826 --- [nio-8080-exec-6] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped to com.spring.practice.web.api.CacheRestController#getMemberById(Long)
2024-06-01 15:08:24.616  INFO 21826 --- [nio-8080-exec-6] c.s.p.web.api.CacheRestController        : [Select One] Test cache, id = 1
2024-06-01 15:08:24.617 DEBUG 21826 --- [nio-8080-exec-6] o.s.w.s.m.m.a.HttpEntityMethodProcessor  : Using 'application/json', given [*/*] and supported [application/json, application/*+json, application/json, application/*+json]
2024-06-01 15:08:24.618 DEBUG 21826 --- [nio-8080-exec-6] o.s.w.s.m.m.a.HttpEntityMethodProcessor  : Writing [com.spring.practice.web.dto.response.MemberResponseDto$MemberInfo@711b6443]
2024-06-01 15:08:24.618 DEBUG 21826 --- [nio-8080-exec-6] o.s.web.servlet.DispatcherServlet        : Completed 200 OK
```

- 로컬에서 단일 회원 조회를 여러번 시도
- 로그를 확인해보면 최초 요청은 DB 쿼리 요청이 가고 후에는 캐시에서 가져오고 있다

## 99. 참고 자료

- [[Spring] Spring Boot 에서 Cache 사용하기](https://bcp0109.tistory.com/385)
- [[Spring] 스프링부트 @Cacheable 기본 캐싱](https://haon.blog/spring/caching/)
- [[Spring] 스프링 캐싱 메커니즘에서 @Cacheable과 @Cacheput 차이점은 ?](https://upcurvewave.tistory.com/598)
- [[Spring] SpringBoot + Ehcache 기본 예제 및 소개](https://jojoldu.tistory.com/57)