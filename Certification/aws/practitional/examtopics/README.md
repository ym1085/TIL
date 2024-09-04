# AWS Practitional examtopics 문제 풀이

> AWS Practitional 자격증 취득을 위한 덤프 문제 풀이

## Question 01

A company is planning to run a global marketing application in the AWS Cloud. The application will feature videos that can be viewed by users. The company must ensure that all users can view these videos with low latency. Which AWS service should the company use to meet this requirement?

A. AWS Auto Scaling  
B. Amazon Kinesis Video Streams  
C. Elastic Load Balancing  
D. Amazon CloudFront

[번역] 회사에서 AWS 클라우드에서 글로벌 마케팅 애플리케이션을 실행할 계획입니다. 응용 프로그램은 사용자가 볼 수 있는 비디오를 제공합니다. 회사는 모든 사용자가 이러한 비디오를 짧은 대기 시간으로 볼 수 있도록 해야 합니다. 회사는 이 요구 사항을 충족하기 위해 어떤 AWS 서비스를 사용해야 합니까?

A. AWS Auto Scaling  
B. Amazon Kinesis 비디오 스트림  
C. 탄력적 로드 밸런싱  
D. Amazon CloudFront

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

AWS CloudFront 기능은 AWS에서 제공하는 CDN 서버라고 봐도 된다.
</div>
</details>

## Question 02

Which pillar of the AWS Well-Architected Framework refers to the ability of a system to recover from infrastructure or service disruptions and dynamically acquire computing resources to meet demand?

A. Security  
B. Reliability  
C. Performance efficiency  
D. Cost optimization

[번역] AWS Well-Architected 프레임워크의 다음 중 인프라 또는 서비스 중단으로부터 복구하고 수요를 충족하기 위해 컴퓨팅 리소스를 동적으로 확보하는 시스템의 기능을 나타내는 요소는 무엇입니까?

A. 보안  
B. 신뢰성  
C. 성능 효율성  
D. 비용 최적화

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

시스템의 신뢰성과 복구 능력에 초점을 맞춘 개념은 B. Reliability
</div>
</details>

## Question 03

Which of the following are benefits of migrating to the AWS Cloud? (Choose two.)

A. Operational resilience  
B. Discounts for products on Amazon.com  
C. Business agility  
D. Business excellence  
E. Increased staff retention

[번역] 다음 중 AWS 클라우드로 마이그레이션할 때의 이점은 무엇입니까? (2개를 선택하세요.)

A. 운영 탄력성  
B. Amazon.com의 제품 할인  
C. 비즈니스 민첩성  
D. 비즈니스 우수성  
E. 직원 유지 증가

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A, C
</div>
</details>

## Question 04

A company is planning to replace its physical on-premises compute servers with AWS serverless compute services. The company wants to be able to take advantage of advanced technologies quickly after the migration. Which pillar of the AWS Well-Architected Framework does this plan represent?

A. Security  
B. Performance efficiency  
C. Operational excellence  
D. Reliability

[번역] 회사는 물리적 온프레미스 컴퓨팅 서버를 AWS 서버리스 컴퓨팅 서비스로 교체할 계획입니다. 이 회사는 마이그레이션 후 고급 기술을 신속하게 활용할 수 있기를 원합니다. 이 계획이 나타내는 AWS Well-Architected 프레임워크의 기둥은 무엇입니까?

A. 보안  
B. 성능 효율성  
C. 운영 우수성  
D. 신뢰성

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B
</div>
</details>

## Question 05

A large company has multiple departments. Each department has its own AWS account. Each department has purchased Amazon EC2 Reserved Instances. Some departments do not use all the Reserved Instances that they purchased, and other departments need more Reserved Instances than they purchased. The company needs to manage the AWS accounts for all the departments so that the departments can share the Reserved Instances. Which AWS service or tool should the company use to meet these requirements?

A. AWS Systems Manager  
B. Cost Explorer  
C. AWS Trusted Advisor  
D. AWS Organizations

[번역] 대기업에는 여러 부서가 있습니다. 각 부서에는 자체 AWS 계정이 있습니다. 각 부서는 Amazon EC2 예약 인스턴스를 구매했습니다. 일부 부서에서는 구매한 모든 예약 인스턴스를 사용하지 않고 다른 부서에서는 구매한 것보다 더 많은 예약 인스턴스가 필요합니다. 부서가 예약 인스턴스를 공유할 수 있도록 회사는 모든 부서의 AWS 계정을 관리해야 합니다. 이러한 요구 사항을 충족하기 위해 회사는 어떤 AWS 서비스 또는 도구를 사용해야 합니까?

