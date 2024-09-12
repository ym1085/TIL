# AWS Practitional examtopics 문제 풀이

> AWS Practitional 자격증 취득을 위한 덤프 문제 풀이

## Question 101

Which AWS service can be used to decouple applications?  

A. AWS Config  
B. Amazon Simple Queue Service (Amazon SQS)  
C. AWS Batch  
D. Amazon Simple Email Service (Amazon SES)  

[번역]  
어떤 AWS 서비스를 사용하여 애플리케이션을 디커플링할 수 있습니까?  

A. AWS Config  
B. Amazon Simple Queue Service (Amazon SQS)  
C. AWS Batch  
D. Amazon Simple Email Service (Amazon SES)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

B. Amazon Simple Queue Service (Amazon SQS)
AWS의 모놀로그 아키텍처는 결합도가 높기에, AWS는 결합도가 낮은 수준의 애플리케이션을 운영하는 것을 추천한다.

AWS SQS는 메시지 Queue 서비스로, A - B 서버 사이에서 B 서버가 동작하지 않아도,  
Queue에 메시지를 담아두고 추후에 처리가 가능하기에 결합도가 낮은 서비스
</div>  
</details>

## Question 102

Which disaster recovery option is the LEAST expensive?  

A. Warm standby  
B. Multisite  
C. Backup and restore  
D. Pilot light  

[번역]  
가장 저렴한 재해 복구 옵션은 무엇입니까?  

A. 웜 스탠바이  
B. 멀티사이트  
C. 백업 및 복원  
D. 파일럿 라이트  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Warm standby  

- 상시 준비 상태의 시스템을 유지 -> 장애 발생 시 빠르게 서비스 재개
- 일정 수준의 자원 + 비용 필요

B. Multisite  

- 여러 물리적 위치에서 전체 시스템 운영 + 고가용성 유지
- 인프라 비용 높음

C. Backup and restore  

- 백업 및 복원은 최소한 비용으로 자산을 보호하는 기본 재해 복구 옵션
- 주기적으로 데이터 백업 및 복원하는 방식
- 가장 저렴한 옵션이다

D. Pilot light  

- 기본적인 시스템만 유지하고, 필요 시 전체 시스템 확장하는 옵션
- Warm stanby보다 싸지만, 백업 보다는 비쌈

</div>  
</details>

## Question 103

Which type of AWS storage is ephemeral and is deleted when an Amazon EC2 instance is stopped or terminated?  

A. Amazon Elastic Block Store (Amazon EBS)  
B. Amazon EC2 instance store  
C. Amazon Elastic File System (Amazon EFS)  
D. Amazon S3  

[번역]  
Amazon EC2 인스턴스가 중지되거나 종료될 때 삭제되는 임시 AWS 스토리지 유형은 무엇입니까?  

A. Amazon Elastic Block Store (Amazon EBS)  
B. Amazon EC2 인스턴스 스토어  
C. Amazon Elastic File System (Amazon EFS)  
D. Amazon S3  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Amazon Elastic Block Store (Amazon EBS)  

- EBS는 네트워크로 연결되어 있으며 EC2 삭제한다고 무조건 삭제되는건 아님

B. Amazon EC2 인스턴스 스토어  

- 내장 스토리지 사용, EC2 삭제 시 데이터 날라감

C. Amazon Elastic File System (Amazon EFS)  

- 다수의 EC2가 공유할 수 있는 공유 디스크
- 데이터 안 날라감

D. Amazon S3  

- 객체(Object) 형태로 데이터를 저장하는 데이터 저장 스토리지
- EC2랑 S3는 별도의 서비스로 봐야함

</div>  
</details>

## Question 104

Which of the following is a characteristic of the AWS account root user?  

A. The root user is the only user that can be configured with multi-factor authentication (MFA).  
B. The root user is the only user that can access the AWS Management Console.  
C. The root user is the first sign-in identity that is available when an AWS account is created.  
D. The root user has a password that cannot be changed.  

[번역]  
다음 중 AWS 계정 루트 사용자의 특성은 무엇입니까?  

A. 루트 사용자는 다단계 인증(MFA)을 구성할 수 있는 유일한 사용자입니다.  
B. 루트 사용자는 AWS Management Console에 액세스할 수 있는 유일한 사용자입니다.  
C. 루트 사용자는 AWS 계정이 생성될 때 사용할 수 있는 첫 번째 로그인 아이덴티티입니다.  
D. 루트 사용자는 암호를 변경할 수 없습니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 105

A company hosts an application on an Amazon EC2 instance. The EC2 instance needs to access several AWS resources, including Amazon S3 and Amazon DynamoDB.  
What is the MOST operationally efficient solution to delegate permissions?  

