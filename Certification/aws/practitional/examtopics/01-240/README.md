# examtopics 01 - 240 오답노트

## Question 04

A company is planning to replace its physical on-premises compute servers with AWS serverless compute services.  
The company wants to be able to take advantage of advanced technologies quickly after the migration.  
Which pillar of the AWS Well-Architected Framework does this plan represent?

A. Security  
B. Performance efficiency  
C. Operational excellence  
D. Reliability

[번역] 회사는 물리적 온프레미스 컴퓨팅 서버를 AWS 서버리스 컴퓨팅 서비스로 교체할 계획입니다.  
이 회사는 마이그레이션 후 고급 기술을 신속하게 활용할 수 있기를 원합니다.  
이 계획이 나타내는 AWS Well-Architected 프레임워크의 기둥은 무엇입니까?

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

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

[맨위로](#examtopics-01---240-오답노트)

## Question 33

Which of the following are included in AWS Enterprise Support? (Choose two.)

A. AWS technical account manager (TAM)  
B. AWS partner-led support  
C. AWS Professional Services  
D. Support of third-party software integration to AWS  
E. 5-minute response time for critical issues

[번역] 다음 중 AWS Enterprise Support에 포함된 것은 무엇입니까? (2개를 선택하세요.)

A. AWS 기술 계정 관리자(TAM)  
B. AWS 파트너 주도 지원  
C. AWS 전문 서비스  
D. AWS에 대한 타사 소프트웨어 통합 지원  
E. 중요한 문제에 대한 5분 응답 시간

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A, D (E: 이것도 가능)

A. AWS 기술 계정 관리자(TAM)  
TAM 포함, 컨설팅 해줌

B. AWS 파트너 주도 지원  
AWS 파트너 주도 지원 포함 안됨, AWS 파트너와 협력하여 별도 지원

C. AWS 전문 서비스  
별도의 유료 서비스, AWS 클라우드 전문가가 고객의 클라우드 여정을 도와주는 컨설팅 서비스

D. AWS에 대한 타사 소프트웨어 통합 지원  
AWS 리소스와 통합된 타사 S/W 지원 제공

E. 중요한 문제에 대한 5분 응답 시간
AWS Enterprise에는 심각한 문제 발생 시 5분 내 응답 지원 서비스 제공
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 34

A global media company uses AWS Organizations to manage multiple AWS accounts.  
Which AWS service or feature can the company use to limit the access to AWS services for member accounts?

A. AWS Identity and Access Management (IAM)  
B. Service control policies (SCPs)  
C. Organizational units (OUs)  
D. Access control lists (ACLs)

[번역] 글로벌 미디어 회사는 AWS Organizations를 사용하여 여러 AWS 계정을 관리합니다.  
회사에서 멤버 계정의 AWS 서비스에 대한 액세스를 제한하는 데 사용할 수 있는 AWS 서비스 또는 기능은 무엇입니까?

A. AWS Identity and Access Management(IAM)  
B. 서비스 통제 정책(SCP)  
C. 조직 단위(OU)  
D. 액세스 제어 목록(ACL)

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, (C: 이건 정답으로 나오긴 함)
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 35

A company wants to limit its employees' AWS access to a portfolio of predefined AWS resources.  
Which AWS solution should the company use to meet this requirement?

A. AWS Config  
B. AWS software development kits (SDKs)  
C. AWS Service Catalog  
D. AWS AppSync

[번역] 회사에서 사전 정의된 AWS 리소스 포트폴리오에 대한 직원의 AWS 액세스를 제한하려고 합니다.  
회사는 이 요구 사항을 충족하기 위해 어떤 AWS 솔루션을 사용해야 합니까?

A. AWS 구성  
B. AWS 소프트웨어 개발 키트(SDK)  
C. AWS 서비스 카탈로그  
D. AWS 앱싱크

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: C
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 37

Which of the following are advantages of the AWS Cloud? (Choose two.)

A. AWS management of user-owned infrastructure  
B. Ability to quickly change required capacity  
C. High economies of scale  
D. Increased deployment time to market  
E. Increased fixed expenses

[번역] 다음 중 AWS 클라우드의 장점은 무엇입니까? (2개를 선택하세요.)

A. 사용자 소유 인프라의 AWS 관리  
B. 필요한 용량을 빠르게 변경할 수 있는 능력  
C. 높은 규모의 경제  
D. 시장 출시 시간 증가  
E. 고정비 증가

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B, C

A. AWS management of user-owned infrastructure  
AWS가 사용자가 소유한 물리적 인프라를 관리하지는 않음.  
AWS는 자체 클라우드를 관리, 사용자가 대여.

B. Ability to quickly change required capacity  
빠르게 리소스 추가 삭제 가능

C. High economies of scale  
높은 규모의 경제, 비용 절감 효과

D. Increased deployment time to market  
배포 시간을 줄어듬

E. Increased fixed expenses
고정비 증가 안함, 가변 비용 증가
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #42

Which of the following are features of network ACLs as they are used in the AWS Cloud?  
(Choose two.)  

A. They are stateless.  
B. They are stateful.  
C. They evaluate all rules before allowing traffic.  
D. They process rules in order, starting with the lowest numbered rule, when deciding whether to allow traffic.  
E. They operate at the instance level.  

[번역]  
다음 중 AWS 클라우드에서 사용되는 네트워크 ACL의 기능은 무엇입니까? (2개를 선택하세요.)  

A. stateless 방식을 사용합니다.  
B. stateful 방식을 사용합니다.  
C. 트래픽을 허용하기 전에 모든 규칙을 평가합니다.  
D. 트래픽 허용 여부를 결정할 때 가장 낮은 번호의 규칙부터 순서대로 처리합니다.  
E. 인스턴스 수준에서 작동합니다.  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: A, D

A. stateless 방식을 사용합니다.
NACL(Network access control list)는 stateless(무상태)이다.  
이것은 들어오고 나가는 트래픽을 각각 독립적으로 평가하며, 트래픽의 응답을 자동으로 허용하지 않는다.  
따라서 수동으로 들어오고 나가는 트래픽에 대해 각각의 규칙을 정해야 한다.

B. stateful 방식을 사용합니다.  
NACL(Network access control list)는 Stateful(상태 기억)이 아니다.  
보안그룹이 Staetful 방식이며, 보안그룹의 경우 들어오는 트래픽(인바운드)에 대해서  
허용이 되면, 그에 대한 응답 트래픽이 자동으로 허용 된다.

즉, 보안그룹은 들어온 트래픽과 나가는 트래픽을 각각 따로 정의할 필요없이  
일치하는 세션에 대한 응답은 자동으로 허용. (인바운드 허용 시 아웃바운드 자동 허용)

C. 트래픽을 허용하기 전에 모든 규칙을 평가합니다.  
NACL은 모든 트래픽을 허용하기 전에 평가하는 것이 아니라, 낲은 번호 순서부터 평가하여  
첫 번째 일치하는 규칙만 처리하고 평가한다.

D. 트래픽 허용 여부를 결정할 때 가장 낮은 번호의 규칙부터 순서대로 처리합니다.  
NACL에 설정된 규칙 번호 가장 낮은 순서부터, 규칙 평가.  
한 개씩 평가하는데 없으면 Deny 시킨다.

E. 인스턴스 수준에서 작동합니다.  
인스턴스 수준에서 작동하는건 보안그룹
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #43

A company has designed its AWS Cloud infrastructure to run its workloads effectively.  
The company also has protocols in place to continuously improve supporting processes.  
Which pillar of the AWS Well-Architected Framework does this scenario represent?  

A. Security  
B. Performance efficiency  
C. Cost optimization  
D. Operational excellence  

[번역]  
회사는 워크로드를 효과적으로 실행하기 위해 AWS 클라우드 인프라를 설계했습니다.  
회사는 또한 지원 프로세스를 지속적으로 개선하기 위한 프로토콜을 보유하고 있습니다.  
이 시나리오가 나타내는 AWS Well-Architected 프레임워크의 기둥은 무엇입니까?  

A. 보안  
B. 성능 효율성  
C. 비용 최적화  
D. 운영 우수성  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

A. 보안  
`보안`은 `시스템 보호`, `데이터 암호화`, `접근 제어` 등에 중점을 둔다.  
시나리오에서 보안 관련 얘기가 나오지 않았음.

B. 성능 효율성  
`성능 효율성`은 `워크로드` `성능 최적화와` `리소스 활용`에 중점을 둔다.  
시나리오에서 성능 최적화에 대한 내용이 없기에 적절하지 않음.

C. 비용 최적화  
비용 최적화는 `리소스를 효율적으로 사용하여 비용을 줄이는데 중점을 둔다`.  
시나리오에서는 비용 관리보다 프로세스 개선에 관한 내용이 존재.

D. 운영 우수성
프로세스를 지속적으로 개선하기 위한 프로토콜을 보유하고 있으므로,  
이는 운영 우수성에 해당한다
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #45

A company needs to graphically visualize AWS billing and usage over time. The company also needs information about its AWS monthly costs.  
Which AWS Billing and Cost Management tool provides this data in a graphical format?  

A. AWS Bills  
B. Cost Explorer  
C. AWS Cost and Usage Report  
D. AWS Budgets  

[번역]  
회사는 시간 경과에 따른 AWS 청구 및 사용량을 그래픽으로 시각화해야 합니다. 회사는 AWS 월별 비용에 대한 정보도 필요합니다. 이 데이터를 그래픽 형식으로 제공하는 AWS Billing and Cost Management 도구는 무엇입니까?  

A. AWS 청구서  
B. 비용 탐색기  
C. AWS 비용 및 사용 보고서  
D. AWS 예산  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

A. AWS 청구서(AWS Bills)  

- 월별 청구서 보여주지만 그래픽 시각화 기능 제공 안함
- 청구 세부 사항을 텍스트 형식으로 확인 가능

B. 비용 탐색기(Cost Explorer)  

AWS 비용 탐색기(Cost Explorere)는 시간 변화에 따른 AWS 비용과 사용량을 그패프로 시각화 할 수 있음.  
월별을 포함한 다양한 기간 동안의 사용량과 비용을 시각적으로 분석 가능하며, 필터링 기능 제공하여  
어떤 부분에서 가격이 많이 나가는지 확인 가능.

C. AWS 비용 및 사용 보고서(AWS Cost and Usage Report)

CSV 형식으로 데이터를 내보내는 기능은 있으나 그래프랑은 안 맞음

D. AWS 예산(AWS Budgets)  

`AWS Budgets`은 설정한 예산과 비교하여 비용을 모니터링하는 도구로,  
`비용 추적 알림 설정`이 가능한 서비스이다. 그래프랑은 안 맞음
</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #47

Which architecture design principle describes the need to isolate failures between dependent components in the AWS Cloud?  

A. Use a monolithic design.  
B. Design for automation.  
C. Design for single points of failure.  
D. Loosely couple components.  

[번역]  
AWS 클라우드에서 종속 구성 요소 간의 장애를 격리해야 하는 필요성을 설명하는 아키텍처 설계 원칙은 무엇입니까?  

A. 모놀리식 디자인을 사용합니다.  
B. 자동화를 위한 설계.  
C. 단일 실패 지점을 위한 설계.  
D. 느슨하게 결합된 구성 요소.  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

A. 모놀리식 디자인을 사용합니다.  

`모놀리식 디자인`은 모든 구성 요소가 `하나로 결합된 설계`를 의미한다.  
장애가 발생할 경우 전체 시스템에 영향을 끼치며, 장애 격리 불가능.

B. 자동화를 위한 설계.  
자동화는 반복 작업의 효율이지, 장애 격리와 상관 없음.

C. 단일 실패 지점을 위한 설계.

단일 실패 지점을 위한 설계는 시스템 한 지점에서 실패하는 겨우 전체가 중단되는 상황을 초래할 수 있기에, 장애를 격리하려는 목적과는 반대이다.

D. 느슨하게 결합된 구성 요소.  

`느슨하게 결합된 구성 요소`는 하나의 구성 요소에서 발생하는 장애가 다른 구성요소로 전파되지 않도록,  
함으로 시스템 복원력 + 안정성 높히는 설계 원칙이다.

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #53

Which AWS service or feature identifies whether an Amazon S3 bucket or an IAM role has been shared with an external entity?  

A. AWS Service Catalog  
B. AWS Systems Manager  
C. AWS IAM Access Analyzer  
D. AWS Organizations  

[번역]  
Amazon S3 버킷 또는 IAM 역할이 외부 엔터티와 공유되었는지 식별하는 AWS 서비스 또는 기능은 무엇입니까?  

A. AWS Service Catalog  
B. AWS Systems Manager  
C. AWS IAM Access Analyzer  
D. AWS Organizations  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: C

A. AWS Service Catalog  

- `IT 서비스 카탈로그 관리`를 위한 서비스

B. AWS Systems Manager  

- `AWS 리소스` + `애플리케이션` `중앙 관리 서비스
- 시스템 운영과 관련됨

C. AWS IAM Access Analyzer  

`IAM Access Analyzer`는 AWS `S3 버킷`, `IAM 역할`, `KMS 키`, `Lambda 함수`, `SQS 큐` 등이 `외부 엔티티와 공유`되었는지 `식별`할 수 있는 서비스.  
Access Analyzer는 리소스 정책을 분석하여 `외부로의 공유 여부를 감지`, 이를 통해 `보안 상태 평가`에 도움을 준다.

D. AWS Organizations  

- `AWS 계정`을 `중앙`에서 `관리`하는 `서비스`
- `계정 관리` 및 `관련 정책 설정`하는데 사용

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #59

A company is preparing to launch a new web store that is expected to receive high traffic for an upcoming event. The web store runs only on AWS, and the company has an AWS Enterprise Support plan.  
Which AWS resource will provide guidance about how the company should scale its architecture and operational support during the event?  

A. AWS Abuse team  
B. The designated AWS technical account manager (TAM)  
C. AWS infrastructure event management  
D. AWS Professional Services  

[번역]  
한 회사가 다가오는 이벤트를 위해 많은 트래픽을 받을 것으로 예상되는 새로운 웹 스토어를 시작하려고 준비하고 있습니다. 웹 스토어는 AWS에서만 실행되며 회사에는 AWS Enterprise Support 계획이 있습니다. 이벤트 기간 동안 회사가 아키텍처 및 운영 지원을 확장하는 방법에 대한 지침을 제공하는 AWS 리소스는 무엇입니까?  

A. AWS Abuse team  
B. The designated AWS technical account manager(TAM)  
C. AWS infrastructure event management  
D. AWS Professional Services  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: C(B도 정답에 가까움)

A. AWS Abuse team  

`AWS Abuse team`은 `악의적인 활동`이나 `보안 문제`에 관련된 사항을 처리하는 팀  
아키텍처 확장과는 연관이 없는 팀임

B. The designated AWS technical account manager(TAM)  

`TAM`도 일상적인 기술적 조언을 제공하지만, 특정 이벤트에 대한 아키텍처 확장에 대한 구체적인 지원은  
AWS Infrastructure Event Management가 더 적당하다

C. AWS infrastructure event management  

`AWS infrastructure event management`은 대규모 이벤트동안 AWS 리소스를 확장하고 관리하는데 컨설팅 제공해주는 서비스.  
특히 고 트래픽이 예상되는 경우 AWS 리소스 최적화를 안정적으로 운영할 수 있게 도와줌.

D. AWS Professional Services  

`AWS Professional Services`는 장기적인 아키텍처 설계 및 마이그레이션을 위한 컨설팅 서비스로,  
이벤트에 대한 즉각적인 지원보다는 장기 적인 지원이 맞음  

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #64

A manufacturing company has a critical application that runs at a remote site that has a slow internet connection.  
The company wants to migrate the workload to AWS. The application is sensitive to latency and interruptions in connectivity.  
The company wants a solution that can host this application with minimum latency.  
Which AWS service or feature should the company use to meet these requirements?  

A. Availability Zones  
B. AWS Local Zones  
C. AWS Wavelength  
D. AWS Outposts  

[번역]  
제조 회사에는 인터넷 연결 속도가 느린 원격 사이트에서 실행되는 중요한 응용 프로그램이 있습니다.  
회사는 워크로드를 AWS로 마이그레이션하려고 합니다. 애플리케이션은 대기 시간과 연결 중단에 민감합니다.  
회사는 대기 시간을 최소화하면서 이 애플리케이션을 호스팅할 수 있는 솔루션을 원합니다.  
이러한 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 서비스 또는 기능은 무엇입니까?  

A. 가용 영역  
B. AWS 로컬 영역  
C. AWS 파장  
D. AWS 전초기지  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B(D가 41%)

A. 가용 영역  

가용 영역(Availibility zone)은 HA(가용성) 유지를 위한 서비스이지, 대기 시간 최소화를 위한 개념은 아니다.  
또한 가용 영역은 물리적으로 떨어져있는 데이터센터의 위치를 의미하는 것으로, 원격 사이트에서 애플리케이션을 실행하려면  
인터넷을 통해 연결해야 하기에 대기 시간 문제를 해소할 수 없다.

B. AWS 로컬 영역  

`AWS Local Zones`는 `AWS 리전`에서 `떨어진` `도시 근처에 배치된 인프라`로,  
`특정 도시`에서 `낮은 대기 시간`의 `컴퓨팅 리소스를 제공`하기 위한 솔루션이다.  
또한 OutPosts는 고객 사이트(`IDC`)에 직접 설치되는 반면, Local Zones는 특정 도시(`region 안의 특정 도시`)에 위치하는 차이가 존재.

C. AWS 파장  

- `AWS Wavelength`는 `5G 네트워크`에서 `매우 낮은 대기 시간`으로 APP 실행 가능한 서비스
- `5G 네트워크에 의존`하며, `느린 인터넷 연결에는 적합하지 않음`

D. AWS 전초기지

- `AWS Outposts`는 AWS 인프라 자원을 고객의 IDC 센터내의 물리 장비에 설치하는 것
- 인터넷 연결 속도에 의존하지 않고, AWS 서비스 사용을 위한 인터넷 연결도 따로 필요없음

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #66

A company wants to use the AWS Cloud to provide secure access to desktop applications that are running in a fully managed environment.  
Which AWS service should the company use to meet this requirement?  

A. Amazon S3  
B. Amazon AppStream 2.0  
C. AWS AppSync  
D. AWS Outposts  

[번역]  
회사는 AWS 클라우드를 사용하여 완전히 관리되는 환경에서 실행되는 데스크톱 애플리케이션에 대한 보안 액세스를 제공하려고 합니다.  
회사에서 이 요구 사항을 충족하려면 어떤 AWS 서비스를 사용해야 합니까?  

A. Amazon S3  
B. Amazon AppStream 2.0  
C. AWS AppSync  
D. AWS Outposts  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B(A가 정답으로 선택되어 있기는함?)

A. Amazon S3

- AWS S3는 데이터 저장 스토리지 서비스
- 데스크톱 애플리케이션을 실행하거나 관리하는 데 필요한 기능 제공 안함

B. Amazon AppStream 2.0  

- `완전 관리형 애플리케이션 스트리밍 서비스`
- 사용자는 클라우드에서 애플리케이션을 실행하고, 스트리밍을 통해 데스크톱 애플리케이션에 안전하게 엑세스 가능
- 사용자는 어디서나 브라우저를 통해 데스크톱 어플리케이션에 접근 가능, 데이터는 클라우드에 안전하게 유지됨

C. AWS AppSync  

- `GraphQL API`를 `사용`하여 애플리케이션 `데이터`를 `동기화` 및 `실시간 업데이트` 하는 서비스

D. AWS Outposts  

- `AWS 인프라`를 `온프레미스 환경에 설치`하여 `로컬`에서 `클라우드 서비스를 사용`하는 서비스

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #70

Which AWS service or feature checks access policies and offers actionable recommendations to help users set secure and functional policies?  

A. AWS Systems Manager  
B. AWS IAM Access Analyzer  
C. AWS Trusted Advisor  
D. Amazon GuardDuty  

[번역]  
액세스 정책을 확인하고 사용자가 안전하고 기능적인 정책을 설정하는 데 도움이 되는 실행 가능한 권장 사항을 제공하는 AWS 서비스 또는 기능은 무엇입니까?  

A. AWS Systems Manager  
B. AWS IAM Access Analyzer  
C. AWS Trusted Advisor  
D. Amazon GuardDuty  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: B

A. AWS Systems Manager  

- `AWS System Manager`는 `인프라 관리를 위한 통합관리 도구`
- EC2 인스턴스, 애플리케이션 관리 및 자동화에 중점

B. AWS IAM Access Analyzer  

- `엑세스 정책 분석`
- 리소스가 외부 엔터티와 공유 될 수 있는지 여부 확인

C. AWS Trusted Advisor  

- AWS 계정에서 `비용 절감`, `성능 최적화`, `보안 문제` 등을 검사 및 권장 사항 제공
- IAM 정책 분석에는 맞지 않음

D. Amazon GuardDuty  

- 위협 탐지 서비스
- 악의적인 활동 감지

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #71

A company has a fleet of cargo ships. The cargo ships have sensors that collect data at sea, where there is intermittent or no internet connectivity.  
The company needs to collect, format, and process the data at sea and move the data to AWS later.  
Which AWS service should the company use to meet these requirements?  

A. AWS IoT Core  
B. Amazon Lightsail  
C. AWS Storage Gateway  
D. AWS Snowball Edge  

[번역]  
한 회사에 화물선 함대가 있습니다. 화물선에는 인터넷 연결이 간헐적이거나 없는 바다에서 데이터를 수집하는 센서가 있습니다.  
회사는 바다에서 데이터를 수집, 형식 지정 및 처리하고 나중에 데이터를 AWS로 이동해야 합니다.  
회사에서 이러한 요구 사항을 충족하려면 어떤 AWS 서비스를 사용해야 합니까?  

A. AWS IoT Core  
B. Amazon Lightsail  
C. AWS Storage Gateway  
D. AWS Snowball Edge  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: D

A. AWS IoT Core

- `IOT 장치 데이터`를 `실시간`으로 `처리`하는데 적합
- `인터넷 없는 환경` -> 사용 못함

B. Amazon Lightsail

- `가상 서버`, 스토리지, 네트워크 등 웹 애플리케이션 구축을 위한 서비스
- 데이터 전송과는 무관

C. AWS Storage Gateway
  
- `온프레미스`와 `AWS 클라우드 간` `데이터 전송`을 위한 스토리지 서비스
- 로컬에서 데이터 처리 하는 기능은 제공 안함
- `하이브리드 클라우드 환경`
  - 클라우드 완전 이관 없이, 일부 데이터 온프라미스에 유지 + 필요 데이터 AWS 전송 가능
- `데이터 전송 최적화`
  - 데이터 압축 + 효율적으로 전송하여 비용을 줄이고 전송 시간 최소화

D. AWS Snowball Edge  

- `인터넷 연결이 없거나` `제한된 환경`에서 `데이터`를 `수집`, `처리` 및 `저장` 하도록 설계된 `물리적 장치`
- `On-premise`에서 `AWS`로 `대규모 데이터를 이관`할 때 사용되는 `Snowball`
- `대규모 데이터`를 `전용선`이나, `VPN`로 옮길 경우 -> `비용`과 `시간`이 어마 무시하게 발생한다

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question #72

A retail company needs to build a highly available architecture for a new ecommerce platform.  
The company is using only AWS services that replicate data across multiple Availability Zones.  
Which AWS services should the company use to meet this requirement?  
(Choose two.)  

A. Amazon EC2  
B. Amazon Elastic Block Store (Amazon EBS)  
C. Amazon Aurora  
D. Amazon DynamoDB  
E. Amazon Redshift  

[번역]  
소매 회사는 새로운 전자 상거래 플랫폼을 위한 고가용성 아키텍처를 구축해야 합니다.  
이 회사는 여러 가용 영역에서 데이터를 복제하는 AWS 서비스만 사용하고 있습니다.  
회사는 이 요구 사항을 충족하기 위해 어떤 AWS 서비스를 사용해야 합니까? (두 가지를 선택하세요.)  

A. Amazon EC2  
B. Amazon Elastic Block Store (Amazon EBS)  
C. Amazon Aurora  
D. Amazon DynamoDB  
E. Amazon Redshift  

> ❌

<details>
<summary>정답 보기</summary>
<div markdown="1">
정답은: C, D

A. Amazon EC2  

- `EC2` 자체는 `고가용성`을 `제공하지 않음`
- EC2를 여러 가용영역에 배치는 가능하나, EC2 자체가 데이터를 복사하지는 않음

B. Amazon Elastic Block Store (Amazon EBS)  

- `EBS`는 기본적으로 `단일 가용 영역`에서 `작동`
- `EBS 스냅샷 사용`을 통해 `백업 가능`하나, 가용성이랑은 상관 없음

C. Amazon Aurora  

- `다중 가용 영역`(AZ)에 `데이터 자동 복제`하여 가용성 보장
- DB 인스턴스의 AZ에 장애가 생겨도 다른 AZ에 복제된 데이터를 통해 가용성 보장
- Aurora는 데이터 손실 없이 자동으로 장애 복구

D. Amazon DynamoDB  

- `다중 가용 영역`(AZ)에 `데이터 자동 복제`하는 `NoSQL DB`
- DB 인스턴스의 AZ에 장애가 생겨도 다른 AZ에 복제된 데이터를 통해 가용성 보장

E. Amazon Redshift

- `데이터웨어하우스 서비스`로, 다중 AZ 복제 및 고가용성 기능 제공 안함
- 고가용성 필요한 경우, 클러스터를 다중 노드로 구성 가능하나 위 내용과 맞지 않음

</div>
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 85

An online retail company has seasonal sales spikes several times a year, primarily around holidays.  
Demand is lower at other times. The company finds it difficult to predict the increasing infrastructure demand for each season.  
Which advantages of moving to the AWS Cloud would MOST benefit the company? (Choose two.)  

A. Global footprint  
B. Elasticity  
C. AWS service quotas  
D. AWS shared responsibility model  
E. Pay-as-you-go pricing  

[번역]  
한 온라인 소매 회사는 1년에 여러 차례 주로 휴일에 계절별 판매 급증이 있습니다. 다른 시기에는 수요가 더 낮습니다.  
회사는 각 시즌마다 증가하는 인프라 수요를 예측하는 것이 어렵다고 생각합니다.  
AWS 클라우드로 이동하는 것의 어떤 장점이 이 회사에 가장 큰 도움이 될까요? (두 개를 선택하세요.)  

A. 글로벌 범위  
B. 탄력성  
C. AWS 서비스 할당량  
D. AWS의 공동 책임 모델  
E. 사용한 만큼 지불하는 가격 책정  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:B, E

A. Global footprint  

- AWS 데이터 센터가 전세계에 분포해 있는 것을 의미
- 계절별 인프라 수요 변동에는 영향이 없음

C. AWS service quotas  

- AWS에서 사용할 수 있는 리소스의 한계 정의
- 계절별 인프라 수요 변동에는 영향이 없음

D. AWS shared responsibility model  

- AWS와 고객이 각각 보안과 규정 준수에 대한 책임 분담 의미
- 계절별 인프라 수요 변동에는 영향이 없음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 88

A company wants to ensure that two Amazon EC2 instances are in separate data centers with minimal communication latency between the data centers.  
How can the company meet this requirement?  

A. Place the EC2 instances in two separate AWS Regions connected with a VPC peering connection.  
B. Place the EC2 instances in two separate Availability Zones within the same AWS Region.  
C. Place one EC2 instance on premises and the other in an AWS Region. Then connect them by using an AWS VPN connection.  
D. Place both EC2 instances in a placement group for dedicated bandwidth.  

[번역]  
한 회사는 두 개의 Amazon EC2 인스턴스가 서로 다른 데이터 센터에 있으며, 데이터 센터 간의 통신 지연 시간이 최소화되도록 보장하고 싶어 합니다.  
회사는 이 요구 사항을 어떻게 충족할 수 있습니까?  

A. VPC 피어링 연결로 연결된 두 개의 별도 AWS 리전에 EC2 인스턴스를 배치합니다.  
B. 동일한 AWS 리전 내의 두 개의 별도 가용 영역에 EC2 인스턴스를 배치합니다.  
C. 하나의 EC2 인스턴스를 온프레미스에, 다른 하나를 AWS 리전에 배치한 후, AWS VPN 연결을 사용하여 연결합니다.  
D. 두 EC2 인스턴스를 전용 대역폭을 위한 배치 그룹에 배치합니다.  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 90

Which AWS services should a company use to read and write data that changes frequently? (Choose two.)  

A. Amazon S3 Glacier  
B. Amazon RDS  
C. AWS Snowball  
D. Amazon Redshift  
E. Amazon Elastic File System (Amazon EFS)  

[번역]  
회사가 자주 변경되는 데이터를 읽고 쓰기 위해 사용해야 하는 AWS 서비스는 무엇입니까? (두 개를 선택하세요.)  

A. Amazon S3 Glacier  
B. Amazon RDS  
C. AWS Snowball  
D. Amazon Redshift  
E. Amazon Elastic File System (Amazon EFS)  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B, E

A. Amazon S3 Glacier  

- `장기 보관용 아카이브 스토리지`
- 자주 접근하지 않는 데이터 저장에 적합

B. Amazon RDS  

- 자주 변경되는 데이터 읽고 쓰는 기능 제공

C. AWS Snowball  

- 온프레미스 대량 데이터 AWS 마이그레이션 시 사용
- 데이터 빈번한 I/O와는 상관 없음

D. Amazon Redshift  

- `데이터 웨어하우스 서비스`
- `대량 데이터` `분석` 및 `처리` 적합
- 즉, 데이터 분석에 적합

E. Amazon Elastic File System (Amazon EFS)  

- 자주 변경되는 파일을 읽고 쓰는 기능 제공
- 다중 EC2 동시 접근 가능
- 자동 확장 및 고가용성 지원

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 93

A company is operating several factories where it builds products.  
The company needs the ability to process data, store data, and run applications with local system interdependencies that require low latency.  
Which AWS service should the company use to meet these requirements?  

A. AWS IoT Greengrass  
B. AWS Lambda  
C. AWS Outposts  
D. AWS Snowball Edge  

[번역]  
한 회사가 여러 공장에서 제품을 제작하고 있습니다.  
회사는 데이터를 처리하고, 데이터를 저장하며, 낮은 지연 시간이 필요한 로컬 시스템 상호 의존성을 가진 애플리케이션을 실행할 수 있는 능력이 필요합니다.  
이 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS IoT Greengrass  
B. AWS Lambda  
C. AWS Outposts  
D. AWS Snowball Edge  

> ❌ : snowball Edge인 줄 알았는데?

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 95

A company is designing its AWS workloads so that components can be updated regularly and so that changes can be made in small, reversible increments.  
Which pillar of the AWS Well-Architected Framework does this design support?  

A. Security  
B. Performance efficiency  
C. Operational excellence  
D. Reliability  

[번역]  
한 회사가 AWS 워크로드를 설계하여 구성 요소를 정기적으로 업데이트하고 작은, 되돌릴 수 있는 증분으로 변경할 수 있도록 하고 있습니다.  
이 설계가 지원하는 AWS Well-Architected Framework의 기둥은 무엇입니까?  

A. 보안  
B. 성능 효율성  
C. 운영 우수성  
D. 신뢰성  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

Operational excellence:
운영 우수성은 지속적인 개선과 운영의 효율성을 강조합니다. 이 기둥은 구성 요소의 정기적 업데이트와 작고 되돌릴 수 있는 변경을 통해  
운영 프로세스를 최적화하고, 위험을 줄이며, 운영 효율성을 향상시키는 것을 목표로 합니다. 이를 통해 문제 발생 시 신속한 복구와 지속적인 개선이 가능해집니다.
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 115

A company wants to perform sentiment analysis on customer service email messages that it receives. The company wants to identify whether the customer service engagement was positive or negative.  
Which AWS service should the company use to perform this analysis?  

A. Amazon Textract  
B. Amazon Translate  
C. Amazon Comprehend  
D. Amazon Rekognition  

[번역]  
회사는 고객 서비스 이메일 메시지에 대한 감성 분석을 수행하고자 합니다. 고객 서비스 상호작용이 긍정적이었는지 부정적이었는지 확인하고 싶습니다.  
이 분석을 수행하는 데 사용할 AWS 서비스는 무엇입니까?  

A. Amazon Textract  
B. Amazon Translate  
C. Amazon Comprehend  
D. Amazon Rekognition  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Amazon Textract  

- `문서`에서 `텍스트` or `데이터 추출`하는 서비스
- 감정 분석 기능은 제공 안함

B. Amazon Translate  

- `텍스트`를 `다른 언어`로 `번역`하는 서비스
- 감정 분석 기능은 제공 안함

C. Amazon Comprehend  

- `자연어 처리`(NLP) 서비스
- `감정 분석 수행 가능`
- `텍스트`에서 `감정`을 `분석`하고, 긍정적인지 부정적이니 감정 식별

D. Amazon Rekognition  

- 이미지 및 비디오 분석 서비스
- 객체 인식, 얼굴 인식 제공
- 감정 분석 기능은 제공 안함

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)


## Question 116

What is the total amount of storage offered by Amazon S3?  

A. 100MB  
B. 5GB  
C. 5TB  
D. Unlimited  

[번역]  
Amazon S3에서 제공하는 총 저장 용량은 얼마입니까?  

A. 100MB  
B. 5GB  
C. 5TB  
D. 무제한  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

S3가 제공하는 총 저장 용량은 무제한(Unlimited)
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 118

What type of database is Amazon DynamoDB?  

A. In-memory  
B. Relational  
C. Key-value  
D. Graph  

[번역]  
Amazon DynamoDB는 어떤 유형의 데이터베이스입니까?  

A. 인메모리  
B. 관계형  
C. 키-값  
D. 그래프  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. In-memory

- `In-memory` DB는 데이터를 `메모리`에 `저장`하는 DB
- 메모리(주기억장치)에 저장하기에 `엑세스 속도 빠름`
- DynamoDB는 메모리 + HDD에 저장

B. Relational  

- Relational는 `관계형 DB`를 의미
- `DynamoDB`는 `비관계형`(NoSQL)로 관계형 모델 사용 안함

C. Key-value  

- DynamoDB는 Key-Value 형태의 DB
- 데이터를 키와 값으로 저장하고, 빠른 읽기 쓰기 가능

D. Graph  

- 그래프 DB는 데이터 간의 관계를 그래프 구조로 저장
- DynamoDB는 그래프 모델 사용 안함

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 121

Which AWS service provides a feature that can be used to proactively monitor and plan for the service quotas of AWS resources?  

A. AWS CloudTrail  
B. AWS Personal Health Dashboard  
C. AWS Trusted Advisor  
D. Amazon CloudWatch  

[번역]  
어떤 AWS 서비스가 AWS 리소스의 서비스 할당량을 사전에 모니터링하고 계획하는 기능을 제공합니까?  

A. AWS CloudTrail  
B. AWS Personal Health Dashboard  
C. AWS Trusted Advisor  
D. Amazon CloudWatch  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS CloudTrail  

- AWS API 호출과 관련된 로그 기록 및 추적하는 서비스
- 리소스 서비스 할당량 모니터링 기능 없음

B. AWS Personal Health Dashboard  

- `AWS 서비스 상태`와 관련된 `개인 알림` 제공
- `서비스 중단` + `문제`에 대한 `정보 제공`

C. AWS Trusted Advisor  

- AWS `리소스 사용` 및 `할당량`에 대한 `권장 사항 제공`하는 서비스
- `서비스 할당량을 모니터링`하고, `리소스`가 `설정된 한도에 다다를때 경고 제공`

D. Amazon CloudWatch  

- AWS 서비스 메트릭 모니터링

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 125

Which of the following is the customer responsible for updating and patching, according to the AWS shared responsibility model?  

A. Amazon FSx for Windows File Server  
B. Amazon WorkSpaces virtual Windows desktop  
C. AWS Directory Service for Microsoft Active Directory  
D. Amazon RDS for Microsoft SQL Server  

[번역]  
AWS 공동 책임 모델에 따르면, 다음 중 고객이 업데이트 및 패치해야 하는 항목은 무엇입니까?  

A. Amazon FSx for Windows File Server  
B. Amazon WorkSpaces 가상 Windows 데스크탑  
C. AWS Directory Service for Microsoft Active Directory  
D. Amazon RDS for Microsoft SQL Server  

> ❌ (맞추긴 했는데 좀 애매)

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon FSx for Windows File Server  

`AWS FSx`는 `관리형 파일 시스템`으로, `AWS`가 `업데이트 및 패치`를 처리한다.  
고객은 파일시스템 데이터의 접근 관리를 책임진다.

B. Amazon WorkSpaces 가상 Windows 데스크탑  

`AWS Workspace 가상 Windows 데스크탑`은 `사용자`가 직접 `운영체제`와 `애플리케이션`의 `업데이트` 및 `패치`를 관리해야 한다.  
AWS는 H/W 및 기본 운영체제에 대한 패치를 처리하지만, 나머지는 사용자 몫.

C. AWS Directory Service for Microsoft Active Directory  

`AWS Directory service for Microsoft Active Directory`은 `관리형 디렉토리 서비스`로, `AWS`가 `업데이트 및 패치`를 처리한다.  
고객은 `디렉토리 내의 사용자` 및 `그룹 관리`를 책임진다.

D. Amazon RDS for Microsoft SQL Server  

`AWS RDS`는 `AWS`가 `DB의 엔진 업데이트` 및 `패치`를 처리한다.  
`고객`은 DB `구성`, `성능`, `보안 관리`.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 127

A company is using an Amazon RDS DB instance for an application that is deployed in the AWS Cloud.  
The company needs regular patching of the operating system of the server where the DB instance runs.  
What is the company's responsibility in this situation, according to the AWS shared responsibility model?  

A. Open a support case to obtain administrative access to the server so that the company can patch the DB instance operating system.  
B. Open a support case and request that AWS patch the DB instance operating system.  
C. Use administrative access to the server, and apply the operating system patches during the regular maintenance window that is defined for the DB instance.  
D. Establish a regular maintenance window that tells AWS when to patch the DB instance operating system.  

[번역]  
AWS 클라우드에 배포된 애플리케이션에 Amazon RDS DB 인스턴스를 사용하고 있는 회사가 있습니다.  
회사는 DB 인스턴스가 실행되는 서버의 운영 체제를 정기적으로 패치해야 합니다.  
AWS 공동 책임 모델에 따르면, 이 상황에서 회사의 책임은 무엇입니까?  

A. 지원 케이스를 열어 서버에 대한 관리 액세스를 얻고 DB 인스턴스 운영 체제를 패치합니다.  
B. 지원 케이스를 열고 AWS에 DB 인스턴스 운영 체제를 패치하도록 요청합니다.  
C. 서버에 대한 관리 액세스를 사용하고, 정의된 정기 유지 관리 창 동안 운영 체제 패치를 적용합니다.  
D. AWS에 DB 인스턴스 운영 체제를 언제 패치할지 알리는 정기 유지 관리 창을 설정합니다.  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

AWS RDS는 관리형 데이터베이스로, `RDB 운영체제의 패치 관련 작업은 AWS의 책임`이다.  

A. 지원 케이스를 열어 서버에 대한 관리 액세스를 얻고 DB 인스턴스 운영 체제를 패치합니다.  

고객은 RDB 운영체제에 대한 엑세스 권한 없음, 권한은 AWS에만 있음

B. 지원 케이스를 열고 AWS에 DB 인스턴스 운영 체제를 패치하도록 요청합니다.  

고객은 직접 패치 요청 할 수 없음, 패치 작업은 AWS가 관리

C. 서버에 대한 관리 액세스를 사용하고, 정의된 정기 유지 관리 창 동안 운영 체제 패치를 적용합니다.  

RDS 인스턴스의 운영체제의 간리 엑세스는 고객에게 없음

D. AWS에 DB 인스턴스 운영 체제를 언제 패치할지 알리는 정기 유지 관리 창을 설정합니다.  

정기 유지 관리 창을 설정, AWS가 이 기간 동안 패치를 수행하도록 할 수 잇음.
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 132

What does the AWS Concierge Support team provide?  

A. A technical expert dedicated to the user  
B. A primary point of contact for AWS Billing and AWS Support  
C. A partner to help provide scaling guidance for an event launch  
D. A dedicated AWS staff member who reviews the user's application architecture  

[번역]  
AWS Concierge Support 팀은 무엇을 제공합니까?  

A. 사용자 전담 기술 전문가  
B. AWS 청구 및 지원에 대한 주요 연락 담당자  
C. 이벤트 출시에 대한 확장 지침을 제공하는 파트너  
D. 사용자의 애플리케이션 아키텍처를 검토하는 AWS 전담 직원  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. 사용자 전담 기술 전문가  

기술 전문 지원은 AWS Support 팀이 담당

B. AWS 청구 및 지원에 대한 주요 연락 담당자  

AWS Concierge 팀은 `AWS 청구 관련 문제` 지원, 고객의 청구 문제 해결해주는 팀

C. 이벤트 출시에 대한 확장 지침을 제공하는 파트너  

AWS Solution Architecture 팀이 담당

D. 사용자의 애플리케이션 아키텍처를 검토하는 AWS 전담 직원  

AWS Solution Architecture 팀이 담당

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 133

A company needs to generate reports that can break down cloud costs by product, by company-defined tags, and by hour, day, and month.  
Which AWS tool should the company use to meet these requirements?  

A. Reserved Instance utilization and coverage reports  
B. Savings Plans utilization reports  
C. AWS Budgets reports  
D. AWS Cost and Usage Reports  

[번역]  
회사는 제품별, 회사에서 정의한 태그별, 시간별, 일별, 월별로 클라우드 비용을 분류하는 보고서를 생성해야 합니다.  
이 요구 사항을 충족하기 위해 어떤 AWS 도구를 사용해야 합니까?  

A. 예약 인스턴스 사용 및 적용 범위 보고서  
B. 절약 플랜 사용 보고서  
C. AWS 예산 보고서  
D. AWS 비용 및 사용 보고서  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. 예약 인스턴스 사용 및 적용 범위 보고서  

예약 인스턴스 사용 관련 내용으로 해당 안함

B. 절약 플랜 사용 보고서  

Saving Plans 관련 내용으로 해당 안함

C. AWS 예산 보고서(AWS Budgets reports)  

상세한 비용 보고서 생성에는 제한이 있음

D. AWS 비용 및 사용 보고서(AWS Cost and Usage Reports)

클라우드 비용을 자세히 분석가능한 포괄적인 보고서 제공,  
`제품 태그`, `시간별`, `일별`, `월별`로 `비용 세분화`하여 데이터 제공

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 137

A company needs to design an AWS disaster recovery plan to cover multiple geographic areas.  
Which action will meet this requirement?  

A. Configure multiple AWS accounts.  
B. Configure the architecture across multiple Availability Zones in an AWS Region.  
C. Configure the architecture across multiple AWS Regions.  
D. Configure the architecture among many edge locations.  

[번역]  
회사는 여러 지리적 영역을 포괄하는 AWS 재해 복구 계획을 설계해야 합니다.  
이 요구 사항을 충족하는 작업은 무엇입니까?  

A. 여러 AWS 계정을 구성합니다.  
B. 한 AWS 리전 내의 여러 가용 영역에 아키텍처를 구성합니다.  
C. 여러 AWS 리전에 걸쳐 아키텍처를 구성합니다.  
D. 여러 엣지 로케이션에 아키텍처를 구성합니다.  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. 여러 AWS 계정을 구성합니다.  

`AWS 여러 계정`을 만드는것은 `보안`, `비용 관리`, `리소스 분리`를 위해 `유용`함,  
하지만 지리적 재해에 대비하는건 아님.

B. 한 AWS 리전 내의 여러 가용 영역에 아키텍처를 구성합니다.  

여러 가용영역에 구성하면 리전에 문제 발생하면 복구 불가능.

C. 여러 AWS 리전에 걸쳐 아키텍처를 구성합니다.  

위에서 말한게 리전 단위이기에 리전에 걸쳐 아키를 구성해야함.

D. 여러 엣지 로케이션에 아키텍처를 구성합니다.  

엣지 로케이션은 각 리전별 캐싱 서버의 위치로, 재해와 상관없음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 142

Which task does AWS perform automatically?  

A. Encrypt data that is stored in Amazon DynamoDB  
B. Patch Amazon EC2 instances  
C. Encrypt user network traffic  
D. Create TLS certificates for users' websites  

[번역]  
AWS가 자동으로 수행하는 작업은 무엇입니까?  

A. Amazon DynamoDB에 저장된 데이터를 암호화합니다.  
B. Amazon EC2 인스턴스를 패치합니다.  
C. 사용자 네트워크 트래픽을 암호화합니다.  
D. 사용자의 웹사이트에 대한 TLS 인증서를 생성합니다.  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A (C인 것 같은데)

A. Amazon DynamoDB에 저장된 데이터를 암호화합니다.  

AWS `DynamoDB`는 `데이터 저장 시 자동으로 암호화를 수행`.  
하지만 `특정 암호화 옵션`은 `사용자가 설정`해야함.

B. Amazon EC2 인스턴스를 패치합니다.  

EC2 인스턴스 패치는 고객의 몫으로, Host 운영체제의 패치만 AWS에서 담당

C. 사용자 네트워크 트래픽을 암호화합니다.  

AWS는 기본적으로 네트워크 암호화를 통해 통신

D. 사용자의 웹사이트에 대한 TLS 인증서를 생성합니다.

사용자가 ACM 통해서 만들어야함

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 145

A company requires an isolated environment within AWS for security purposes.  
Which action can be taken to accomplish this?  

A. Create a separate Availability Zone to host the resources  
B. Create a separate VPC to host the resources  
C. Create a placement group to host the resources  
D. Create an AWS Direct Connect connection between the company and AWS  

[번역]  
회사는 보안 목적을 위해 AWS 내에서 격리된 환경이 필요합니다.  
이를 달성하기 위해 수행할 수 있는 작업은 무엇입니까?  

A. 리소스를 호스팅할 별도의 가용 영역 생성  
B. 리소스를 호스팅할 별도의 VPC 생성  
C. 리소스를 호스팅할 배치 그룹 생성  
D. 회사와 AWS 간에 AWS Direct Connect 연결 생성  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

VPC(Virtual Private Network)는 사용자가 정의한 가상 사설망 네트워크를 제공하는 서비스다.  
이러한 VPC는 크게 공인 서브넷(public subnet)과 사설 서브넷(private subnet)로 구성이 되어 있으며,  
IGW(Interney gateway)를 통해 공인 서브넷에서는 인터넷 통신이 가능하고, 사설 서브넷에서는 통신이 불가능하다.  

또한 서브넷을 사용하는 이유는 게이트웨이에 대한 접근 제어 및 관리를 위해 사용이 된다.  
어떠한 부분은 퍼블릭 인터넷으로 연결하고, 어떠한 부분은 사설 서브넷으로 구성하고.
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 150

A company has refined its workload to use specific AWS services to improve efficiency and reduce cost.  
Which best practice for cost governance does this example show?  

A. Resource controls  
B. Cost allocation  
C. Architecture optimization  
D. Tagging enforcement  

[번역]  
회사는 특정 AWS 서비스를 사용하여 워크로드를 개선하여 효율성을 높이고 비용을 절감했습니다.  
이 예는 비용 관리 모범 사례 중 어떤 것을 보여줍니까?  

A. 리소스 제어  
B. 비용 할당  
C. 아키텍처 최적화  
D. 태그 적용  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. 리소스 제어  

`특정 리소스`에 대한 `엑세스`를 `관리`하거나 `제한` 하는것을 의미.  

B. 비용 할당  

비용을 `특정 리소스`나 `부서`에 `할당`하여 `비용`을 `추적하는 과정`을 의미한다.  
`태그`, `Cost Explorer`, `비용 할당 보고서` 존재.

C. 아키텍처 최적화  

특정 `AWS 서비스`를 `사용`하여 `워크로드를 개선`하고 `효율성`을 높이며 `비용을 절감`하는 것은 아키텍처 최적화의 일환이다.  

D. 태그 적용  

태그는 리소스에 태그를 적용하는 것을 의미하는 것으로 리소스 추적을 위해 사용한다.  
워크로드를 개선하여 비용을 절감하는 것과는 무관한 부분

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 157

A company wants to migrate a small website and database quickly from on-premises infrastructure to the AWS Cloud.  
The company has limited operational knowledge to perform the migration.  
Which AWS service supports this use case?  

A. Amazon EC2  
B. Amazon Lightsail  
C. Amazon S3  
D. AWS Lambda  

[번역]  
회사는 온프레미스 인프라에서 AWS 클라우드로 작은 웹사이트와 데이터베이스를 신속하게 마이그레이션하려고 합니다.  
회사는 마이그레이션을 수행할 운영 지식이 제한적입니다.  
이 사용 사례를 지원하는 AWS 서비스는 무엇입니까?  

A. Amazon EC2  
B. Amazon Lightsail  
C. Amazon S3  
D. AWS Lambda  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon EC2  

유연하고 강력한 기능을 제공하지만 기술적 세부사항을 요구한다.  
하여 제한된 운영 지식이 있는 경우 복잡할 수 있음.

B. Amazon Lightsail  

`간단하고 저렴한 VM`, `스토리지`, 네트워킹 솔류션 제공.  
`간단한 웹` + `DB`를 `쉽게 호스팅`하기 위해 설계된 서비스.

C. Amazon S3  

스토리지 서비스로 DB 기능은 제공하지 않음, 호스팅하는 방법도 없음

D. AWS Lambda  

서버리스 컴퓨팅을 제공, 웹 + DB를 호스팅하기에는 적절하지 않음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 158

A company is moving multiple applications to a single AWS account. The company wants to monitor the AWS Cloud costs incurred by each application.  
What can the company do to meet this requirement?  

A. Set up invoiced billing  
B. Use AWS Artifact  
C. Set budgets in Cost Explorer  
D. Create cost allocation tags  

[번역]  
회사는 여러 애플리케이션을 단일 AWS 계정으로 이전하고 있습니다. 각 애플리케이션에서 발생하는 AWS 클라우드 비용을 모니터링하고 싶습니다.  
회사가 이 요구 사항을 충족하기 위해 할 수 있는 일은 무엇입니까?  

A. 청구서 청구 설정  
B. AWS Artifact 사용  
C. 비용 탐색기에서 예산 설정  
D. 비용 할당 태그 생성  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. Set up invoiced billing  

`청구서`는 `전체 계정`에 대한 `청구`를 `관리`.  
개별 애플리케이션 비용 추적 불가능.

B. Use AWS Artifact  

`AWS` `규정 준수 문서`와 `보고서`를 `생성`하는 서비스.

C. Set budgets in Cost Explorer(비용 탐색기에서 예산 설정)

비용 탐색기에서 예산 설정 가능하지만, 예산 설정은 비용 추적의 일부로  
개별 애플리케이션의 비용 추적 불가능.

D. Create cost allocation tags  

`비용 할당 태그`를 `사용`하면 AWS 리소스에 태그를 할당하여 각 `애플리케이션의 비용을 추적할 수 있다`.  
이를 통해 애플리케이션의 비용을 명확히 파악 할 수 있음.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 163

A company has a social media platform in which users upload and share photos with other users.  
The company wants to identify and remove inappropriate photos. The company has no machine learning (ML) scientists and must build this detection capability with no ML expertise.  
Which AWS service should the company use to build this capability?  

A. Amazon SageMaker  
B. Amazon Textract  
C. Amazon Rekognition  
D. Amazon Comprehend  

[번역]  
회사는 사용자가 사진을 업로드하고 다른 사용자와 공유하는 소셜 미디어 플랫폼을 운영하고 있습니다.  
부적절한 사진을 식별하고 제거하려고 하지만, 기계 학습(ML) 전문가가 없고 ML 전문 지식 없이 이 기능을 구축해야 합니다.  
이 기능을 구축하는 데 사용할 AWS 서비스는 무엇입니까?  

A. Amazon SageMaker  
B. Amazon Textract  
C. Amazon Rekognition  
D. Amazon Comprehend  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Amazon SageMaker  

`AWS SageMaker`는 `기계 학습 모델`을 `개발`하고 `배포`하는데 사용하는 도구.  
하지만 회사에 ML 전문가가 없고, 전문 지식없이 부적절한 이미지를 식별해야 하기에,  
SageMaker를 통해 직접 모델을 만드는 것은 적합하지 않음.

B. Amazon Textract  

`AWS Textract`은 `이미지 내`에서 `텍스트를 추출`하는 서비스.  
이미지에서 텍스트를 뽑는 것으로, 식별을 불가능함.

C. Amazon Rekognition  

`AWS Rekognition`은 `이미지` + `비디오 분석`을 위한 AWS 서비스로,  
기계 학습(ML) 없이도 `이미지` + `비디오` `분석`이 `가능`하다.  
특히 `부적절한 컨텐츠`를 `자동`으로 `감지`, 이를 `제거하는 기능` 제공.  
소셜 미디어 환경에서 사용자가 올린 부적절한 이미지 검증 가능.

D. Amazon Comprehend  

> 텍스트를 기반으로 사용자의 감정 분석

`AWS Comprehend`는 `텍스트 분석 서비스`로, `감정 분석`, `주제 모델링` 등 지원  
사진(이미지)이 아닌 `텍스트를 분석하는 서비스로`, 부적절한 사진 고르는 기능은 없음.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 164

Which responsibility belongs to AWS when a company hosts its databases on Amazon EC2 instances?  

A. Database backups  
B. Database software patches  
C. Operating system patches  
D. Operating system installations  

[번역]  
회사가 Amazon EC2 인스턴스에서 데이터베이스를 호스팅할 때 AWS의 책임은 무엇입니까?  

A. 데이터베이스 백업  
B. 데이터베이스 소프트웨어 패치  
C. 운영 체제 패치  
D. 운영 체제 설치  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

`AWS`와 `사용자`의 `책임 범위`는 `공유 책임 모델`에 따라 구분된다.  
AWS EC2를 사용하는 경우, `운영체제`와 같은 `물리적 인프라`와 `가상화 계층`은 `AWS의 책임`.  
하지만 그 이외의 작업은, 특히 DB 및 운영 체제의 관리와 관련된 부분은 `사용자 책임`

A. 데이터베이스 백업  

EC2 서버 상에서 DB를 호스팅하는 경우, DB 백업의 책임은 사용자에게 있음.

B. 데이터베이스 소프트웨어 패치  

EC2 서버 상에서 DB를 호스팅하는 경우, DB S/W 패치는 사용자에게 있음.

C. 운영 체제 패치  

EC2 서버 상에서 DB를 호스팅하는 경우, 운영체제 패치는 사용자에게 있음.

D. 운영 체제 설치  

EC2 서버상의 `운영체제 설치`는 `사용자가 아닌 AWS에게 있음`.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 165

A company wants to use Amazon S3 to store its legacy data.  
The data is rarely accessed. However, the data is critical and cannot be recreated.  
The data needs to be available for retrieval within seconds.  
Which S3 storage class meets these requirements MOST cost-effectively?  

A. S3 Standard  
B. S3 One Zone-Infrequent Access (S3 One Zone-IA)  
C. S3 Standard-Infrequent Access (S3 Standard-IA)  
D. S3 Glacier  

[번역]  
회사는 레거시 데이터를 저장하기 위해 Amazon S3를 사용하려고 합니다.  
데이터는 거의 액세스되지 않지만, 중요한 데이터이며 재생성할 수 없습니다.  
데이터는 몇 초 이내에 검색할 수 있어야 합니다.  
이 요구 사항을 가장 비용 효율적으로 충족하는 S3 스토리지 클래스는 무엇입니까?  

A. S3 표준  
B. S3 원존-비정기적 액세스(S3 One Zone-IA)  
C. S3 표준-비정기적 액세스(S3 Standard-IA)  
D. S3 Glacier  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. S3 표준(S3 Standard)

`AWS S3 Standard`는 자주 엑세스되는 데이터를 위한 스토리지 클래스로,  
`데이터 검색 속도`가 `빠르지만` `비용`이 `상대적으로 높다`.  
거의 엑세스 하지 않는 데이터의 경우 효율적인 선택이 아님.

B. S3 원존-비정기적 액세스(S3 One Zone-IA)  

`AWS S3 One Zone-IA`는 `비용`이 `저렴`하지만, `데이터`가 `하나의 가용 영역`에만 저장됨.  
이로 인해 데이터 손실이 있을 수 있으며, 중요 데이터 저장에는 적합하지 않음.

C. S3 표준-비정기적 액세스(S3 Standard-IA)  

`AWS S3 Standard-IA`는 `드물게 엑세스`하는 `데이터`에 적합한 스토리지 클래스.  
`높은 내구성`을 제공하며, `여러 가용 영역`에 `데이터`를 `복제`하며 몇 초안에 데이터 검색 가능.

D. S3 Glacier  

`AWS S3 Glacier`는 `아카이빙 용도`로 `사용`되며, `데이터 검색`에 `수분`에서 `수시간`까지 걸릴 수 있음,  
`데이터`를 `몇 초 이내`에 `검색`해야 하는 경우는 적합하지 않음.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 168

A company needs to build an application that uses AWS services. The application will be delivered to residents in European countries.  
The company must abide by regional regulatory requirements.  
Which AWS service or program should the company use to determine which AWS services meet the regional requirements?  

A. AWS Audit Manager  
B. AWS Shield  
C. AWS Compliance Program  
D. AWS Artifact  

[번역]  
회사는 AWS 서비스를 사용하는 애플리케이션을 구축해야 합니다. 이 애플리케이션은 유럽 국가 거주자에게 제공될 예정이며, 회사는 지역 규정 요구 사항을 준수해야 합니다.  
AWS 서비스가 해당 지역 규정을 충족하는지 확인하는 데 사용할 수 있는 AWS 서비스 또는 프로그램은 무엇입니까?  

A. AWS 감사 관리자(Audit Manager)  
B. AWS Shield  
C. AWS 준수 프로그램(Compliance Program)  
D. AWS Artifact  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS Audit Manager  

`AWS Audit Manager`는 `특정 감사 요건`을 `지속적`으로 `평가`하는 `관리 도구`로,  
특정 지역의 규정 준수를 확인하거나 결정하는 기능은 아님.

B. AWS Shield  

`AWS Shield`는 `DDos 공격`을 막기위한 AWS 서비스이다.

C. AWS Compliance Program  

`AWS Compliance Program`은 `AWS`가 `전 세계적`으로 준수하는 `규정`, `표준`, `법적 요구사항`을 이해하고,  
`특정 region별`로 특정 `AWS 서비스`가 `어떤 규제`를 따르는지 확인 가능.

D. AWS Artifact  

`AWS Artifact`는 `규정 준수 관련 보고서` 및 `문서`를 `다운`로드 할 수 있는 `도구`이다.  
하지만 `Artifact 자체가 특정 지역의 규정 준수를 확인하거나 결정하는 기능은 아님`.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 169

A company needs to implement identity management for a fleet of mobile apps that are running in the AWS Cloud.  
Which AWS service will meet this requirement?  

A. Amazon Cognito  
B. AWS Security Hub  
C. AWS Shield  
D. AWS WAF  

[번역]  
회사는 AWS 클라우드에서 실행되는 모바일 앱을 위한 ID 관리를 구현해야 합니다.  
이 요구 사항을 충족하는 AWS 서비스는 무엇입니까?  

A. Amazon Cognito  
B. AWS Security Hub  
C. AWS Shield  
D. AWS WAF  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. Amazon Cognito  

`AWS Cognito`는 `모바일` + `웹 애플리케이션`에 대한 `사용자 인증` 및 `ID를 관리`하는 `서비스`.

B. AWS Security Hub  

`AWS Security Hub`는 `AWS 환경의 전반적인 보안 상태를 관리`하고 `모니터링`하는 도구.

C. AWS Shield  

`AWS Shield`는 `DDos 공격`을 막기위한 AWS 서비스.

D. AWS WAF

`AWS WAF`는 `웹 애플리케이션 방화벽`으로, `SQL Injection`이나 `XSS`와 같은 공격을 막기위한 방화벽.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 173

A company is creating a document that defines the operating system patch routine for all the company's systems.  
Which AWS resources should the company include in this document? (Choose two.)

A. Amazon EC2 instances  
B. AWS Lambda functions  
C. AWS Fargate tasks  
D. Amazon RDS instances  
E. Amazon Elastic Container Service (Amazon ECS) instances  

[번역]  
회사는 회사의 모든 시스템에 대한 운영 체제 패치 절차를 정의하는 문서를 작성하고 있습니다.  
이 문서에 포함해야 할 AWS 리소스는 무엇입니까? (두 개를 선택하세요.)  

A. Amazon EC2 인스턴스  
B. AWS Lambda 함수  
C. AWS Fargate 작업  
D. Amazon RDS 인스턴스  
E. Amazon Elastic Container Service (Amazon ECS) 인스턴스  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, E

A. Amazon EC2 인스턴스  

`AWS EC2`는 사용자가 직접 운영체제 패치를 관리하는 가상 머신.  
따라서 가상화된 EC2의 패치는사용자가 담당.

B. AWS Lambda 함수  

`AWS Lambda 함수`는 서버리스 서비스로, 운영 체제 관리는 AWS에서 처리한다. 

C. AWS Fargate 작업  

`AWS Fargate`는 `컨테이너 실행`을 위한 `서버리스 컴퓨팅 엔진`으로,  
`운영체제 패치가 필요하지 않음`.

D. Amazon RDS 인스턴스  

`AWS RDS`는 `AWS`에서 `관리`하는 DB로 `AWS가 직접 운영체제 패치를 담당`.

E. Amazon Elastic Container Service (Amazon ECS) 인스턴스

`ECS 인스턴스`는 클러스터 내에서 컨테이너를 실행하는 `AWS EC2 인스턴스에서 동작`한다.  
하여 인스턴스들도 OS 패치가 필요하다.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 175

A company is starting to build its infrastructure in the AWS Cloud.  
The company wants access to technical support during business hours.  
The company also wants general architectural guidance as teams build and test new applications.  
Which AWS Support plan will meet these requirements at the LOWEST cost?  

A. AWS Basic Support  
B. AWS Developer Support  
C. AWS Business Support  
D. AWS Enterprise Support  

[번역]  
회사는 AWS 클라우드에서 인프라를 구축하기 시작하고 있습니다.  
회사는 근무 시간 동안 기술 지원에 접근하고 싶어 하며, 팀이 새로운 애플리케이션을 구축하고 테스트할 때 일반적인 아키텍처 지침을 원합니다.  
이 요구 사항을 가장 저렴한 비용으로 충족하는 AWS 지원 플랜은 무엇입니까?  

A. AWS 기본 지원(Basic Support)  
B. AWS 개발자 지원(Developer Support)  
C. AWS 비즈니스 지원(Business Support)  
D. AWS 엔터프라이즈 지원(Enterprise Support)  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. AWS 기본 지원(Basic Support)  

`AWS Bastic Support`는 `기본적인 고객 지원만 제공`하며, `기술 지원`은,  
오직 `헬프 데스크 문서`와 `리소스`에만 `의존 가능`하다.

B. AWS 개발자 지원(Developer Support)  

`AWS Developer Support`는 `근무 시간 동안의 기술 지원 제공`, AWS에 대한 일반적인 사용법 + 아키텍처 조언 받을 수 있음.

C. AWS 비즈니스 지원(Business Support)  

`AWS Business Support`는 `24/7 기술지원 제공`, `아키텍처`에 대한 `조언`을 받을 수 있지만 `비용이 높음`.

D. AWS 엔터프라이즈 지원(Enterprise Support)  

`AWS Enterprise Support`는 `최고 수준의 지원 제공`, `전담 기술 계정 관리자`(`TAM`)와 `24/7 지원`,  
고급 아키텍처 리뷰 등을 포함한 가장 비싼 옵션.

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 182

A company needs an automated security assessment report that will identify unintended network access to Amazon EC2 instances.  
The report also must identify operating system vulnerabilities on those instances.  
Which AWS service or feature should the company use to meet this requirement?  

A. AWS Trusted Advisor  
B. Security groups  
C. Amazon Macie  
D. Amazon Inspector  

[번역]  
회사는 Amazon EC2 인스턴스에 대한 의도하지 않은 네트워크 액세스를 식별하는 자동 보안 평가 보고서가 필요합니다.  
보고서에는 해당 인스턴스의 운영 체제 취약성도 포함되어야 합니다.  
이 요구 사항을 충족하는 AWS 서비스 또는 기능은 무엇입니까?  

A. AWS Trusted Advisor  
B. 보안 그룹(Security Groups)  
C. Amazon Macie  
D. Amazon Inspector  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. AWS Trusted Advisor  

`AWS Trusted Advisor`는 애플리케이션의 성능, 비용 최적화 등에 대한 다양한 권장 사항을 제공해주는 서비스이다.  
해당 서비스를 통해 어떤 부분에서 비용을 감소할 수 있고, 성능을 개선할 수 있는지 리스트 목록으로 보여준다.

B. 보안 그룹(Security Groups)  

보안그룹은 인스턴스 레벨에서 패킷의 엑세스를 제어하는 서비스 중 하나이다.  
이러한 보안 그룹은 기본적으로 Stateful로써 상태를 기억하는것은 물론이며, 인바운드는 기본적으로 맨 처음에는 모두  
허용되어 있지않고 아웃바운드는 기본적으로 0.0.0.0로 뚫려 있다. 최소 보안 권한

C. Amazon Macie  

`AWS Macie`는 `데이터 보호`와 `프라이버시`를 중점적으로 다루는 서비스이다.  
주요 기능으로는 아래와 같은 기능이 존재한다.

- 데이터 식별 및 분류
  - Amazon `S3`에 `저장`된 `민감한 개인정보 관련 데이터`를 `자동`으로 `식별` + `분류` 한다
- 데이터 보호
  - 민감한 데이터가 보호되고 있는지 모니터링 진행
- 위협 탐지
  - `비정상`적인 데이터 접근 패턴(S3 접근, 대용량 다운로드) 감지
- 리포트 및 경고
  - 데이터 보호 상태 관련 리포트 제공은 물론, 위협을 탐지하면 경고(alert)도 제공

D. Amazon Inspector  

- `AWS Inspector`는 `자동화된 보안 평가 보고서`를 제공
- `EC2 보안 상태 자동 평가`
- `네트워크 접근 제어` 및 `운영체제 취약점` 식별

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 183

A global company is building a simple time-tracking mobile app.  
The app needs to operate globally and must store collected data in a database.  
Data must be accessible from the AWS Region that is closest to the user.  
What should the company do to meet these data storage requirements with the LEAST amount of operational overhead?  

A. Use Amazon EC2 in multiple Regions to host separate databases  
B. Use Amazon RDS cross-Region replication  
C. Use Amazon DynamoDB global tables  
D. Use AWS Database Migration Service (AWS DMS)  

[번역]  
글로벌 회사가 간단한 시간 추적 모바일 앱을 구축하고 있습니다.  
앱은 전 세계적으로 작동해야 하며, 수집된 데이터를 데이터베이스에 저장해야 합니다.  
데이터는 사용자와 가장 가까운 AWS 리전에서 액세스 가능해야 합니다.  
이 데이터 저장 요구 사항을 가장 적은 운영 오버헤드로 충족하려면 어떻게 해야 합니까?  

A. 여러 리전에 Amazon EC2를 사용하여 별도의 데이터베이스 호스팅  
B. Amazon RDS 크로스 리전 복제 사용  
C. Amazon DynamoDB 글로벌 테이블 사용  
D. AWS Database Migration Service (AWS DMS) 사용  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. 여러 리전에 Amazon EC2를 사용하여 별도의 데이터베이스 호스팅  

- 이 방법은 DB를 각 리전(서울, 도쿄, 오하이오.. 등)에 수동으로 설정하고 관리 필요
- 데이터 동기화 및 복제 작업도 사용자가 처리해주어야 함(운영 오버헤드 큼)

B. Amazon RDS 크로스 리전 복제 사용  

- RDS의 크로스 리전 복제는 DB의 `리전 간 복제를 지원`
- `DynamoDB 글로벌 테이블`보다 `복잡`하고 `관리 어려움`
- DynamoDB보다 운영 오버헤드 큼

C. Amazon DynamoDB 글로벌 테이블 사용  

`AWS DynamoDB 글로벌 테이블`은 `글로벌 애플리케이션 관리`를 위한 `완전 관리형`, `멀티-리전` `DB`이다.  
DynamoDB 글로벌 테이블의 장점은 아래와 같다.

- 낮은 지연 시간
  - `DynamoDB 글로벌 테이블`은 `여러 리전`(region)에 걸쳐 `자동 복제` 됨
  - 전 세계 사용자가 가까운 리전의 데이터를 사용 가능
- 최소 운영 오버헤드
  - `사용자`가 `복제` 및 `백업 작업` 직접 안해도 되기에 운영 오버헤드 거의 없음

D. AWS Database Migration Service (AWS DMS) 사용  

- AWS DMS는 `DB`를 다른 `DB`로 `마이그레이션`하거나 `복제`하는데 사용
- 데이터가 사용자가 가까운 리전에 복제되는건 아님

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 184

Which of the following are economic advantages of the AWS Cloud? (Choose two.)  

A. Increased workforce productivity  
B. Decreased need to encrypt user data  
C. Manual compliance audits  
D. Simplified total cost of ownership (TCO) accounting  
E. Faster product launches  

[번역]  
다음 중 AWS 클라우드의 경제적 이점은 무엇입니까? (두 개를 선택하세요.)  

A. 인력 생산성 향상  
B. 사용자 데이터 암호화 필요성 감소  
C. 수동 규정 준수 감사  
D. 간소화된 총 소유 비용(TCO) 회계  
E. 더 빠른 제품 출시  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D

A. 인력 생산성 향상  

- 인력을 사용하지 않으면 그만큼 인력 비용이 줄어드는것임

B. 사용자 데이터 암호화 필요성 감소  

- 물론 AWS가 네트워크, 데이터 등의 암호화를 수행해주는 부분도 존재
- 하지만 클라우드를 사용한다고 해서 암호화 필요성이 감소하는건 아니다

C. 수동 규정 준수 감사  
D. 간소화된 총 소유 비용(TCO) 회계  

- 온디멘드로 사용한만큼만 비용 지불
- 장비도 AWS 데이터센터에 있어서 소유 비용 감소

E. 더 빠른 제품 출시  

- 클라우드 환경에서 제품 출시 속도가 빨라질 수 있음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 185

Which controls does the customer fully inherit from AWS in the AWS shared responsibility model?  

A. Patch management controls  
B. Awareness and training controls  
C. Physical and environmental controls  
D. Configuration management controls  

[번역]  
AWS 공동 책임 모델에서 고객이 AWS로부터 완전히 상속받는 제어는 무엇입니까?  

A. 패치 관리 제어  
B. 인식 및 교육 제어  
C. 물리적 및 환경적 제어  
D. 구성 관리 제어  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 192

A company wants to migrate to AWS and use the same security software it uses on premises.  
The security software vendor offers its security software as a service on AWS.  
Where can the company purchase the security solution?  

A. AWS Partner Solutions Finder  
B. AWS Support Center  
C. AWS Management Console  
D. AWS Marketplace  

[번역]  
회사는 AWS로 마이그레이션하고 온프레미스에서 사용하는 동일한 보안 소프트웨어를 사용하고자 합니다.  
보안 소프트웨어 공급업체는 AWS에서 서비스로 제공하는 보안 소프트웨어를 제공합니다.  
회사가 이 보안 솔루션을 구매할 수 있는 곳은 어디입니까?  

A. AWS 파트너 솔루션 파인더  
B. AWS 지원 센터  
C. AWS 관리 콘솔  
D. AWS 마켓플레이스  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. AWS 파트너 솔루션 파인더  

`AWS 파트너 솔루션 파인더`는 `AWS 파트너 네트워크`(APN)를 찾고 `검색`하는데 사용한다.  

- `AWS`와 `협력`하는 `기업`들이 `제공하는 서비스`를 `검색`하는 데 초점을 맞춤
- 제공하는 서비스에 대한 `기능` + `연락처`는 알 수 있으나 `구매` + `설치`는 AWS 마켓플레이스에서 이루어짐

B. AWS 지원 센터  

`AWS 지원 센터`는 기술 지원을 해주는 곳이지, S/W를 구매하는 공간이 아님

C. AWS 관리 콘솔  

`AWS 관리 콘솔`을 AWS 리소스를 관리하는데 사용하며, S/W를 구매하는 공간은 아님

D. AWS 마켓플레이스  

`AWS 마켓플레이스`는 `AWS 클라우드`에서 `사용`할 수 있는 `S/W를 구매하는 온라인 상점`이다.  
`다양한 공급업체`가 제공하는 `S/W 솔루션`을 `찾고` `구매`할 수 있으며, 여기에 보안 S/W 같은 여러 범주의 솔루션이 포함됨.  

- 보안 S/W 공급 업체가 AWS 마켓플레이스에 자신의 S/W를 등록 및 제공
- 고객이 AWS 마켓 플레이스를 통해 보안 S/W 구매

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 193

A company is generating large sets of critical data in its on-premises data center.  
The company needs to securely transfer the data to AWS for processing. These transfers must occur daily over a dedicated connection.  
Which AWS service should the company use to meet these requirements?  

A. AWS Backup  
B. AWS DataSync  
C. AWS Direct Connect  
D. AWS Snowball  

[번역]  
회사는 온프레미스 데이터 센터에서 대량의 중요한 데이터를 생성하고 있습니다.  
회사는 이 데이터를 처리하기 위해 AWS로 안전하게 전송해야 합니다. 이러한 전송은 전용 연결을 통해 매일 이루어져야 합니다.  
이 요구 사항을 충족하기 위해 회사가 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS Backup  
B. AWS DataSync  
C. AWS Direct Connect  
D. AWS Snowball  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS Backup  

`AWS Backup`은 AWS `리소스` 혹은 `데이터`를 `백업`을 관리하는 서비스이지 온프레미스 데이터를 전송하는 서비스는 아님

B. AWS DataSync  

`AWS DataSync`는 `데이터`를 `온프레미스`에서 `AWS`로 `자동`으로 `전송`하는 `서비스`이다.  

- 대량 데이터를 전송하는데 유용
- `전용 연결`을 `제공하지 않기에` 위 조건에 맞지 않음

C. AWS Direct Connect  

`AWS Direct Connect`는 온프레미스와 AWS 간의 전용 광섬유 망을 통해 통신을 가능하게 하는 서비스이다.  

- `AWS Direct Connect`는 `공용 네트워크 대역`을 사용하지 않음
- `전용 회선`을 통해 `안정적`이고 `일관된 성능` 제공

D. AWS Snowball  

- `AWS Snowball`은 `물리적 장치`를 사용해 `데이터`를 `전송`하는 서비스
- `한 번에 대규모 데이터 오프라인으로 전송할때는 유용`하지만, `매일 전송은 부적합`

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 195

Which of the following is a managed AWS service that is used specifically for extract, transform, and load (ETL) data?  

A. Amazon Athena  
B. AWS Glue  
C. Amazon S3  
D. AWS Snowball Edge  

[번역]  
다음 중 추출, 변환 및 로드(ETL) 데이터를 위해 특별히 사용되는 관리형 AWS 서비스는 무엇입니까?  

A. Amazon Athena  
B. AWS Glue  
C. Amazon S3  
D. AWS Snowball Edge  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon Athena  

`AWS Athena`는 `S3`에 저장된 데이터를 `쿼리`할 수 있는 서비스로, ETL 작업은 안함.  
주로 `SQL`을 `사용`하여 데이터 조회.

B. AWS Glue  

`AWS Glue`는 `ETL`(`Extract`, `Transform`, `Load`) 작업을 `자동화`하고 `관리`하기 위한 AWS 서비스이다.  
`AWS Glue`는 `데이터`를 `추출`하고 `변환`하고 `다양한 데이터 저장소에 로드`하는 ETL 서비스.

C. Amazon S3  

`AWS S3`는 `객체 스토리지 서비스`로 데이터 저장 및 관리.

D. AWS Snowball Edge  

`AWS Snowball Edge`는 `대용량 데이터`를 `물리적`으로 `이동`하는데 사용하는 `장비`.  
주로 온프레미스에서 AWS로 데이터를 전송하기 위해 사용하며 ETL 작업을 수행하는 서비스는 아니다.

- 온프레미스 -> 클라우드로 -> 대용량 데이터 전송하기 위한 -> `물리 장비`
- `인터넷 연결`이 `제한`된 환경에서 작업 수행을 위한 -> `물리 장비`

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 198

What information is found on an AWS Identity and Access Management (IAM) credential report? (Choose two.)  

A. The date and time when an IAM user's password was last used to sign in to the AWS Management Console.  
B. The type of multi-factor authentication (MFA) device assigned to an IAM user.  
C. The User-Agent browser identifier for each IAM user currently logged in.  
D. Whether multi-factor authentication (MFA) has been enabled for an IAM user.  
E. The number of incorrect login attempts by each IAM user in the previous 30 days.  

[번역]  
AWS Identity and Access Management (IAM) 자격 증명 보고서에서 찾을 수 있는 정보는 무엇입니까? (두 개를 선택하세요.)  

A. IAM 사용자가 마지막으로 AWS 관리 콘솔에 로그인할 때 사용한 비밀번호의 날짜 및 시간  
B. IAM 사용자에게 할당된 다단계 인증(MFA) 장치 유형  
C. 현재 로그인 중인 각 IAM 사용자의 사용자 에이전트 브라우저 식별자  
D. IAM 사용자에 대해 다단계 인증(MFA)이 활성화되었는지 여부  
E. 지난 30일 동안 각 IAM 사용자의 잘못된 로그인 시도 횟수  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D

IAM Credential report에는 아래 정보가 나온다.

- IAM 사용자가 마지막으로 콘솔에 로그인할때 사용한 비밀번호의 날짜 및 시간
- IAM 다단계 인증 MFA이 활성화 되었는지 여부

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 199

What is the LEAST expensive AWS Support plan that contains a full set of AWS Trusted Advisor best practice checks?  

A. AWS Enterprise Support  
B. AWS Business Support  
C. AWS Developer Support  
D. AWS Basic Support  

[번역]  
AWS Trusted Advisor 모범 사례 검사를 전체 세트로 제공하는 가장 저렴한 AWS 지원 플랜은 무엇입니까?  

A. AWS 엔터프라이즈 지원  
B. AWS 비즈니스 지원  
C. AWS 개발자 지원  
D. AWS 기본 지원  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. AWS 엔터프라이즈 지원  

- 가장 포괄적인 지원 제공
- Trusted Advisor의 모든 검사를 포함하지만 비용이 더 높음

B. AWS 비즈니스 지원  

- 모범 사례 검사를 전체적으로 제공하는 가장 저렴한 플랜
- `비용 최적화`, `보안`, `성능`, `서비스 제한`, `내결함성` 관련 `모범사례 검사` 제공

C. AWS 개발자 지원  

- `Trusted Advisor`의 일부 검사만 지원, 모든 모범 사례 지원 안함

D. AWS 기본 지원  

- `Trusted Advisor`의 주요 기능 및 검사에 대한 접근권한 제한

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 204

Which of the following is a benefit of decoupling an AWS Cloud architecture?  

A. Reduced latency  
B. Ability to upgrade components independently  
C. Decreased costs  
D. Fewer components to manage  

[번역]  
다음 중 AWS 클라우드 아키텍처의 디커플링(Decoupling)의 이점은 무엇입니까?  

A. 지연 시간 감소  
B. 구성 요소를 독립적으로 업그레이드할 수 있는 능력  
C. 비용 감소  
D. 관리할 구성 요소 수 감소  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

- 디커플링의 이점은 구성 요소들이 독립적으로 작동하도록 할 수 있음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 211

Which AWS service should a company use to organize, characterize, and search large numbers of images?  

A. Amazon Transcribe  
B. Amazon Rekognition  
C. Amazon Aurora  
D. Amazon QuickSight  

[번역]  
회사가 대량의 이미지를 구성하고, 특성화하고, 검색하기 위해 사용할 AWS 서비스는 무엇입니까?  

A. Amazon Transcribe  
B. Amazon Rekognition  
C. Amazon Aurora  
D. Amazon QuickSight  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  

A. Amazon Transcribe  

- 음성 데이터를 텍스트로 변환하는 서비스
- 음성 데이터를 텍스트로 변환하여 자동으로 대본 및 자막을 생성해주는 서비스

B. Amazon Rekognition  

- 이미지 및 비디오 컨텐츠 분석 서비스
- `얼굴 인식` + `객체 탐지` 분석 서비스

C. Amazon Aurora  

- `AWS Aurora`는 관계형 데이터베이스
- 이미지 + 비디오 분석보다는 DB 데이터 관리에 사용

D. Amazon QuickSight  

- `AWS QuickSight`는 `데이터 분석` 및 `시각화 도구`
- `대시보드 생성` + `데이터 시각 분석`
- 이미지 분석 기능 없음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 214

Which AWS service or tool can a company set up to send notifications that a custom spending threshold has been reached or exceeded?  

A. AWS Budgets  
B. AWS Trusted Advisor  
C. AWS CloudTrail  
D. AWS Support  

[번역]  
회사는 사용자 정의된 지출 한도에 도달하거나 초과했을 때 알림을 보내기 위해 설정할 수 있는 AWS 서비스 또는 도구는 무엇입니까?  

A. AWS Budgets  
B. AWS Trusted Advisor  
C. AWS CloudTrail  
D. AWS Support  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. AWS Budgets  

- `AWS Budgets`는 `사용자 정의`된 `지출 한도 설정`
- 위 `한도 초과`하는 경우 `알림`을 `트리거`할 수 있는 서비스
- `이메일`, `SNS`통해 알림 받을 수 있음

B. AWS Trusted Advisor  

- 리소스 최적화 관련 권장 사항(비용, 성능, 보안) 제공
- 지출 한도 관련 알림 설정 없음

C. AWS CloudTrail  

- `API 호출 기록 추적 서비스`
- 지출 한도 관련 알림 설정 없음

D. AWS Support  

- `기술 지원 서비스`
- 지출 한도 관련 알림 설정 없음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 217

A company owns per-core software licenses.  
Which Amazon EC2 instance purchasing option must the company use for this license type?  

A. Reserved Instances  
B. Dedicated Hosts  
C. Spot Instances  
D. Dedicated Instances  

[번역]  
회사는 코어당 소프트웨어 라이선스를 소유하고 있습니다.  
이 라이선스 유형을 위해 회사가 사용해야 하는 Amazon EC2 인스턴스 구매 옵션은 무엇입니까?  

A. 예약 인스턴스  
B. 전용 호스트  
C. 스팟 인스턴스  
D. 전용 인스턴스  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Reserved Instances  

- 예약 인스턴스
- 물리적 H/W 제어 권한 없음

B. Dedicated Hosts  

- `Dedicated Hosts`는 `물리적 서버`의 `전체 제어권`을 제공한다
- 회사가 해당 서버에서 실행하는 모든 EC2의 CPU 및 소켓 수 제어 가능
  - 코어당 S/W 라이센스를 사용하는 고객에게 적합한 옵션

C. Spot Instances  

- AWS 리소스 중 사용하지 않는 자원을 제공하는 옵션
- 언제든지 중지 가능 + 라이센스 못 맞춤

D. Dedicated Instances  

- 고객 전용 물리 서버에서 실행하는 EC2 인스턴스
- `물리적 서버`의 `코어 수`나 `소켓`에 대한 `가시성 제어 제공 안함`

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 218

A company needs to set up user authentication for a new application.  
Users must be able to sign in directly with a user name and password, or through a third-party provider.  
Which AWS service should the company use to meet these requirements?  

A. AWS Single Sign-On  
B. AWS Signer  
C. Amazon Cognito  
D. AWS Directory Service  

[번역]  
회사는 새로운 애플리케이션에 대한 사용자 인증을 설정해야 합니다.  
사용자는 사용자 이름과 비밀번호로 직접 로그인하거나, 서드파티 제공자를 통해 로그인할 수 있어야 합니다.  
이 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS Single Sign-On  
B. AWS Signer  
C. Amazon Cognito  
D. AWS Directory Service  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS Single Sign-On  

- AWS SSO는 `기업`의 `사용자 인증` 및 `엑세스 관리`를 위한 서비스
- 여러 AWS 계정이나 애플리케이션에 단일 로그인(SSO) 제공하는데 사용

B. AWS Signer  

- `코드 서명`을 위한 서비스

C. Amazon Cognito  

- 사용자 이름과 비밀번호를 사용한 직접 로그인 가능한 서비스
- 소셜 로그인을 통한 사용자 인증 설정 가능한 서비스
- `AWS Cognito`는 `애플리케이션`에 `인증 기능`을 `쉽게 통합` 할 수 있도록 `지원`
- 개발자가 `사용자 인증` + `로그인 기능 구현`할 때 사용

D. AWS Directory Service  

- 온프레미스 or 클라우드 기반 디렉토리 서비스를 AWS에 설정하는데 사용

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 219

A company's IT team is managing MySQL database server clusters. The IT team has to patch the database and take backup snapshots of the data in the clusters.  
The company wants to move this workload to AWS so that these tasks will be completed automatically.  
What should the company do to meet these requirements?  

A. Deploy MySQL database server clusters on Amazon EC2 instances.  
B. Use Amazon RDS with a MySQL database.  
C. Use an AWS CloudFormation template to deploy MySQL database servers on Amazon EC2 instances.  
D. Migrate all the MySQL database data to Amazon S3.  

[번역]  
회사의 IT 팀은 MySQL 데이터베이스 서버 클러스터를 관리하고 있습니다.  
IT 팀은 데이터베이스를 패치하고 클러스터의 데이터를 백업 스냅샷으로 저장해야 합니다.  
회사는 이러한 작업이 자동으로 완료되도록 AWS로 이 워크로드를 이전하려고 합니다.  
이 요구 사항을 충족하기 위해 회사가 해야 할 일은 무엇입니까?  

A. Amazon EC2 인스턴스에서 MySQL 데이터베이스 서버 클러스터를 배포합니다.  
B. MySQL 데이터베이스로 Amazon RDS를 사용합니다.  
C. AWS CloudFormation 템플릿을 사용하여 Amazon EC2 인스턴스에서 MySQL 데이터베이스 서버를 배포합니다.  
D. MySQL 데이터베이스 데이터를 모두 Amazon S3로 마이그레이션합니다.  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B


A. Amazon EC2 인스턴스에서 MySQL 데이터베이스 서버 클러스터를 배포합니다.  

- EC2 인스턴스에 DB를 구성하는 경우 수동으로 패치 진행 해야함
- 자동화가 필요한 요구사항은 충족 못한다

B. MySQL 데이터베이스로 Amazon RDS를 사용합니다.  

- `MySQL`과 같은 관계형 DB를 쉽게 `설정` 및 `운영`할 수 있는 서비스
- `자동 패치`, `백업 스냅샷`, `자동 복구` 옵션 제공
- 수동으로 DB를 관리할 필요가 없음

C. AWS CloudFormation 템플릿을 사용하여 Amazon EC2 인스턴스에서 MySQL 데이터베이스 서버를 배포합니다.  

- `AWS CloudFormation`을 사용하여 인프라를 자동으로 배포 가능
- 데이터베이스 관리 작업은 여전히 수동으로 처리해야 함

D. MySQL 데이터베이스 데이터를 모두 Amazon S3로 마이그레이션합니다.  

- S3는 객체 스토리지 서비스
- MySQL과 같은 관계형 DB를 대체할 수 없음

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 224

A company wants to forecast future costs and usage of AWS resources based on past consumption.  
Which AWS service or tool will provide this forecast?  

A. AWS Cost and Usage Report  
B. Amazon Forecast  
C. AWS Pricing Calculator  
D. Cost Explorer  

[번역]  
회사는 과거 사용량을 기반으로 AWS 리소스의 미래 비용 및 사용량을 예측하려고 합니다.  
이 예측을 제공하는 AWS 서비스 또는 도구는 무엇입니까?  

A. AWS 비용 및 사용 보고서  
B. Amazon Forecast  
C. AWS 가격 계산기  
D. 비용 탐색기  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. AWS Cost and Usage Report(AWS 비용 및 사용 보고서)

- `AWS 비용 및 사용 보고서`는 `리소스`의 `상세한 사용` 및 `비용 데이터`를 제공
- 미래 비용 예측 기능은 따로 제공 안함
- 주로 과거 데이터 분석 및 청구서를 검토하는 용도로 사용

B. Amazon Forecast

- `시계열 예측 서비스`
- `리소스 사용량 예측` 보다는 `매출`, `수요` `예측`에 사용

C. AWS Pricing Calculator(AWS 가격 계산기)

- 리소스 예상 비용 추정
- 미래 사용량 예측이 아닌, 리소스 사용 비요 계산 할 때 사용

D. Cost Explorer(비용 탐색기)

- `과거 AWS 리소스 사용량`과 `비용` 데이터를 `분석`하고, 이를 바탕으로 `미래 비용 및 사용량 예측`하는 도구

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 225

Which AWS services use cloud-native storage that provides replication across multiple Availability Zones by default? (Choose two.)  

A. Amazon ElastiCache  
B. Amazon RDS for Oracle  
C. Amazon Neptune  
D. Amazon DocumentDB (with MongoDB compatibility)  
E. Amazon Redshift  

[번역]  
기본적으로 여러 가용 영역에 걸쳐 복제를 제공하는 클라우드 네이티브 스토리지를 사용하는 AWS 서비스는 무엇입니까? (두 개를 선택하세요.)  

A. Amazon ElastiCache  
B. Amazon RDS for Oracle  
C. Amazon Neptune  
D. Amazon DocumentDB (MongoDB 호환)  
E. Amazon Redshift  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C, D

A. Amazon ElastiCache  

- 메모리 기반 캐싱 서비스
- 기본적으로 여러 가용 영역에 걸친 복제 제공 안함
- `다중 AZ 복제는 추가 설정으로 가능, 기본 설정 아님`

B. Amazon RDS for Oracle  

- `AWS RDS`는 다중 AZ 데이터 복제를 지원하지만, `설정 필요`
- 기본적으로는 `단일 가용 영역`에만 `배포됨`

C. Amazon Neptune  

- Graph DB
- 데이터를 자동으로 3개의 가용영역에 복제 + HA 보장

D. Amazon DocumentDB (MongoDB 호환)  

- 데이터를 자동으로 3개의 가용영역에 복제 + HA 보장

E. Amazon Redshift  

- 데이터 웨어 하우스 서비스
- 다중 AZ 복제 지원 안함

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 226

Which AWS services are serverless? (Choose two.)  

A. AWS Fargate  
B. Amazon Managed Streaming for Apache Kafka  
C. Amazon EMR  
D. Amazon S3  
E. Amazon EC2  

[번역]  
서버리스 AWS 서비스는 무엇입니까? (두 개를 선택하세요.)  

A. AWS Fargate  
B. Amazon Managed Streaming for Apache Kafka  
C. Amazon EMR  
D. Amazon S3  
E. Amazon EC2  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D

A. AWS Fargate  

- `AWS Fargate`는 `서버리스 컨테이너 관리 서비스`
- 사용자가 인프라 관리 없이도, 컨테이너 실행 가능
- `Fargate`가 `모든 인프라 관리`, 서버리스 서비스로 간주

B. Amazon Managed Streaming for Apache Kafka  

- `Kafka`는 기본적으로 `서버리스가 아님`
- 인프라 설정 및 관리 요구됨

C. Amazon EMR  

- `EMR`은 `빅데이터 처리 플랫폼`
- 기본적으로 서버리스 아님

D. Amazon S3  

- S3는 완전 객체 스토리지 서비스
- 사용자가 인프라 신경 안 써도 됨

E. Amazon EC2  

- 가상 서버
- 기본적으로 서버리스 아님

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 233

A company wants its employees to have access to virtual desktop infrastructure to securely access company-provided desktops through the employees' personal devices.  
Which AWS service should the company use to meet these requirements?  

A. Amazon AppStream 2.0  
B. AWS AppSync  
C. Amazon FSx for Windows File Server  
D. Amazon WorkSpaces  

[번역]  
회사는 직원들이 개인 기기를 통해 회사 제공 데스크탑에 안전하게 액세스할 수 있는 가상 데스크탑 인프라에 액세스할 수 있기를 원합니다.  
이 요구 사항을 충족하기 위해 회사가 사용해야 하는 AWS 서비스는 무엇입니까?  

A. Amazon AppStream 2.0  
B. AWS AppSync  
C. Amazon FSx for Windows File Server  
D. Amazon WorkSpaces  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. Amazon AppStream 2.0  

- 애플리케이션 스트리밍 서비스

B. AWS AppSync  

- `GraphQL` 기반 `API 서비스`
- `데이터 동기화` 및 `실시간 애플리케이션 데이터 제공`

C. Amazon FSx for Windows File Server  

- `Windows 파일 서버`를 `클라우드`에서 `호스팅`하는 서비스

D. Amazon WorkSpaces  

- `가상 데스크탑 인프라`(VDI) `서비스`
- `직원`들이 `개인 기기`를 통해 안전하게 `회사 제공 데스크탑에 원격 접근 지원`

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question 237

A company uses Amazon EC2 instances to run its web application. The company uses On-Demand Instances and Spot Instances.  
The company needs to visualize its monthly spending on both types of instances.  
Which AWS service or feature will meet this requirement?  

A. AWS Cost Explorer  
B. AWS Budgets  
C. Amazon CloudWatch  
D. AWS Cost Categories  

[번역]  
회사는 Amazon EC2 인스턴스를 사용하여 웹 애플리케이션을 실행합니다. 회사는 주문형 인스턴스와 스팟 인스턴스를 사용하고 있습니다.  
회사는 두 가지 유형의 인스턴스에 대한 월별 지출을 시각화해야 합니다.  
이 요구 사항을 충족하는 AWS 서비스 또는 기능은 무엇입니까?  

A. AWS 비용 탐색기  
B. AWS 예산  
C. Amazon CloudWatch  
D. AWS 비용 카테고리  

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. AWS 비용 탐색기(AWS Cost Explorer)

- AWS `리소스 사용량` 및 `비용`을 `시각화`하고 `분석`하는 도구
- `월별 비용`, `서비스별 지출`, `인스턴스 유형별 비용` 확인 가능

B. AWS 예산(AWS Budget)

- AWS Budget은 `지출 한도 설정`, `예산`에 `도달`하면 `알림 받는 기능 제공`
- 지출을 시각적으로 분석하는데 적합하지 않음

C. Amazon CloudWatch

- AWS `서비스 모니터링` 및 `로그 관리 도구`
- `성능` 및 `운영 상태` `모니터링`

D. AWS 비용 카테고리(AWS Cost Categories)  

- `AWS Cost Categories`는 `비용`을 `카테고리별`로 볼 수 있게 해주는 기능
- 비용을 카테고리별로 보여주는 것이지, 시각적 분석 도구는 아님

</div>  
</details>

[맨위로](#examtopics-01---240-오답노트)

## Question AWS Skill Builder 문제 001

프리 티어를 초과한 경우 AWS는 AWS Lambda 사용량에 대한 요금을 어떻게 청구하는가? (2개 선택.)

A: Lambda 함수를 실행하는 데 걸리는 시간 기준  
B: 특정 Lambda 함수의 버전 수 기준  
C: 지정된 Lambda 함수에 대한 요청 수 기준  
D: Lambda 함수에 사용되는 프로그래밍 언어 기준  
E: AWS 계정의 총 Lambda 함수 수 기준

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, C

A: Lambda 함수를 실행하는 데 걸리는 시간 기준  

- 정답) Lambda 요금은 코드를 실행하는데 걸리는 시간에 따라 달라짐

B: 특정 Lambda 함수의 버전 수 기준  

- 오답) Lambda 버전 수는 비용에 영햐잉 없음
- Lambda `요청 수`와 `실행 시간`에 따라 요금 달라짐

C: 지정된 Lambda 함수에 대한 요청 수 기준  

- 정답) Lambda 함수 요청 수에 따라 요금 달라짐

D: Lambda 함수에 사용되는 프로그래밍 언어 기준  

- 오답) Lambda 함수 프로그래밍 언어는 비용과 무관함

E: AWS 계정의 총 Lambda 함수 수 기준

- 오답) AWS 계정의 함수 수는 요그엠 영향 주지 않음

</div>  
</details>

## Question AWS Skill Builder 문제 002

한 회사에 Oracle 데이터베이스가 실행되는 온프레미스 Linux 기반 서버가 있다.  
회사는 AWS의 Amazon EC2 인스턴스에서 실행되도록 데이터베이스 서버를 마이그레이션하고자 한다.  
회사에서 마이그레이션을 완료하려면 어떤 서비스를 사용해야 하는가?

A: AWS Database Migration Service(AWS DMS)  
B: AWS Migration Hub  
C: AWS Application Migration Service(AWS MGN)  
D: AWS Application Discovery Service

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A: AWS Database Migration Service(AWS DMS)  

- 오답) `AWS DMS`는 Database migration service로 DB to DB는 맞으나 서버 자체를 옮기는 효과는 없음

B: AWS Migration Hub  

- 오답) `AWS Migration Hub`는 애플리케이션 `마이그레이션`을 `계획`하고 `추적`하는데 도움주는 서비스
- `AWS Migration Hub`가 마이그레이션을 진행하지는 않음

C: AWS Application Migration Service(AWS MGN)  

- 자동화된 리프트 앤 시프트 솔루션
- `서버`에서 `실행되는 모든 APP` -> `AWS EC2`로 `마이그레이션 가능`

D: AWS Application Discovery Service

- 오답) `Application Discovery Service`는 `IDC 서버 정보 수집` -> `마이그레이션 계획`

</div>  
</details>

## Question AWS Skill Builder 문제 003

Amazon S3의 특징적인 기능은 다음 중 무엇인가? (2개 선택.)

A: 글로벌 파일 시스템  
B: 객체 스토어  
C: 로컬 파일 스토어  
D: 네트워크 파일 시스템  
E: 내구성이 뛰어난 스토리지 시스템

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B, E

A: 글로벌 파일 시스템  

- 오답) `S3`는 `글로벌 파일 시스템`이 아니다, `S3는 객체 스토리지 서비스`

B: 객체 스토어  

- 정답) `S3`는 객체를 저장하고, 이러한 객체를 버킷에 저장한다

C: 로컬 파일 스토어  

- 오답) 로컬 아님

D: 네트워크 파일 시스템  

- 오답) 네트워크 파일 시스템 아님, EBS 말하는듯

E: 내구성이 뛰어난 스토리지 시스템

- 정답) 99.999999999 내구성 뛰어남

</div>  
</details>

## Question AWS Skill Builder 문제 004

전 세계 여러 국가에서 고객을 보유한 기업이 AWS 클라우드를 사용하면 어떤 이점이 있는가? (2개 선택.)

A: 기업은 여러 AWS 리전에 애플리케이션을 배포하여 지연 시간을 줄일 수 있다.  
B: Amazon Translate는 서드 파티 웹 사이트 인터페이스를 여러 언어로 자동 번역한다.  
C: Amazon CloudFront는 지연 시간을 줄이기 위해 전 세계에 여러 엣지 로케이션을 보유하고 있다.  
D: Amazon Comprehend를 사용하면 여러 언어로 사용자 요청에 응답할 수 있는 애플리케이션을 구축할 수 있다.  
E: Elastic Load Balancing은 애플리케이션 웹 트래픽을 전 세계 여러 AWS 리전에 분산하여 지연 시간을 줄일 수 있다.

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, C
</div>  
</details>

## Question AWS Skill Builder 문제 005

전화 통화를 통해 기술 지원을 제공하는 최소의 AWS Support 플랜은 무엇인가?

A: Enterprise
B: Business
C: Developer
D: Basic

> ❌

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A: Enterprise

- 오답) Enterprise는 전화 지원을 제공하지만, 이를 위한 최소 플랜이 아님

B: Business

- 정답) Business는 기술 지원에 전화 + 채팅 가능
- Business가 전화를 제공하는 최소 플랜

C: Developer

- 오답) 지원 티켓 이메일 생성만 허용, 전화 허용 안함

D: Basic

- 오답) 기술 지원 안함

</div>  
</details>