A. AWS 시스템 관리자  
B. 비용 탐색기  
C. AWS Trusted Advisor  
D. AWS 조직

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
Most Voted: D, 정답은: B
</div>
</details>

## Question 06

Which component of the AWS global infrastructure is made up of one or more discrete data centers that have redundant  power, networking, and connectivity?

A. AWS Region  
B. Availability Zone  
C. Edge location  
D. AWS Outposts

[번역] AWS 글로벌 인프라의 어떤 구성 요소가 중복 전원, 네트워킹 및 연결이 있는 하나 이상의 개별 데이터 센터로 구성되어 있습니까?

A. AWS 리전  
B. 가용 영역  
C. 엣지 로케이션  
D. AWS 전초기지

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

개별 데이터 센터라는 키워드를 통해 가용영역을 의미하는 것으로 판단.  
만약 리전이면 하나의 리전에 여러개의 데이터 센터가 존재할 수 있기 때문이다.
</div>
</details>

## Question 07

Which duties are the responsibility of a company that is using AWS Lambda? (Choose two.)

A. Security inside of code  
B. Selection of CPU resources  
C. Patching of operating system  
D. Writing and updating of code  
E. Security of underlying infrastructure

[번역] AWS Lambda를 사용하는 회사의 책임은 무엇입니까? (2개를 선택하세요.)

A. 코드 내부 보안  
B. CPU 자원의 선택  
C. 운영체제 패치  
D. 코드 작성 및 업데이트  
E. 기반 인프라의 보안

> ❌

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

Which AWS services or features provide disaster recovery solutions for Amazon EC2 instances? (Choose two.)

A. Reserved Instances  
B. EC2 Amazon Machine Images (AMIs)  
C. Amazon Elastic Block Store (Amazon EBS) snapshots  
D. AWS Shield  
E. Amazon GuardDuty

[번역] Amazon EC2 인스턴스에 재해 복구 솔루션을 제공하는 AWS 서비스 또는 기능은 무엇입니까? (2개를 선택하세요.)

A. 예약 인스턴스  
B. EC2 Amazon 머신 이미지(AMI)  
C. Amazon Elastic Block Store(Amazon EBS) 스냅샷  
D. AWS 쉴드  
E. Amazon GuardDuty

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, C

AMI는 특정 시점의 EC2 인스턴스 상태를 캡처한 이미지. 해당 AMI 이미지를 통해 복구 가능.  
EBS 스냅샷 역시 특정 EBS 볼륨의 상태를 캡처하여 저장하는 기능, 손상된 데이터 복구 가능
</div>
</details>

## Question 09

A company is migrating to the AWS Cloud instead of running its infrastructure on premises. Which of the following are advantages of this migration? (Choose two.)

A. Elimination of the need to perform security auditing  
B. Increased global reach and agility  
C. Ability to deploy globally in minutes  
D. Elimination of the cost of IT staff members  
E. Redundancy by default for all compute services

[번역] 회사는 온프레미스에서 인프라를 실행하는 대신 AWS 클라우드로 마이그레이션하고 있습니다. 다음 중 이 마이그레이션의 장점은 무엇입니까? (2개를 선택하세요.)

A. 보안 감사 수행의 필요성 제거  
B. 글로벌 범위 및 민첩성 증가  
C. 몇 분 안에 전 세계적으로 배포할 수 있는 기능  
D. IT 직원 비용 제거  
E. 기본적으로 모든 컴퓨팅 서비스에 대한 중복성

> ✅
 
<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, C

AWS 클라우드를 사용하여 인터넷을 통해 전 세계 어디든 빠르고 쉽게 배포가 가능하다.  
D를 정답이라고 하는 경우도 있는데, 직원이 줄어들수도 있지만 오히려 늘어나야할수도 있다.
</div>
</details>

## Question 10

A user is comparing purchase options for an application that runs on Amazon EC2 and Amazon RDS. The application cannot sustain any interruption. The application experiences a predictable amount of usage, including some seasonal spikes that last only a few weeks at a time. It is not possible to modify the application. Which purchase option meets these requirements MOST cost-effectively?

A. Review the AWS Marketplace and buy Partial Upfront Reserved Instances to cover the predicted and seasonal load.  
B. Buy Reserved Instances for the predicted amount of usage throughout the year. Allow any seasonal usage to run on Spot Instances.  
C. Buy Reserved Instances for the predicted amount of usage throughout the year. Allow any seasonal usage to run at an On-Demand rate.  
D. Buy Reserved Instances to cover all potential usage that results from the seasonal usage.