A. Create an IAM role with the required permissions. Attach the role to the EC2 instance.  
B. Create an IAM user and use its access key and secret access key in the application.  
C. Create an IAM user and use its access key and secret access key to create a CLI profile in the EC2 instance  
D. Create an IAM role with the required permissions. Attach the role to the administrative IAM user.  

[번역]  
회사는 Amazon EC2 인스턴스에서 애플리케이션을 호스팅합니다. EC2 인스턴스는 Amazon S3와 Amazon DynamoDB를 포함한 여러 AWS 리소스에 액세스해야 합니다.  
가장 효율적인 권한 위임 솔루션은 무엇입니까?  

A. 필요한 권한이 포함된 IAM 역할을 생성하고 EC2 인스턴스에 역할을 연결합니다.  
B. IAM 사용자를 생성하고 애플리케이션에서 액세스 키와 비밀 액세스 키를 사용합니다.  
C. IAM 사용자를 생성하고 액세스 키와 비밀 액세스 키를 사용하여 EC2 인스턴스에서 CLI 프로필을 만듭니다.  
D. 필요한 권한이 포함된 IAM 역할을 생성하고, 역할을 관리 IAM 사용자에 연결합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

AWS 자격증명(access_key, secret_access_key)는 사용을 지양해야한다.  
또한 사용자한테 역할 바로 부여하면 관리 힘들어짐, Assume 받는 Role Playing로 해소 해야함.
</div>  
</details>

## Question 106

Which of the following is a component of the AWS Global Infrastructure?  

A. Amazon Alexa  
B. AWS Regions  
C. Amazon Lightsail  
D. AWS Organizations  

[번역]  
다음 중 AWS 글로벌 인프라의 구성 요소는 무엇입니까?  

A. Amazon Alexa  
B. AWS 리전  
C. Amazon Lightsail  
D. AWS Organizations  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon Alexa  

- `음성인식 기반 가상 비서 서비스`
- 글로벌 인프라 구성 요소 아님

B. AWS 리전  

- AWS 글로벌 인프라 <==> 리전

C. Amazon Lightsail  

- VPS(가상 사설 서버)로 애플리케이션 구축을 위한 가상 인프라 제공
- 글로벌 인프라 구성 요소 아님

D. AWS Organizations  

- `AWS 계정`을 `조직적`으로 `관리`하는 서비스
- 글로벌 인프라 구성 요소 아님

</div>  
</details>

## Question 107

What is the purpose of having an internet gateway within a VPC?  

A. To create a VPN connection to the VPC  
B. To allow communication between the VPC and the internet  
C. To impose bandwidth constraints on internet traffic  
D. To load balance traffic from the internet across Amazon EC2 instances  

[번역]  
VPC 내에 인터넷 게이트웨이를 두는 목적은 무엇입니까?  

A. VPC에 VPN 연결을 만듭니다.  
B. VPC와 인터넷 간의 통신을 허용합니다.  
C. 인터넷 트래픽에 대역폭 제약을 부과합니다.  
D. 인터넷에서 들어오는 트래픽을 여러 Amazon EC2 인스턴스에 부하 분산합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 108

Which AWS service allows users to download security and compliance reports about the AWS infrastructure on demand?  

A. Amazon GuardDuty  
B. AWS Security Hub  
C. AWS Artifact  
D. AWS Shield  

[번역]  
AWS 인프라에 대한 보안 및 규정 준수 보고서를 사용자가 필요할 때 다운로드할 수 있게 해주는 AWS 서비스는 무엇입니까?  

A. Amazon GuardDuty  
B. AWS Security Hub  
C. AWS Artifact  
D. AWS Shield  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 109

A pharmaceutical company operates its infrastructure in a single AWS Region. The company has thousands of VPCs in various AWS accounts that it wants to interconnect.  
Which AWS service or feature should the company use to help simplify management and reduce operational costs?  

A. VPC endpoint  
B. AWS Direct Connect  
C. AWS Transit Gateway  
D. VPC peering  

[번역]  
제약회사는 단일 AWS 리전에서 인프라를 운영하고 있습니다. 회사는 여러 AWS 계정에 걸쳐 수천 개의 VPC를 연결하려고 합니다.  
관리 단순화 및 운영 비용 절감을 위해 회사가 사용할 수 있는 AWS 서비스 또는 기능은 무엇입니까?  

A. VPC 엔드포인트  
B. AWS Direct Connect  
C. AWS Transit Gateway  
D. VPC 피어링  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. VPC 엔드포인트  

- private subnet에서 외부 통신을 하기 위해 AWS 전용 네트워크를 통해 AWS 서비스와 통신

B. AWS Direct Connect  

- on-premise와 AWS 클라우드를 전용 회선을 통해 다이렉트로 연결

C. AWS Transit Gateway  

