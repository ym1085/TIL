# 마이그레이션 및 혁신

## AWS Cloud Adoption Framework(AWS CAF)

`AWS Cloud Adoption Framework`(CAF)는 `클라우드`를 `성공`적으로 `도입`하기 위한 `가이드`이다.  
`6가지 관점`으로 `조직`이 `클라우드 전환`을 `준비`하는 `방법`을 설명한다.

### AWS CAF 관점

> 참고 : https://aws.amazon.com/ko/cloud-adoption-framework

1. 비즈니스 관점: `클라우드 도입`이 `회사 목표`에 맞는가?
2. 인력 관점: `인력 구성은 어떤지`? `기술 평가는 어떤지`? `교육 계획 세우기`
3. 거버넌스 관점: `IT 전략`과 `회사 목표`를 `일치`시키고 `위험 관리`
4. 플랫폼 관점: `클라우드`로 `시스템` `설계` 및 `이전`
5. 보안 관점: `클라우드`에서 `데이터 보호` 및 `접근 통제`
6. 운영 관점: `클라우드`로 `원활한 비즈니스 운영 지원`

## AWS Snow 패밀리

`일부 고객`의 경우 `외부`에서 `AWS`로 `데이터`를 `가져와야 하며`, 효율적인 방법을 사용하고 싶어 한다.  
일반적인 방법은 `인터넷 연결`을 통해 `필요한 데이터`를 `복사`하는 것이며, `Direct Connect`를 사용하면 좋다.  
하지만 `대역폭`의 `제한`이 `존재`하기에, 위 작업은 `몇 주` 혹은 `몇 달`까지 `소요`될 수 있다.

예를 들어 1 Gbps인 네트워크는 약 100일 내에 100PB의 데이터를 이동할 수 있다.  
하지만 실제로는 이보다 훨씬 오래 걸리며, 엄청난 비용이 발생한다.

`AWS`는 `이러한 문제`를 `해소`하기 위해 `snow 패밀리`를 `출시`했다.  
`snow 패밀리`는 AWS `snowcone`, AWS `snowball`, AWS `snowmobile`로 구성된다.

- `AWS Snowcone`
  - `엣지 컴퓨팅`이나, `데이터 전송`에 사용
  - 최대 `8TB 데이터`를 저장 가능
  - 사용 방법 : 콘솔 주문 > 디바이스 도착 > 케이블 연결 및 데이터 복사 > AWS에 배송 > 고객 계정에 데이터 복사
- `AWS snowball`
  - 최대 `80TB 데이터`를 저장 가능
  - 2가지 옵션 존재
    - Snowball Edge Compute Optimized Option
      - `42TB HDD` 제공
      - 필요 시 S3와 호환되는 객체 스토리지 제공
    - Snowball Edge Storage Optimized Option
      - 블록 스토리지로 사용할 수 있도록 `80TB HDD` 제공
      - 필요 시 S3와 호환되는 객체 스토리지 제공
  - 사용 방법 : 온프레미스에서 클라우드 전환 시 대량 데이터를 클라우드에 백업할 때 주로 사용
- `AWS snowmobile`
  - `진짜 트럭` 사용
  - `100PB 데이터` 저장 가능
  - `보안 우수`, `GPS 추적`, `CCTV 감시` 가능
  - 사용 방법 : 트럭으로 데이터 운송

## AWS를 통한 혁신

## 모듈 9 요약

## 99. 참고 자료

- [[AWS] 모듈 9. 마이그레이션 및 혁신](https://explore.skillbuilder.aws/learn/course/13522/play/107682/aws-cloud-practitioner-essentials-korean-na-hangug-eo-gang-ui)