[번역] 사용자가 Amazon EC2와 Amazon RDS에서 실행되는 애플리케이션의 구매 옵션을 비교하고 있습니다. 응용 프로그램은 중단을 유지할 수 없습니다. 애플리케이션은 한 번에 몇 주만 지속되는 일부 계절 스파이크를 포함하여 예측 가능한 사용량을 경험합니다. 응용 프로그램을 수정할 수 없습니다. 어떤 구매 옵션이 이러한 요구 사항을 가장 비용 효율적으로 충족합니까?

A. AWS Marketplace를 검토하고 부분 선결제 예약 인스턴스를 구입하여 예측 및 계절적 로드를 처리합니다.  
B. 연중 예상 사용량에 대해 예약 인스턴스를 구매합니다. 모든 계절적 사용량이 스팟 인스턴스에서 실행되도록 허용합니다.  
C. 연중 예상 사용량에 대해 예약 인스턴스를 구매합니다. 계절별 사용량이 온디맨드 요금으로 실행되도록 허용합니다.  
D. 예약 인스턴스를 구매하여 계절적 사용량으로 인한 모든 잠재적 사용량을 처리합니다.

> ❌

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

A company wants to review its monthly costs of using Amazon EC2 and Amazon RDS for the past year. Which AWS service or tool provides this information?

A. AWS Trusted Advisor  
B. Cost Explorer  
C. Amazon Forecast  
D. Amazon CloudWatch

[번역] 한 회사에서 지난 1년 동안 Amazon EC2 및 Amazon RDS를 사용한 월별 비용을 검토하려고 합니다. 이 정보를 제공하는 AWS 서비스 또는 도구는 무엇입니까?

A. AWS Trusted Advisor  
B. 비용 탐색기  
C. 아마존 예측  
D. 아마존 클라우드워치

> ✅

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

A company wants to migrate a critical application to AWS. The application has a short runtime. The application is invoked by changes in data or by shifts in system state. The company needs a compute solution that maximizes operational efficiency and minimizes the cost of running the application. Which AWS solution should the company use to meet these requirements?

A. Amazon EC2 On-Demand Instances  
B. AWS Lambda  
C. Amazon EC2 Reserved Instances  
D. Amazon EC2 Spot Instances

[번역] 회사에서 중요한 애플리케이션을 AWS로 마이그레이션하려고 합니다. 애플리케이션의 런타임이 짧습니다. 응용 프로그램은 데이터 변경 또는 시스템 상태 변경에 의해 호출됩니다. 이 회사는 운영 효율성을 극대화하고 애플리케이션 실행 비용을 최소화하는 컴퓨팅 솔루션이 필요합니다. 이러한 요구 사항을 충족하기 위해 회사는 어떤 AWS 솔루션을 사용해야 합니까?

A. Amazon EC2 온디맨드 인스턴스  
B. AWS 람다  
C. Amazon EC2 예약 인스턴스  
D. Amazon EC2 스팟 인스턴스

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

애플리케이션의 런타임이 짧다. 이 말인 즉슨 실행 되고 바로 종료가 된다는 말이다.  
서버리스 서비스인 람다가 제일 적합하며, 런타임 종료 시 비용 안나감.
</div>
</details>

## Question 13

Which AWS service or feature allows users to connect with and deploy AWS services programmatically?

A. AWS Management Console  
B. AWS Cloud9  
C. AWS CodePipeline  
D. AWS software development kits (SDKs)

[번역] 사용자가 프로그래밍 방식으로 AWS 서비스에 연결하고 배포할 수 있는 AWS 서비스 또는 기능은 무엇입니까?

A. AWS 관리 콘솔  
B. AWS 클라우드9  
C. AWS 코드 파이프라인  
D. AWS 소프트웨어 개발 키트(SDKs)

> ✅

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

A company plans to create a data lake that uses Amazon S3. Which factor will have the MOST effect on cost?

A. The selection of S3 storage tiers  
B. Charges to transfer existing data into Amazon S3  
C. The addition of S3 bucket policies  
D. S3 ingest fees for each request

[번역] 회사는 Amazon S3를 사용하는 데이터 레이크를 만들 계획입니다. 비용에 가장 큰 영향을 미치는 요소는 무엇입니까?

A. S3 스토리지 계층 선택  
B. 기존 데이터를 Amazon S3로 전송하기 위한 요금  
C. S3 버킷 정책 추가  
D. 각 요청에 대한 S3 수집 수수료

> ❌

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

A company is launching an ecommerce application that must always be available. The application will run on Amazon EC2 instances continuously for the next 12 months. What is the MOST cost-effective instance purchasing option that meets these requirements?