- A VPC <==> B VPC 간의 연결을 위해 사용
- 1:N VPC 연결 가능한 중앙 허브 역할
- 온프레미스 to AWS 연결 가능
- AWS VPC to AWS VPC 연결 가능
- 수천개의 VPC를 연결하기 위해서는 TG가 적당함

D. VPC 피어링  

- VPC 피어링은 VPC(1) : VPC(1) 연결 가능
- 다수의 VPC를 연결하기에는 제한적임

</div>  
</details>

## Question 110

A company is planning an infrastructure deployment to the AWS Cloud. Before the deployment, the company wants a cost estimate for running the infrastructure.  
Which AWS service or feature can provide this information?  

A. Cost Explorer  
B. AWS Trusted Advisor  
C. AWS Cost and Usage Report  
D. AWS Pricing Calculator  

[번역]  
회사는 AWS 클라우드에 인프라를 배포할 계획입니다. 배포 전에 인프라 실행에 대한 비용 견적을 얻고자 합니다.  
이 정보를 제공할 수 있는 AWS 서비스 또는 기능은 무엇입니까?  

A. 비용 탐색기  
B. AWS Trusted Advisor  
C. AWS 비용 및 사용 보고서  
D. AWS 가격 계산기  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. Cost Explorer  

- 과거의 비용 및 `사용 패턴`을 `분석`하는 도구

B. AWS Trusted Advisor  

- AWS 환경의 모범 사례 준수 및 비용 절갑 제안

C. AWS Cost and Usage Report  

- 과거의 비용 및 `데이터 사용량` `제공하는 보고서`

D. AWS Pricing Calculator  

> <https://calculator.aws/#/addService>

- AWS 서비스 비용을 사전에 추정하는 서비스
- AWS 서비스의 대략적인 사용 견적 비용 추정 가능

</div>  
</details>

## Question 111

Which AWS service or tool helps to centrally manage billing and allow controlled access to resources across AWS accounts?  

A. AWS Identity and Access Management (IAM)  
B. AWS Organizations  
C. Cost Explorer  
D. AWS Budgets  

[번역]  
AWS 계정 간에 청구 관리를 중앙에서 수행하고 자원에 대한 제어된 액세스를 허용하는 AWS 서비스 또는 도구는 무엇입니까?  

A. AWS Identity and Access Management (IAM)  
B. AWS Organizations  
C. 비용 탐색기  
D. AWS 예산  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 112

Which of the following are Amazon Virtual Private Cloud (Amazon VPC) resources?  

A. Objects; access control lists (ACLs)  
B. Subnets; internet gateways  
C. Access policies; buckets  
D. Groups; roles  

[번역]  
다음 중 Amazon Virtual Private Cloud (Amazon VPC) 리소스는 무엇입니까?  

A. 객체; 액세스 제어 목록(ACL)  
B. 서브넷; 인터넷 게이트웨이  
C. 액세스 정책; 버킷  
D. 그룹; 역할  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 113

A company needs to identify the last time that a specific user accessed the AWS Management Console.  
Which AWS service will provide this information?  

A. Amazon Cognito  
B. AWS CloudTrail  
C. Amazon Inspector  
D. Amazon GuardDuty  

[번역]  
회사는 특정 사용자가 마지막으로 AWS Management Console에 액세스한 시간을 확인해야 합니다.  
이 정보를 제공하는 AWS 서비스는 무엇입니까?  

A. Amazon Cognito  
B. AWS CloudTrail  
C. Amazon Inspector  
D. Amazon GuardDuty  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 114

A company launched an Amazon EC2 instance with the latest Amazon Linux 2 Amazon Machine Image (AMI).  
Which actions can a system administrator take to connect to the EC2 instance? (Choose two.)  

A. Use Amazon EC2 Instance Connect.  
B. Use a Remote Desktop Protocol (RDP) connection.  
C. Use AWS Batch.  
D. Use AWS Systems Manager Session Manager.  
E. Use Amazon Connect.  

[번역]  
회사가 최신 Amazon Linux 2 AMI를 사용하여 Amazon EC2 인스턴스를 시작했습니다.  
시스템 관리자가 EC2 인스턴스에 연결할 수 있는 방법은 무엇입니까? (두 개를 선택하세요.)  

A. Amazon EC2 Instance Connect 사용  
B. 원격 데스크톱 프로토콜(RDP) 연결 사용  
C. AWS Batch 사용  
D. AWS Systems Manager Session Manager 사용  
E. Amazon Connect 사용  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D
</div>  
</details>

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

## Question 117

A company is migrating to Amazon S3. The company needs to transfer 60 TB of data from an on-premises data center to AWS within 10 days.  
Which AWS service should the company use to accomplish this migration?  

