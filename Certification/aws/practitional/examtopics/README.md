# AWS Practitional examtopics 문제 풀이

> 출처 : [[AWS] examtopics](https://www.examtopics.com/exams/amazon/aws-certified-cloud-practitioner)

## Question 01

> ✅

한 회사가 AWS 클라우드에서 글로벌 마케팅 애플리케이션을 실행할 계획입니다. 이 애플리케이션에는 사용자가 볼 수 있는 동영상이 포함되어 있습니다. 회사는 모든 사용자가 짧은 지연 시간으로 이러한 동영상을 볼 수 있도록 해야 합니다. 이 요구 사항을 충족하려면 어떤 AWS 서비스를 사용해야 하나요?

A. AWS Auto Scaling
B. Amazon Kinesis Video Streams
C. Elastic Load Balancing
D. Amazon CloudFront

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

AWS CloudFront 기능은 AWS에서 제공하는 CDN 서버라고 봐도 된다.
</div>
</details>

## Question 02

인프라 또는 서비스 중단으로부터 시스템을 복구하고 수요를 충족하기 위해 동적으로 컴퓨팅 리소스를 확보할 수 있는 기능을 의미하는 AWS Well-Architected Framework의 한 축은 무엇인가요?

> ✅

A. Security
B. Reliability
C. Performance efficiency
D. Cost optimization

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

시스템의 신뢰성과 복구 능력에 초점을 맞춘 개념은 B. Reliability
</div>
</details>

## Question 03

다음 중 AWS 클라우드로 마이그레이션하는 데에는 어떤 이점이 있습니까? (두 가지를 선택하세요.)

> ✅

A. 운영 회복력
B. Amazon.com의 제품에 대한 할인
C. 비즈니스 민첩성
D. 비즈니스 우수성
E. 직원 유지율 증가

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A, C
</div>
</details>

## Question 04

어떤 회사가 물리적 온프레미스 컴퓨팅 서버를 AWS 서버리스 컴퓨팅 서비스로 교체할 계획입니다. 이 회사는 마이그레이션 후 빠르게 첨단 기술을 활용할 수 있기를 원합니다.
이 계획은 AWS Well-Architected Framework의 어떤 기둥을 나타냅니까?

> ❌

A. 보안
B. 성능 효율성
C. 운영 우수성
D. 신뢰성

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B
</div>
</details>

## Question 05

대기업에는 여러 부서가 있습니다. 각 부서에는 자체 AWS 계정이 있습니다. 각 부서는 Amazon EC2 예약 인스턴스를 구매했습니다. 일부 부서는 구매한 예약 인스턴스를 모두 사용하지 않으며, 다른 부서에서는 구매한 것보다 더 많은 예약 인스턴스가 필요합니다. 회사는 모든 부서의 AWS 계정을 관리하여 부서에서 예약 인스턴스를 공유할 수 있도록 해야 합니다. 이러한 요구 사항을 충족하려면 어떤 AWS 서비스 또는 도구를 사용해야 하나요?

> ✅

A. AWS Systems Manager
B. Cost Explorer
C. AWS Trusted Advisor
D. AWS Organizations

<details>
<summary>정답 보기</summary>
<div markdown="1">
Most Voted: D, 정답은: B
</div>
</details>

## Question 06

AWS 글로벌 인프라의 어느 구성 요소가 중복된 전원, 네트워킹 및 연결성을 갖춘 하나 이상의 개별 데이터 센터로 구성되어 있습니까?

> ✅

A. AWS 지역
B. 가용성 영역 가장 많이 투표된
C. 에지 위치
D. AWS 아웃포스트

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

개별 데이터 센터라는 키워드를 통해 가용영역을 의미하는 것으로 판단.  
만약 리전이면 하나의 리전에 여러개의 데이터 센터가 존재할 수 있기 때문이다.
</div>
</details>

## Question 07

AWS Lambda를 사용하는 회사는 어떤 업무를 담당합니까? (두 가지를 선택하세요.)
(영문) Which duties are the responsibility of a company that is using AWS Lambda? (Choose two.)

> ❌

A. 코드 내부의 보안
B. CPU 리소스 선택
C. 운영체제 패치
D. 코드 작성 및 업데이트
E. 기반 인프라의 보안

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A, D

이 질문에서는 Lambda를 사용하는 회사가 어떤 책임을 가져야 하는지를 묻는 질문이다.  
Lambda는 서버리스 컴퓨팅 서비스로, AWS가 많은 인프라 관리 작업을 처리해 주지만,  
Lmbda의 코드를 작성하고 수정하는 작업은 개발자에게 책임이 주어지며 보안도 개발자의 책임.  
</div>
</details>

## Question 08

어떤 AWS 서비스나 기능이 Amazon EC2 인스턴스에 대한 재해 복구 솔루션을 제공합니까? (두 가지를 선택하세요.)

> ❌

A. ׀•׀¡2 예약 인스턴스
B. EC2 Amazon 머신 이미지(AMI)
C. Amazon Elastic Block Store(Amazon EBS) 스냅샷
D. AWS 실드
E. 아마존 가드듀티

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, C

AMI는 특정 시점의 EC2 인스턴스 상태를 캡처한 이미지. 해당 AMI 이미지를 통해 복구 가능.  
EBS 스냅샷 역시 특정 EBS 볼륨의 상태를 캡처하여 저장하는 기능, 손상된 데이터 복구 가능
</div>
</details>

## Question 09

한 회사가 온프레미스에서 인프라를 실행하는 대신 AWS 클라우드로 마이그레이션하려고 합니다. 다음 중 이 마이그레이션의 장점은 무엇인가요? (두 가지를 선택하세요.)

> ✅

A. Elimination of the need to perform security auditing
B. Increased global reach and agility
C. Ability to deploy globally in minutes
D. Elimination of the cost of IT staff members
E. Redundancy by default for all compute services

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, C

AWS 클라우드를 사용하여 인터넷을 통해 전 세계 어디든 빠르고 쉽게 배포가 가능하다.  
D를 정답이라고 하는 경우도 있는데, 직원이 줄어들수도 있지만 오히려 늘어나야할수도 있다.
</div>
</details>

## Question 10

사용자가 Amazon EC2와 Amazon RDS에서 실행되는 애플리케이션에 대한 구매 옵션을 비교하고 있습니다. 애플리케이션은 어떠한 중단도 견뎌낼 수 없습니다. 애플리케이션은 예측 가능한 양의 사용량을 경험하며, 한 번에 몇 주 동안만 지속되는 계절적 급증도 포함됩니다. 애플리케이션을 수정할 수 없습니다.
이러한 요구 사항을 가장 비용 효율적으로 충족하는 구매 옵션은 무엇입니까?

> ❌

A. AWS Marketplace를 검토하고 예상되는 부하와 계절적 부하를 충당하기 위해 부분 선불 예약 인스턴스를 구매하세요.
B. 일년 내내 예상되는 사용량에 대한 예약 인스턴스를 구매합니다. 모든 계절적 사용량을 스팟 인스턴스에서 실행하도록 허용합니다.
C. 일년 내내 예상되는 사용량에 대한 예약 인스턴스를 구매합니다. 계절별 사용량은 주문형 요금으로 실행되도록 허용합니다.
D. 계절별 사용으로 인해 발생할 수 있는 모든 잠재적 사용량을 포괄하기 위해 예약 인스턴스를 구매하세요.

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: C

중단 없이 비용 효율 + 예측 가능한 일년 내내 사용량에 대해 비용 효율 가능

A. AWS Marketplace 애플리케이션 S/W 구매에 관련된 서비스, 해당 시나리오와 맞지 않음
B. 스팟 인스턴스는 저렴, 언제든 종료 가능 + 애플리케이션 중단 됨
D. 모든 사용량을 예약 인스턴스 -> 불필요한 비용 발생
</div>
</details>

## Question 11

한 회사에서 지난 1년간 Amazon EC2 및 Amazon RDS를 사용한 월별 비용을 검토하려고 합니다. 이 정보를 제공하는 AWS 서비스 또는 도구는 무엇인가요?

> ✅

A. AWS Trusted Advisor
B. Cost Explorer
C. Amazon Forecast
D. Amazon CloudWatch

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

비용 관련은 Cost Explorer

AWS Trusted Advisor는 비용 최적화, 성능 개선, 보안 격차 해소 관련 서비스
Amazon Forecase는 `기계학습 기반 수요 예측 서비스`
AWS Cloudwatch는 메트릭 수집 및 로그 추적 및 대시보드 구성을 위한 서비스
</div>
</details>

## Question 12

한 회사에서 중요한 애플리케이션을 AWS로 마이그레이션하려고 합니다. 애플리케이션의 런타임이 짧습니다. 애플리케이션은 데이터의 변경 또는 시스템 상태의 변화에 따라 호출됩니다. 회사는 운영 효율성을 극대화하고 애플리케이션 실행 비용을 최소화하는 컴퓨팅 솔루션이 필요합니다. 이러한 요구 사항을 충족하기 위해 어떤 AWS 솔루션을 사용해야 하나요?

> ✅

A. Amazon EC2 On-Demand Instances
B. AWS Lambda
C. Amazon EC2 Reserved Instances
D. Amazon EC2 Spot Instances

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

애플리케이션의 런타임이 짧다. 이 말인 즉슨 실행 되고 바로 종료가 된다는 말이다.  
서버리스 서비스인 람다가 제일 적합하며, 런타임 종료 시 비용 안나감.
</div>
</details>

## Question 13

사용자가 프로그래밍 방식으로 AWS 서비스에 연결하고 배포할 수 있는 AWS 서비스 또는 기능은 무엇인가요?

> ✅

A. AWS Management Console
B. AWS Cloud9
C. AWS CodePipeline
D. AWS software development kits (SDKs)

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

SDK: AWS 서비스와 프로그래밍 방식으로 상호작용 할 수 있는 유일한 옵션

AWS Management Console: UI 기반 제어
AWS Cloud9: 클라우드 기반 IDE 제공, AWS 서비스와 상호작용하는 코드 작성 가능하지만 여튼 아님
AWS CodePipeline: CI/CD 파이프라인 자동화, 프로그래밍 방식은 아닌듯
</div>
</details>

## Question 14

한 회사가 Amazon S3를 사용하는 데이터 레이크를 만들 계획입니다. 비용에 가장 큰 영향을 미치는 요소는 무엇인가요?

> ❌

A. The selection of S3 storage tiers
B. Charges to transfer existing data into Amazon S3
C. The addition of S3 bucket policies
D. S3 ingest fees for each request

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A

S3는 스토리지 티어(S3 Standard, S3 Intelligence-tiering, S3 Glacier 등)에 따라 비용에 가장 큰 영향을 미침.

B. Charges to transfer existing data into Amazon S3
기존 데이터를 Amazon S3로 전송하는 비용은 초기 데이터 전송시에만 발생하는 일회성 비용

C. The addition of S3 bucket policies
버킷 정책 자체는 비용 없음, 비용에 미치는 직접적인 영향도 없음

D. S3 ingest fees for each request
S3에 데이터를 업로드 하는 비용(ingest fee)은 Amazon S3에서 매우 미미하거나 없을 수 있음.  
S3는 데이터 업로드에 비용 부과 안함, 읽거나 전송하는 비용이 더 중요함
</div>
</details>

## Question 15

한 회사에서 항상 사용 가능해야 하는 전자 상거래 애플리케이션을 출시하려고 합니다. 이 애플리케이션은 향후 12개월 동안 Amazon EC2 인스턴스에서 지속적으로 실행될 예정입니다. 이러한 요구 사항을 충족하는 가장 비용 효율적인 인스턴스 구매 옵션은 무엇인가요?

> ❌

A. Spot Instances
B. Savings Plans Most Voted
C. Dedicated Hosts
D. On-Demand Instances

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

Saving Plans는 1년 or 3년 동안 일정한 사용량을 약정함으로써 장기적으로 EC2 비용 절감 가능.  
해당 옵션은 지속적으로 실행될 애플리케이션에 매우 적합, On-Demand Instance에 비해 72%까지  
비용 절감 가능.

기간이 정해져있고, 12개월동안 지속적으로 실행한다면 Saving Plan 이 적합함.

Spot Instance는 저렴하지만, 종료 가능성 있음

Dedicated Hosts는 AWS EC2 인스턴스를 물리적인 서버에서 독점으로 사용 가능.  
이는 다른 고객과 서버를 공유하지 않겠다는 의미. 비용 비쌈

On-Demand Instances는 유연성 있음, 장기 사용 비효율적 비용에 있어서
</div>
</details>

## Question 16

어떤 AWS 서비스 또는 기능을 사용하여 어떤 사업부가 특정 AWS 리소스를 사용하고 있는지 확인할 수 있나요?

> ✅

A. Cost allocation tags
B. Key pairs
C. Amazon Inspector
D. AWS Trusted Advisor

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: 1번

AWS 리소스에 태그를 할당하여 비용 추적 및 관리 가능.  
key-value 형태로 태그 달고, cost explorer를 통해 특정 사업부의 비용 확인 가능.

key pairs는 aws access_key, secret_key, ec2에 접근하기 위한 pem key를 의미

AWS Trusted Advisor는 비용 최적화, 보안 관련, 성능 최적화의 권장 사항을 제안해주는 서비스

Amazon Inspector는 `인프라 보안 취약점 평가 도구`
</div>
</details>

## Question 17

A company wants to migrate its workloads to AWS, but it lacks expertise in AWS Cloud computing.

Which AWS service or feature will help the company with its migration?

> 💡 애매함

A. AWS Trusted Advisor
B. AWS Consulting Partners
C. AWS Artifacts
D. AWS Managed Services

[번역] 회사에서 워크로드를 AWS로 마이그레이션하고 싶지만 AWS 클라우드 컴퓨팅에 대한 전문 지식이 부족합니다.
회사의 마이그레이션에 도움이 되는 AWS 서비스 또는 기능은 무엇입니까?


<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

정답이 D라고 나왔지만 AWS Managed Service를 사용한다고 AWS 지식이 해소되는건 아닌 것 같음.  
그것보다 AWS 협력사와 같이 일하면서 컨설팅 받는게 200배는 좋을 듯.
</div>
</details>

## Question 18

Which AWS service or tool should a company use to centrally request and track service limit increases?

A. AWS Config
B. Service Quotas
C. AWS Service Catalog
D. AWS Budgets

[번역] 회사에서 서비스 한도 증가를 중앙에서 요청하고 추적하기 위해 어떤 AWS 서비스 또는 도구를 사용해야 합니까?

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

`Service Quotas`는 AWS `서비스 한도`를 `중앙`에서 `관리`

`AWS Config`는 리소스 변경 모니터링 및 규정 준수 여부 확인하는 서비스

AWS Budgets는 예산 관련 경고를 날리거나 하는거지, 한도랑은 상관 없음
</div>
</details>

## Question 19

Which documentation does AWS Artifact provide?

A. Amazon EC2 terms and conditions
B. AWS ISO certifications
C. A history of a company's AWS spending
D. A list of previous-generation Amazon EC2 instance types

[번역] AWS Artifact는 어떤 문서를 제공합니까?

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

AWS Artifact는 AWS의 규정 준수 및 보안 관련 문서와 보고서를 제공하는 서비스.  
ISO 인증서와 같은 AWS의 규제 문서가 포함된다. 고객은 AWS Artifact를 통해 이러한 문서를  
다운로드하여 자신의 규정 준수 요구 사항을 충족 가능.

EC2 이용약관(terms and conditions)는 공식문서 참고

회사 AWS 이전 지출은 Cost에서 확인

이전 EC2 인스턴스 타입은 공식문서 참고
</div>
</details>

## Question 20

Which task requires using AWS account root user credentials?

A. Viewing billing information
B. Changing the AWS Support plan
C. Starting and stopping Amazon EC2 instances
D. Opening an AWS Support case

[번역] AWS 계정 루트 사용자 자격 증명을 사용해야 하는 작업은 무엇입니까?

A. 결제 정보 보기
B. AWS Support 플랜 변경
C. Amazon EC2 인스턴스 시작 및 중지
D. AWS Support 사례 열기

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

`AWS Support Plan 변경은 모든 계정에 적용됨, root 사용자만 가능`

결제 정보 보기는 root 사용자가 IAM 유저 추가 가능

Amazon EC2 인스턴스 시작 및 중지는 IAM 유저도 가능

AWS Support 사례 열기 이것도 IAM 유저가 권한만 있으면 가능
</div>
</details>

## Question 21

## Question 22

## Question 23

## Question 24

## Question 25

## Question 26

## Question 27

## Question 28

## Question 29

## Question 30

## Question 31

## Question 32

## Question 33

## Question 34

## Question 35

## Question 36

## Question 37

## Question 38

## Question 39

## Question 40

## Question 41

## Question 42

## Question 43

## Question 44

## Question 45

## Question 46

## Question 47

## Question 48

## Question 49

## Question 50

## Question 51

## Question 52

## Question 53

## Question 54

## Question 55

## Question 56

## Question 57

## Question 58

## Question 59

## Question 60

## Question 61

## Question 62

## Question 63

## Question 64

## Question 65

## Question 66

## Question 67

## Question 68

## Question 69

## Question 70

## Question 71

## Question 72

## Question 73

## Question 74

## Question 75

## Question 76

## Question 77

## Question 78

## Question 79

## Question 80

## Question 81

## Question 82

## Question 83

## Question 84

## Question 85

## Question 86

## Question 87

## Question 88

## Question 89

## Question 90

## Question 91

## Question 92

## Question 93

## Question 94

## Question 95

## Question 96

## Question 97

## Question 98

## Question 99

## Question 100

## 99. 참고 자료

- [[AWS] Cloud Practitioner 덤프 문제 풀이 - 4/59](https://hagsig.tistory.com/125)
- [[AWS] examtopics](https://www.examtopics.com/exams/amazon/aws-certified-cloud-practitioner/view/2/)