A. Spot Instances  
B. Savings Plans  
C. Dedicated Hosts  
D. On-Demand Instances

[번역] 회사는 항상 사용할 수 있어야 하는 전자 상거래 응용 프로그램을 시작합니다. 애플리케이션은 향후 12개월 동안 계속해서 Amazon EC2 인스턴스에서 실행됩니다. 이러한 요구 사항을 충족하는 가장 비용 효율적인 인스턴스 구매 옵션은 무엇입니까?

> ❌

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

Which AWS service or feature can a company use to determine which business unit is using specific AWS resources?

A. Cost allocation tags  
B. Key pairs  
C. Amazon Inspector  
D. AWS Trusted Advisor

[번역] 회사가 특정 AWS 리소스를 사용하는 사업부를 결정하기 위해 어떤 AWS 서비스 또는 기능을 사용할 수 있습니까?

A. 비용 할당 태그  
B. 키 쌍  
C. 아마존 인스펙터  
D. AWS Trusted Advisor

> ✅

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

A. AWS Trusted Advisor  
B. AWS Consulting Partners  
C. AWS Artifacts  
D. AWS Managed Services

[번역] 회사에서 워크로드를 AWS로 마이그레이션하고 싶지만 AWS 클라우드 컴퓨팅에 대한 전문 지식이 부족합니다.  
회사의 마이그레이션에 도움이 되는 AWS 서비스 또는 기능은 무엇입니까?

A. AWS Trusted Advisor  
B. AWS 컨설팅 파트너  
C. AWS 아티팩트  
D. AWS 관리형 서비스

> 💡 애매함

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

A. AWS 구성  
B. 서비스 할당량  
C. AWS 서비스 카탈로그  
D. AWS 예산

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

A. Amazon EC2 이용약관  
B. AWS ISO 인증  
C. 회사의 AWS 지출 내역  
D. 이전 세대 Amazon EC2 인스턴스 유형 목록

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

A company needs to simultaneously process hundreds of requests from different users. Which combination of AWS services should the company use to build an operationally efficient solution?

A. Amazon Simple Queue Service (Amazon SQS) and AWS Lambda
B. AWS Data Pipeline and Amazon EC2
C. Amazon Kinesis and Amazon Athena
D. AWS Amplify and AWS AppSync

[번역] 회사는 서로 다른 사용자의 수백 가지 요청을 동시에 처리해야 합니다. 기업이 운영상 효율적인 솔루션을 구축하기 위해 어떤 AWS 서비스 조합을 사용해야 합니까?

A. Amazon Simple Queue Service(Amazon SQS) 및 AWS Lambda
B. AWS 데이터 파이프라인 및 Amazon EC2
C. Amazon Kinesis 및 Amazon Athena
D. AWS Amplify 및 AWS AppSync

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A

`AWS Data Pipeline`은 주로 `데이터` `이동`, `변환`, `백업` 작업에 사용한다.  
실시간 요청 처리보다는 배치 작업 or 정기적인 데이터 처리에 적합.

`Amazon Kinesis`, `Athena`는 `실시간 데이터 분석`에 중점을 둔 서비스.  
사용자 요청을 처리하는 작업과는 거리가 멀다.

`AWS Amplify`는 주로 빠른 풀스택 개발 + 서버리스 백엔드 등등 제공하는 서비스.

Amazon SQS(Simple Queue Service)는 완전 관리형 `메시지 대기열 서비스`이다.  
여러 시스템 간에 `비동기`적으로 `데이터 전달`이 가능하며, `메시지 기반 애플리케이션 통신`.
</div>
</details>

## Question 22

What is the scope of a VPC within the AWS network?

A. A VPC can span all Availability Zones globally.
B. A VPC must span at least two subnets in each AWS Region.
C. A VPC must span at least two edge locations in each AWS Region.
D. A VPC can span all Availability Zones within an AWS Region.

[번역] AWS 네트워크 내 VPC의 범위는 무엇입니까?

A. VPC는 전 세계의 모든 가용 영역에 걸쳐 있을 수 있습니다.
B. VPC는 각 AWS 리전에서 최소 2개의 서브넷에 걸쳐 있어야 합니다.
C. VPC는 각 AWS 리전에서 2개 이상의 엣지 로케이션에 걸쳐 있어야 합니다.
D. VPC는 AWS 리전 내의 모든 가용 영역에 걸쳐 있을 수 있습니다.

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