A. Amazon S3 Glacier  
B. AWS Database Migration Service (AWS DMS)  
C. AWS Snowball  
D. AWS Direct Connect  

[번역]  
회사가 Amazon S3로 마이그레이션하고 있습니다. 회사는 온프레미스 데이터 센터에서 AWS로 10일 이내에 60TB의 데이터를 전송해야 합니다.  
이 마이그레이션을 완료하는 데 사용할 AWS 서비스는 무엇입니까?  

A. Amazon S3 Glacier  
B. AWS Database Migration Service (AWS DMS)  
C. AWS Snowball  
D. AWS Direct Connect  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Amazon S3 Glacier  

- 저장 비용이 저렴한 장기 아카이브를 위한 서비스

B. AWS Database Migration Service (AWS DMS)  

- `DB`를 `AWS`로 `마이그레이션` 하는 서비스

C. AWS Snowball  

- 대량의 데이터를 온프레미스에서 AWS로 전송하는 서비스
- 물리적인 장치를 통해 빠르게 데이터 이관 가능
- 60TB와 같은 대규모 데이터 전송에는 AWS Snowball이 적합

D. AWS Direct Connect  

- `온프레미스`와 `AWS`간의 `전용 네트워크 회선` 제공
- 대량 데이터 전송에 사용할 수 있지만, 물리적인 장비가 아닌 네트워크 연결을 제공하는 서비스

</div>  
</details>

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

## Question 119

A large organization has a single AWS account.  
What are the advantages of reconfiguring the single account into multiple AWS accounts? (Choose two.)  

A. It allows for administrative isolation between different workloads.  
B. Discounts can be applied on a quarterly basis by submitting cases in the AWS Management Console.  
C. Transitioning objects from Amazon S3 to Amazon S3 Glacier in separate AWS accounts will be less expensive.  
D. Having multiple accounts reduces the risks associated with malicious activity targeted at a single account.  
E. Amazon QuickSight offers access to a cost tool that provides application-specific recommendations for environments running in multiple accounts.  

[번역]  
대규모 조직이 하나의 AWS 계정을 사용하고 있습니다.  
하나의 계정을 여러 AWS 계정으로 재구성하는 것의 장점은 무엇입니까? (두 개를 선택하세요.)  

A. 서로 다른 워크로드 간의 관리적 격리를 허용합니다.  
B. AWS Management Console에서 케이스를 제출하여 분기별 할인을 받을 수 있습니다.  
C. 별도의 AWS 계정에서 Amazon S3에서 Amazon S3 Glacier로 객체를 전환하는 비용이 적게 듭니다.  
D. 여러 계정을 사용하면 단일 계정을 대상으로 한 악의적인 활동과 관련된 위험이 줄어듭니다.  
E. Amazon QuickSight는 여러 계정에서 실행되는 환경에 대한 애플리케이션별 권장 사항을 제공하는 비용 도구에 액세스할 수 있습니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D
</div>  
</details>

## Question 120

A retail company has recently migrated its website to AWS.  
The company wants to ensure that it is protected from SQL injection attacks.  
The website uses an Application Load Balancer to distribute traffic to multiple Amazon EC2 instances.  
Which AWS service or feature can be used to create a custom rule that blocks SQL injection attacks?  

A. Security groups  
B. AWS WAF  
C. Network ACLs  
D. AWS Shield  

[번역]  
한 소매 회사가 최근 자사의 웹사이트를 AWS로 마이그레이션했습니다.  
회사는 SQL 삽입 공격으로부터 보호하고자 합니다.  
웹사이트는 트래픽을 여러 Amazon EC2 인스턴스로 분산하는 Application Load Balancer를 사용합니다.  
SQL 삽입 공격을 차단하는 사용자 정의 규칙을 생성하는 데 사용할 수 있는 AWS 서비스 또는 기능은 무엇입니까?  

A. 보안 그룹  
B. AWS WAF  
C. 네트워크 ACL  
D. AWS Shield  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. 보안 그룹  

- 인스턴스 레벨의 방화벽
- 보안그룹은 Allow만 가능, Deny는 불가능
- 인바운드, 아웃바운드를 통해 트래픽 제어

B. AWS WAF  

- SQL Injection, XSS와 같은 공격을 막기위한 방화벽

C. 네트워크 ACL  

- 서브넷 수준에서의 방화벽
- 낮은 순서부터 규칙 평가하며, 규칙에 맞지 않으면 Deny
- Allow, Deny 둘다 설정 가능

D. AWS Shield  

- DDos 공격을 막기 위한 방화벽 서비스

</div>  
</details>

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

## Question 122

Which of the following is an advantage that users experience when they move on-premises workloads to the AWS Cloud?  

A. Elimination of expenses for running and maintaining data centers  
B. Price discounts that are identical to discounts from hardware providers  
C. Distribution of all operational controls to AWS  
D. Elimination of operational expenses  

[번역]  
다음 중 온프레미스 워크로드를 AWS 클라우드로 이전할 때 사용자가 경험하는 이점은 무엇입니까?  

A. 데이터 센터 운영 및 유지 관리 비용 제거  
B. 하드웨어 제공업체와 동일한 가격 할인  
C. 모든 운영 제어를 AWS에 분산  
D. 운영 비용 제거  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

## Question 123

Which design principle is included in the operational excellence pillar of the AWS Well-Architected Framework?  

A. Create annotated documentation.  
B. Anticipate failure.  
C. Ensure performance efficiency.  
D. Optimize costs.  

[번역]  
AWS Well-Architected Framework의 운영 우수성 기둥에 포함된 설계 원칙은 무엇입니까?  

A. 주석이 달린 문서를 작성합니다.  
B. 실패를 예측합니다.  
C. 성능 효율성을 보장합니다.  
D. 비용을 최적화합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 124

Which AWS services offer gateway VPC endpoints that can be used to avoid sending traffic over the internet? (Choose two.)  

A. Amazon Simple Notification Service (Amazon SNS)  
B. Amazon Simple Queue Service (Amazon SQS)  
C. AWS CodeBuild  
D. Amazon S3  
E. Amazon DynamoDB  

[번역]  
인터넷을 통해 트래픽을 보내지 않도록 하는 게이트웨이 VPC 엔드포인트를 제공하는 AWS 서비스는 무엇입니까? (두 개를 선택하세요.)  

A. Amazon Simple Notification Service (Amazon SNS)  
B. Amazon Simple Queue Service (Amazon SQS)  
C. AWS CodeBuild  
D. Amazon S3  
E. Amazon DynamoDB  

>

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D, E

`S3`, `DynamoDB`가 `VPC Endpoint Gateway`를 지원한다. VPC 엔드포인트 사용 시 인터넷을 통해 트래픽을 보내지 않고도,  
VPC 내에서 S3와 DynamoDB와 같은 리소스에 접근이 가능해진다.

`SQS`, `SNS`는 VPC 엔드포인트가 존재하나 Gateway가 아닌 `Interface` 제공.  
Interface의 경우 보안그룹 지정도 해야 하고 할게 많음.

CodeBuild는 엔드포인트가 아니라 인터넷 연결을 통해 연결해야함.
</div>  
</details>

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

## Question 126

Who has the responsibility to patch the host operating system of an Amazon EC2 instance, according to the AWS shared responsibility model?  

A. Both AWS and the customer  
B. The customer only  
C. The EC2 hardware manufacturer  
D. AWS only  

[번역]  
AWS 공동 책임 모델에 따르면, Amazon EC2 인스턴스의 호스트 운영 체제를 패치할 책임은 누구에게 있습니까?  

A. AWS와 고객 모두  
B. 고객만  
C. EC2 하드웨어 제조업체  
D. AWS만  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

AWS가 `호스트 운영체제`의 `패치`를 `관리`하지만, EC2 인스턴스 내의 패치는 고객의 몫이다.
</div>  
</details>

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

## Question 128

Why is an AWS Well-Architected review a critical part of the cloud design process?  

A. A Well-Architected review is mandatory before a workload can run on AWS.  
B. A Well-Architected review helps identify design gaps and helps evaluate design decisions and related documents.  
C. A Well-Architected review is an audit mechanism that is a part of requirements for service level agreements.  
D. A Well-Architected review eliminates the need for ongoing auditing and compliance tests.  

[번역]  
AWS Well-Architected 리뷰가 클라우드 설계 과정에서 중요한 부분인 이유는 무엇입니까?  

A. Well-Architected 리뷰는 워크로드가 AWS에서 실행되기 전에 필수입니다.  
B. Well-Architected 리뷰는 설계 격차를 식별하고 설계 결정 및 관련 문서를 평가하는 데 도움이 됩니다.  
C. Well-Architected 리뷰는 서비스 수준 계약의 요구 사항에 대한 감사 메커니즘입니다.  
D. Well-Architected 리뷰는 지속적인 감사 및 준수 테스트의 필요성을 없앱니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 129

A company implements an Amazon EC2 Auto Scaling policy along with an Application Load Balancer to automatically,  
recover unhealthy applications that run on Amazon EC2 instances.  
Which pillar of the AWS Well-Architected Framework does this action cover?  

A. Security  
B. Performance efficiency  
C. Operational excellence  
D. Reliability  

[번역]  
회사가 Amazon EC2 인스턴스에서 실행되는 비정상 애플리케이션을 자동으로 복구하기 위해  
Application Load Balancer와 함께 Amazon EC2 Auto Scaling 정책을 구현했습니다.  
이 작업은 AWS Well-Architected Framework의 어떤 기둥에 해당합니까?  