`VPC`는 `AWS의 특정 리전 내에서만 동작`, 해당 리전의 모든 가용 영역에 걸쳐 사용 가능.  
VPC는 리전 내에 여러 가용 영역에 걸쳐 구성 가능하고, 리전 밖으로는 확장 불가.

VPC는 전 세계 가용 영역에 걸칠 수 없음, 각 리전의 가용 영역 내에만 가능.

VPC는 반드시 2개 이상의 서브넷을 포함해야 하는건 아님, 한개여도 상관 없음.

엣지 로케이션은 VPC와 상관 없음, CloudFront와 관련 있음.  
엣지 로케이션은 데이터 캐싱 및 지연 없는 컨텐츠 전송을 위해 사용.
</div>
</details>

## Question 23

Which of the following are components of an AWS Site-to-Site VPN connection? (Choose two.)

A. AWS Storage Gateway
B. Virtual private gateway
C. NAT gateway
D. Customer gateway
E. Internet gateway

[번역] 다음 중 AWS Site-to-Site VPN 연결의 구성 요소는 무엇입니까? (2개를 선택하세요.)

A. AWS 스토리지 게이트웨이
B. 가상 사설 게이트웨이
C. NAT 게이트웨이
D. 고객 게이트웨이
E. 인터넷 게이트웨이

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, D

![20240904_vpn.png](./img/20240904_vpn.png)

- [VPN 관련 참고 링크](https://btcd.tistory.com/46)

VPN의 구성 요소로는 AWS의 `Virtual Private Gateway`, `VPN Connection`, `Customer Gateway`가 존재.

A. AWS Storage Gateway

- 온프레미스와 AWS 클라우드 스토리지 간 통합 지원

B. Virtual private gateway

`Virtual private gateway`란 `AWS VPC`와 `온프레미스`를 `연결`하는 `VPN 게이트웨이`이다.  

- `VPN 터널`을 통해 `보안 트래픽`을 `전송`
- `Direct Connect` 지원
- `VPC로의 진입점`(게이트웨이)
- `하이브리드 클라우드 환경 구축`
- `VPC 대역에 바로 붙어 있는 것으로 보임`

C. NAT gateway
NAT gateway는 private subnet에 위치한 리소스가 routing table의 rule에 의해  
외부 통신이 가능하도록 설정하기 위해 사용하는 서비스. routing table에 내부 소스 IP를 입력 후  
해당 IP의 목적지는 NAT로 설정하면 private subnet에서 외부 통신이 가능해진다.

D. Customer gateway

Customer gateway은 온프레미스(고객)측 네트워크의 엔드포인트 의미.  
정리하면 VPN 터널을 통해 외부 네트워크와 안전하게 통신하기 위한 장치 및 소프트웨어.

E. Internet gateway
Internet gateway는 public subnet에 위치한 리소스가 AWS 외부 통신을 위해 사용하는 게이트웨이.
</div>
</details>

## Question 24

A company needs to establish a connection between two VPCs. The VPCs are located in two different AWS Regions. The company wants to use the existing infrastructure of the VPCs for this connection. Which AWS service or feature can be used to establish this connection?

A. AWS Client VPN
B. VPC peering
C. AWS Direct Connect
D. VPC endpoints

[번역] 회사는 두 VPC 간에 연결을 설정해야 합니다. VPC는 두 개의 서로 다른 AWS 리전에 있습니다. 회사는 이 연결을 위해 VPC의 기존 인프라를 사용하려고 합니다. 이 연결을 설정하는 데 사용할 수 있는 AWS 서비스 또는 기능은 무엇입니까?

A. AWS 클라이언트 VPN
B. VPC 피어링
C. AWS 다이렉트 커넥트
D. VPC 엔드포인트

> ✅

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

A. AWS 클라이언트 VPN
VPN Client Gateway 역할을 하며, 온프레미스의 장비와 AWS VPC를 연동하기 위한 네트워크 엔드포인트.  

B. VPC 피어링
두 VPC간 프라이빗 네트워크를 연결하는 AWS 서비스.  
두 VPC가 동일 혹은 다른 계정에 있거나, 서로 다른 리전에 있어도 연결 가능.  

VPC 피어링은 1:1 VPC 연결, 복잡해질 수 있음.  
이를 보완하기 위해 Transit Gateway(중앙 허브)로 관리하는 서비스 존재.
VPC == VPC 통신 가능
VPC == 온프레미스 통신 가능

C. AWS 다이렉트 커넥트
VPN virtual private gateway와 customer gateway를 중간에서 연결하는 커넥트

D. VPC 엔드포인트
Private Subnet에서 AWS 네트워크를 사용하여 AWS 서비스에 접근하기 위한 서비스

</div>
</details>

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