A. 보안  
B. 성능 효율성  
C. 운영 우수성  
D. 신뢰성  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 130

Which AWS Cloud benefit is shown by an architecture's ability to withstand failures with minimal downtime?  

A. Agility  
B. Elasticity  
C. Scalability  
D. High availability  

[번역]  
아키텍처가 최소한의 다운타임으로 장애를 견딜 수 있는 능력을 보여주는 AWS 클라우드 이점은 무엇입니까?  

A. 민첩성  
B. 탄력성  
C. 확장성  
D. 고가용성  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 131

Under the AWS shared responsibility model, which task is the customer's responsibility when managing AWS Lambda functions?  

A. Creating versions of Lambda functions  
B. Maintaining server and operating systems  
C. Scaling Lambda resources according to demand  
D. Updating the Lambda runtime environment  

[번역]  
AWS 공동 책임 모델에서, AWS Lambda 함수를 관리할 때 고객의 책임은 무엇입니까?  

A. Lambda 함수의 버전 생성  
B. 서버 및 운영 체제 유지 관리  
C. 수요에 따라 Lambda 리소스 확장  
D. Lambda 런타임 환경 업데이트  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. Lambda 함수의 버전 생성  

Lambda 함수 버전 생성은 고객의 책임

B. 서버 및 운영 체제 유지 관리  

Lambda는 서버리스로, 서버가 운영체제 유지 및 관리해야함

C. 수요에 따라 Lambda 리소스 확장  

Lambda는 수요에 따라 자동으로 리소스 확장, 고객 관리가 아님

D. Lambda 런타임 환경 업데이트  

AWS가 Lambda 런타임 환경 관리

</div>  
</details>

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

## Question 134

A company has a serverless application that includes an Amazon API Gateway API, an AWS Lambda function, and an Amazon DynamoDB database.  
Which AWS service can the company use to trace user requests as they move through the application's components?  

A. AWS CloudTrail  
B. Amazon CloudWatch  
C. Amazon Inspector  
D. AWS X-Ray  

[번역]  
회사는 Amazon API Gateway API, AWS Lambda 함수, 그리고 Amazon DynamoDB 데이터베이스를 포함한 서버리스 애플리케이션을 사용하고 있습니다.  
사용자의 요청이 애플리케이션의 구성 요소를 통과할 때 이를 추적하는 데 사용할 수 있는 AWS 서비스는 무엇입니까?  

A. AWS CloudTrail  
B. Amazon CloudWatch  
C. Amazon Inspector  
D. AWS X-Ray  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
A. AWS CloudTrail  

AWS 계정의 API 요청에 대한 추적

B. Amazon CloudWatch

메트릭 시각화

C. Amazon Inspector  

보안 취약점 평가 도구

D. AWS X-Ray  

API Gateway, Lambda, DynamoDB와 같은 서버리스 서비스에서 요청이 어떻게 처리되는지 시각화.
</div>  
</details>

## Question 135

A company needs to set up a petabyte-scale data warehouse in the AWS Cloud.  
Which AWS service will meet this requirement?  

A. Amazon DynamoDB  
B. Amazon RDS  
C. Amazon Redshift  
D. Amazon ElastiCache  

[번역]  
회사는 AWS 클라우드에서 페타바이트 규모의 데이터 웨어하우스를 설정해야 합니다.  
이 요구 사항을 충족하는 AWS 서비스는 무엇입니까?  

A. Amazon DynamoDB  
B. Amazon RDS  
C. Amazon Redshift  
D. Amazon ElastiCache  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Amazon DynamoDB  

고성능 `NoSQL` 서버로, `대규모 데이터 처리는 가능`하지만 `데이터 웨어하우스 기능`은 `제공 안함`.

B. Amazon RDS  

`RDS`는 관계형 DB로 `대규모 데이터`보다는 `중소 규모의 DB에 적합`

C. Amazon Redshift  

AWS `Redshift`는 `페타바이트 규모의 데이터` `웨어하우스`를 지원.  
`고성능 쿼리` 및 `데이터 분석` 제공하며 `대규모 데이터 처리 가능`.

D. Amazon ElastiCache  

캐시 서비스로, 데이터웨어 하우스 용도와 맞지 않음.  
DB 성능 향상시키기 위해 사용.

</div>  
</details>

## Question 136

Which AWS service is always provided at no charge?  

A. Amazon S3  
B. AWS Identity and Access Management (IAM)  
C. Elastic Load Balancers  
D. AWS WAF  

[번역]  
항상 무료로 제공되는 AWS 서비스는 무엇입니까?  

A. Amazon S3  
B. AWS Identity and Access Management (IAM)  
C. Elastic Load Balancers  
D. AWS WAF  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

S3, WAF, ELB 모두 비용이 발생하는것으로 알고 있음,  
이에반해 IAM은 비용이 없으나 IAM을 사용하는 순간 비용이 나가는걸로 알고 있음.
</div>  
</details>

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

## Question 138

Which of the following is a benefit of moving from an on-premises data center to the AWS Cloud?  

A. Compute instances can be launched and terminated as needed to optimize costs.  
B. Compute costs can be viewed in the AWS Billing and Cost Management console.  
C. Users retain full administrative access to their compute instances.  
D. Users can optimize costs by permanently running enough instances at peak load.  

[번역]  
다음 중 온프레미스 데이터 센터에서 AWS 클라우드로 이동하는 것의 이점은 무엇입니까?  

A. 비용 최적화를 위해 필요에 따라 컴퓨팅 인스턴스를 시작하고 종료할 수 있습니다.  
B. 컴퓨팅 비용은 AWS 청구 및 비용 관리 콘솔에서 확인할 수 있습니다.  
C. 사용자는 컴퓨팅 인스턴스에 대한 전체 관리자 액세스를 유지합니다.  
D. 사용자는 최대 부하 시 영구적으로 충분한 인스턴스를 실행하여 비용을 최적화할 수 있습니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

## Question 139

In which ways does the AWS Cloud offer lower total cost of ownership (TCO) of computing resources than on-premises data centers? (Choose two.)  

A. AWS replaces upfront capital expenditures with pay-as-you-go costs.  
B. AWS is designed for high availability, which eliminates user downtime.  
C. AWS eliminates the need for on-premises IT staff.  
D. AWS uses economies of scale to continually reduce prices.  
E. AWS offers a single pricing model for Amazon EC2 instances.  

[번역]  
AWS 클라우드는 어떤 방식으로 온프레미스 데이터 센터보다 컴퓨팅 리소스의 총 소유 비용(TCO)을 낮춥니까? (두 개를 선택하세요.)  

A. AWS는 선불 자본 지출을 사용한 만큼 지불하는 비용으로 대체합니다.  
B. AWS는 높은 가용성으로 설계되어 사용자 다운타임을 제거합니다.  
C. AWS는 온프레미스 IT 직원의 필요성을 없앱니다.  
D. AWS는 규모의 경제를 활용하여 지속적으로 가격을 낮춥니다.  
E. AWS는 Amazon EC2 인스턴스에 대한 단일 가격 모델을 제공합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, D
</div>  
</details>

## Question 140

Which AWS service monitors AWS accounts for security threats?  

A. Amazon GuardDuty  
B. AWS Secrets Manager  
C. Amazon Cognito  
D. AWS Certificate Manager (ACM)  

[번역]  
어떤 AWS 서비스가 AWS 계정을 모니터링하여 보안 위협을 감지합니까?  

A. Amazon GuardDuty  
B. AWS Secrets Manager  
C. Amazon Cognito  
D. AWS Certificate Manager (ACM)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. Amazon GuardDuty  

Application의 이상 행동 탐지

B. AWS Secrets Manager  

`비밀번호`, `API 키`, `기타 중요 정보` `저장` 및 `관리`하는 서비스

C. Amazon Cognito  

`애플리케이션`에 대한 `사용자 인증`과 `사용자 데이터 동기화`를 위한 서비스

D. AWS Certificate Manager (ACM)  

SSL/TLS와 같은 인증서를 생성 및 관리하는 서비스

</div>  
</details>

## Question 141

Which benefit is included with an AWS Enterprise Support plan?  

A. AWS Partner Network (APN) support at no cost  
B. Designated support from an AWS technical account manager (TAM)  
C. On-site support from AWS engineers  
D. AWS managed compliance as code with AWS Config  

[번역]  
AWS 엔터프라이즈 지원 플랜에 포함된 혜택은 무엇입니까?  

A. AWS 파트너 네트워크(APN) 지원을 무료로 제공  
B. AWS 기술 계정 관리자(TAM)의 지정된 지원  
C. AWS 엔지니어의 현장 지원  
D. AWS Config를 통한 코드로 관리되는 규정 준수  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. AWS 파트너 네트워크(APN) 지원을 무료로 제공  

해당 안함

B. AWS 기술 계정 관리자(TAM)의 지정된 지원  

`AWS Enterprise Support Plan`에서는 `TAM`(technical account manager) 지원,  
`기술적 문제에 대한 해결책 제공` + `아키텍처 검토`

C. AWS 엔지니어의 현장 지원  

AWS Enterprise Support는 원격 지원 제공, 현장 지원은 별도 서비스

D. AWS Config를 통한 코드로 관리되는 규정 준수  

규정 준수 및 자원 관리를 위한 서비스

</div>  
</details>

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

## Question 143

Which AWS service or tool can a company use to visualize, understand, and manage AWS spending and usage over time?  

A. AWS Trusted Advisor  
B. Amazon CloudWatch  
C. Cost Explorer  
D. AWS Budgets  

[번역]  
회사가 AWS 비용 및 사용량을 시각화하고 이해하며 관리하는 데 사용할 수 있는 AWS 서비스 또는 도구는 무엇입니까?  

A. AWS Trusted Advisor  
B. Amazon CloudWatch  
C. 비용 탐색기(Cost Explorer)  
D. AWS 예산  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 144

A company wants to deploy some of its resources in the AWS Cloud. To meet regulatory requirements, the data must remain local and on premises. There must be low latency between AWS and the company resources.  
Which AWS service or feature can be used to meet these requirements?  

A. AWS Local Zones  
B. Availability Zones  
C. AWS Outposts  
D. AWS Wavelength Zones  

[번역]  
한 회사가 일부 리소스를 AWS 클라우드에 배포하려고 합니다. 규제 요구 사항을 충족하려면 데이터는 로컬 및 온프레미스에 유지되어야 합니다. AWS와 회사 리소스 간의 지연 시간이 짧아야 합니다.  
이 요구 사항을 충족할 수 있는 AWS 서비스 또는 기능은 무엇입니까?  

A. AWS 로컬 영역(Local Zones)  
B. 가용 영역(Availability Zones)  
C. AWS 아웃포스트(Outposts)  
D. AWS 웨이브렝스 존(Wavelength Zones)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

AWS Local zone은 온프레미스에 구성하는 것이 아니라,  
특정 영역에 위치하게 되기에 정답이랑 멀음.
</div>  
</details>

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

## Question 146

Which AWS service is a highly available and scalable DNS web service?  

A. Amazon VPC  
B. Amazon CloudFront  
C. Amazon Route 53  
D. Amazon Connect  

[번역]  
고가용성과 확장성이 있는 DNS 웹 서비스는 무엇입니까?  

A. Amazon VPC  
B. Amazon CloudFront  
C. Amazon Route 53  
D. Amazon Connect  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 147

Which of the following is an AWS best practice for managing an AWS account root user?  

A. Keep the root user password with the security team  
B. Enable multi-factor authentication (MFA) for the root user  
C. Create an access key for the root user  
D. Keep the root user password consistent for compliance purposes  

[번역]  
다음 중 AWS 계정 루트 사용자를 관리하기 위한 AWS 모범 사례는 무엇입니까?  

A. 루트 사용자 암호를 보안 팀과 공유  
B. 루트 사용자에 대해 다단계 인증(MFA) 활성화  
C. 루트 사용자를 위한 액세스 키 생성  
D. 규정 준수를 위해 루트 사용자 암호를 일관되게 유지  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 148

A company wants to improve its security and audit posture by limiting Amazon EC2 inbound access.  
What should the company use to access instances remotely instead of opening inbound SSH ports and managing SSH keys?  

A. EC2 key pairs  
B. AWS Systems Manager Session Manager  
C. AWS Identity and Access Management (IAM)  
D. Network ACLs  

[번역]  
회사는 Amazon EC2 인바운드 액세스를 제한하여 보안 및 감사 자세를 개선하려고 합니다.  
SSH 포트를 열고 SSH 키를 관리하는 대신 인스턴스에 원격으로 액세스하기 위해 회사가 사용해야 할 것은 무엇입니까?  

A. EC2 키 페어  
B. AWS Systems Manager Session Manager  
C. AWS Identity and Access Management (IAM)  
D. 네트워크 ACL  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B 
</div>  
</details>

## Question 149

After selecting an Amazon EC2 Dedicated Host reservation, which pricing option would provide the largest discount?  

A. No upfront payment  
B. Hourly on-demand payment  
C. Partial upfront payment  
D. All upfront payment  

[번역]  
Amazon EC2 전용 호스트 예약을 선택한 후 가장 큰 할인을 제공하는 가격 옵션은 무엇입니까?  

A. 선불 없는 결제  
B. 시간당 주문형 결제  
C. 부분 선불 결제  
D. 전액 선불 결제  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. 선불 없는 결제  

선불 없는 결제는 할인 혜택 없음

B. 시간당 주문형 결제  

할인 혜택 없음, 더 높은 비용 발생

C. 부분 선불 결제  

일부 할인 제공

D. 전액 선불 결제  

가장 큰 할인 제공

</div>  
</details>

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

## 99. 참고 자료

- [[AWS] examtopics](https://www.examtopics.com/exams/amazon/aws-certified-cloud-practitioner/view/2/)
