# AWS Practitional examtopics 문제 풀이

> AWS Practitional 자격증 취득을 위한 덤프 문제 풀이

## Question 151

A company would like to host its MySQL databases on AWS and maintain full control over the operating system, database installation, and configuration.  
Which AWS service should the company use to host the databases?  

A. Amazon RDS  
B. Amazon EC2  
C. Amazon DynamoDB  
D. Amazon Aurora  

[번역]  
회사는 MySQL 데이터베이스를 AWS에 호스팅하고 운영 체제, 데이터베이스 설치 및 구성을 완전히 제어하고자 합니다.  
회사가 데이터베이스를 호스팅하기 위해 사용해야 하는 AWS 서비스는 무엇입니까?  

A. Amazon RDS  
B. Amazon EC2  
C. Amazon DynamoDB  
D. Amazon Aurora  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

문제에서 말하듯이 운영체제, DB 설치 및 구성을 완전히 제어하려면 EC2를 사용해야 한다.  
나머지 DB를 사용하게 되면 AWS에서 관리의 주체가 된다.
</div>  
</details>

## Question 152

How does the AWS global infrastructure offer high availability and fault tolerance to its users?  

A. The AWS infrastructure is made up of multiple AWS Regions within various Availability Zones located in areas that have low flood risk, and are interconnected with low-latency networks and redundant power supplies.  
B. The AWS infrastructure consists of subnets containing various Availability Zones with multiple data centers located in the same geographic location.  
C. AWS allows users to choose AWS Regions and data centers so that users can select the closest data centers in different Regions.  
D. The AWS infrastructure consists of isolated AWS Regions with independent Availability Zones that are connected with low-latency networking and redundant power supplies.  

[번역]  
AWS 글로벌 인프라는 사용자에게 고가용성과 장애 허용 기능을 어떻게 제공합니까?  

A. AWS 인프라는 여러 가용 영역 내에서 여러 AWS 리전으로 구성되며, 저지대 침수 위험이 낮은 지역에 위치하고 저지연 네트워크 및 이중 전원 공급 장치로 상호 연결되어 있습니다.  
B. AWS 인프라는 동일한 지리적 위치에 있는 여러 데이터 센터로 구성된 다양한 가용 영역을 포함하는 서브넷으로 구성됩니다.  
C. AWS는 사용자가 AWS 리전과 데이터 센터를 선택할 수 있도록 하여 서로 다른 리전에서 가장 가까운 데이터 센터를 선택할 수 있게 합니다.  
D. AWS 인프라는 독립된 가용 영역을 갖춘 독립적인 AWS 리전으로 구성되며, 저지연 네트워크 및 이중 전원 공급 장치로 연결됩니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 153

A company is using Amazon EC2 Auto Scaling to scale its Amazon EC2 instances.  
Which benefit of the AWS Cloud does this example illustrate?  

A. High availability  
B. Elasticity  
C. Reliability  
D. Global reach  

[번역]  
회사는 Amazon EC2 인스턴스를 확장하기 위해 Amazon EC2 Auto Scaling을 사용하고 있습니다.  
이 예가 보여주는 AWS 클라우드의 이점은 무엇입니까?  

A. 고가용성  
B. 탄력성  
C. 신뢰성  
D. 글로벌 도달 범위  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 154

Which AWS service or feature is used to send both text and email messages from distributed applications?  

A. Amazon Simple Notification Service (Amazon SNS)  
B. Amazon Simple Email Service (Amazon SES)  
C. Amazon CloudWatch alerts  
D. Amazon Simple Queue Service (Amazon SQS)  

[번역]  
분산 애플리케이션에서 텍스트 및 이메일 메시지를 보내는 데 사용되는 AWS 서비스 또는 기능은 무엇입니까?  

A. Amazon Simple Notification Service (Amazon SNS)  
B. Amazon Simple Email Service (Amazon SES)  
C. Amazon CloudWatch 경고  
D. Amazon Simple Queue Service (Amazon SQS)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. Amazon Simple Notification Service (Amazon SNS)  

`AWS SNS`는 `분산 애플리케이션 환경`에서 `텍스트`와 `이메일`을 포함한 `여러 유형의 알림을 전송하는데 사용`,  
AWS SNS는 이벤트 기반 알림을 다양한 프로토콜로 전송할 수 있게 함.

B. Amazon Simple Email Service (Amazon SES)  

이메일 전송을 위한 서비스, 문자 메시지 전송은 불가능

C. Amazon CloudWatch 경고  

모니터링 기반 경고 알람 전송, 텍스트나 이메일 전송은 없음

D. Amazon Simple Queue Service (Amazon SQS)  

AWS SQS는 메시지 Queue 제공 서비스로, `비동기식`으로 `처리하는 메시징 서비스`이다.  
텍스트, 이메일을 직접 보내는 기능은 없음.

</div>  
</details>

## Question 155

A user is able to set up a master payer account to view consolidated billing reports through:  

A. AWS Budgets  
B. Amazon Macie  
C. Amazon QuickSight  
D. AWS Organizations  

[번역]  
사용자는 통합 청구 보고서를 보기 위해 마스터 지불 계정을 설정할 수 있습니다.  
이를 설정할 수 있는 도구는 무엇입니까?  

A. AWS 예산  
B. Amazon Macie  
C. Amazon QuickSight  
D. AWS Organizations  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 156

According to the AWS shared responsibility model, which task is the customer's responsibility?  

A. Maintaining the infrastructure needed to run AWS Lambda  
B. Updating the operating system of Amazon DynamoDB instances  
C. Maintaining Amazon S3 infrastructure  
D. Updating the guest operating system on Amazon EC2 instances  

[번역]  
AWS 공동 책임 모델에 따르면, 다음 중 고객의 책임은 무엇입니까?  

A. AWS Lambda를 실행하는 데 필요한 인프라 유지 관리  
B. Amazon DynamoDB 인스턴스의 운영 체제 업데이트  
C. Amazon S3 인프라 유지 관리  
D. Amazon EC2 인스턴스의 게스트 운영 체제 업데이트  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

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

## Question 159

Which design principle is achieved by following the reliability pillar of the AWS Well-Architected Framework?  

A. Vertical scaling  
B. Manual failure recovery  
C. Testing recovery procedures  
D. Changing infrastructure manually  

[번역]  
AWS Well-Architected Framework의 신뢰성 기둥을 따름으로써 달성되는 설계 원칙은 무엇입니까?  

A. 수직 확장  
B. 수동 장애 복구  
C. 복구 절차 테스트  
D. 인프라 수동 변경  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 160

A user needs to quickly deploy a non-relational database on AWS. The user does not want to manage the underlying hardware or the database software.  
Which AWS service can be used to accomplish this?  

A. Amazon RDS  
B. Amazon DynamoDB  
C. Amazon Aurora  
D. Amazon Redshift  

[번역]  
사용자는 AWS에서 비관계형 데이터베이스를 신속하게 배포해야 합니다.  
사용자는 기본 하드웨어 또는 데이터베이스 소프트웨어를 관리하고 싶지 않습니다.  
이 작업을 수행하는 데 사용할 수 있는 AWS 서비스는 무엇입니까?  

A. Amazon RDS  
B. Amazon DynamoDB  
C. Amazon Aurora  
D. Amazon Redshift  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 161

Which task is an AWS responsibility when a workload is running in Amazon RDS?  

A. Creating the database table  
B. Updating the database schema  
C. Installing the database engine  
D. Dropping the database records  

[번역]  
Amazon RDS에서 워크로드가 실행 중일 때 AWS의 책임은 무엇입니까?  

A. 데이터베이스 테이블 생성  
B. 데이터베이스 스키마 업데이트  
C. 데이터베이스 엔진 설치  
D. 데이터베이스 레코드 삭제  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 162

A development team wants to publish and manage web services that provide REST APIs.  
Which AWS service will meet this requirement?  

A. AWS App Mesh  
B. Amazon API Gateway  
C. Amazon CloudFront  
D. AWS Cloud Map  

[번역]  
개발 팀은 REST API를 제공하는 웹 서비스를 게시하고 관리하려고 합니다.  
이 요구 사항을 충족하는 AWS 서비스는 무엇입니까?  

A. AWS App Mesh  
B. Amazon API Gateway  
C. Amazon CloudFront  
D. AWS Cloud Map  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

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

## Question 166

An online retail company wants to migrate its on-premises workload to AWS.  
The company needs to automatically handle a seasonal workload increase in a cost-effective manner.  
Which AWS Cloud features will help the company meet this requirement? (Choose two.)  

A. Cross-Region workload deployment  
B. Pay-as-you-go pricing  
C. Built-in AWS CloudTrail audit capabilities  
D. Auto Scaling policies  
E. Centralized logging  

[번역]  
한 온라인 소매 회사는 온프레미스 워크로드를 AWS로 마이그레이션하려고 합니다.  
회사는 계절적 워크로드 증가를 자동으로 처리하면서 비용 효율적으로 운영하려고 합니다.  
이 요구 사항을 충족하는 AWS 클라우드 기능은 무엇입니까? (두 개를 선택하세요.)  

A. 크로스 리전 워크로드 배포  
B. 사용한 만큼 지불하는 가격 책정  
C. AWS CloudTrail 내장 감사 기능  
D. Auto Scaling 정책  
E. 중앙 집중식 로깅  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B, D
</div>  
</details>

## Question 167

Which AWS service helps developers use loose coupling and reliable messaging between microservices?  

A. Elastic Load Balancing  
B. Amazon Simple Notification Service (Amazon SNS)  
C. Amazon CloudFront  
D. Amazon Simple Queue Service (Amazon SQS)  

[번역]  
어떤 AWS 서비스가 개발자가 마이크로서비스 간에 느슨한 결합과 신뢰할 수 있는 메시징을 사용할 수 있도록 돕습니까?  

A. Elastic Load Balancing  
B. Amazon Simple Notification Service (Amazon SNS)  
C. Amazon CloudFront  
D. Amazon Simple Queue Service (Amazon SQS)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D 
</div>  
</details>

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

## Question 170

A company needs an Amazon EC2 instance for a rightsized database server that must run constantly for 1 year.  
Which EC2 instance purchasing option will meet these requirements MOST cost-effectively?  

A. Standard Reserved Instance  
B. Convertible Reserved Instance  
C. On-Demand Instance  
D. Spot Instance  

[번역]  
회사는 1년 동안 지속적으로 실행되어야 하는 적정 크기의 데이터베이스 서버를 위한 Amazon EC2 인스턴스가 필요합니다.  
이 요구 사항을 가장 비용 효율적으로 충족하는 EC2 인스턴스 구매 옵션은 무엇입니까?  

A. 표준 예약 인스턴스(Standard Reserved Instance)  
B. 전환형 예약 인스턴스(Convertible Reserved Instance)  
C. 주문형 인스턴스(On-Demand Instance)  
D. 스팟 인스턴스(Spot Instance)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. 표준 예약 인스턴스(Standard Reserved Instance)  

`표준 예약 인스턴스`는 기본적으로 1년 - 3년의 기간동안 EC2 인스턴스를 예약하는 서비스.  
온디멘드 인스턴스보다 가격이 훨씬 저렴함.

B. 전환형 예약 인스턴스(Convertible Reserved Instance)  

`전환형 예약 인스턴스`는 `인스턴스 유연성`을 `변경`할 수 있는 `유연성`을 `제공`하지만,  
`할인율`은 `표준 예약 인스턴스`에 비해서 낮은 편이다. 인스턴스 유형 타입 변경할 필요 없으면,  
표준 예약 인스턴스가 비용이 더욱 저렴함.

C. 주문형 인스턴스(On-Demand Instance)  

온디멘드는 Spot, Reserved 인스턴스보다 비용이 비쌈.

D. 스팟 인스턴스(Spot Instance)  

Spot 인스턴스는 지속적인 워크로드에서 사용하기에는 떨어질 위험이 있음.

</div>  
</details>

## Question 171

A company has multiple applications and is now building a new multi-tier application. The company will host the new application on Amazon EC2 instances. The company wants the network routing and traffic between the various applications to follow the security principle of least privilege.  
Which AWS service or feature should the company use to enforce this principle?  

A. Security groups  
B. AWS Shield  
C. AWS Global Accelerator  
D. AWS Direct Connect gateway  

[번역]  
회사는 여러 애플리케이션을 가지고 있으며, 현재 새로운 다중 계층 애플리케이션을 구축하고 있습니다. 회사는 Amazon EC2 인스턴스에서 새로운 애플리케이션을 호스팅할 예정입니다. 회사는 각 애플리케이션 간의 네트워크 라우팅 및 트래픽이 최소 권한 원칙을 따르도록 하기를 원합니다.  
이 원칙을 적용하기 위해 사용할 AWS 서비스 또는 기능은 무엇입니까?  

A. 보안 그룹(Security Groups)  
B. AWS Shield  
C. AWS Global Accelerator  
D. AWS Direct Connect 게이트웨이  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A

A. 보안 그룹(Security Groups)  

보안 그룹은 인스턴스 수준에서의 네트워크 접근 제어 관리, `보안 원칙`인 `최소 권한을 적용`하여  
애플리케이션 간의 네트워크 통신 제어 가능.

B. AWS Shield  

`AWS Shield`는 Ddos 공격으로부터 애플리케이션을 보호하기 위한 기능이다.  
네트워크 트래픽의 보안 원칙인 최소 보안 원칙과는 관련이 없음


C. AWS Global Accelerator  

`AWS Global Accelerator`는 애플리케이션의 글로벌 접근성을 개선하고 네트워크 성능 최적화 지원,  
네트워크 트래픽의 접근 제어나 최소 권한 원칙을 적용하는 기능은 없음.

D. AWS Direct Connect 게이트웨이  

`AWS Direct Connect`는 전용 광범위 전선을 사용하여 온프레미스와 AWS를 인터넷 연결없이  
연결하는 기능을 의미함. 자체 네트워크망을 사용하여 AWS와 연결하고자 할 때 사용

</div>  
</details>

## Question 172

A company's web application requires AWS credentials and authorizations to use an AWS service.  
Which IAM entity should the company use as best practice?  

A. IAM role  
B. IAM user  
C. IAM group  
D. IAM multi-factor authentication (MFA)  

[번역]  
회사의 웹 애플리케이션은 AWS 서비스 사용을 위해 AWS 자격 증명과 권한이 필요합니다.  
회사가 모범 사례로 사용할 IAM 엔터티는 무엇입니까?  

A. IAM 역할  
B. IAM 사용자  
C. IAM 그룹  
D. IAM 다단계 인증(MFA)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

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

## Question 174

Which AWS service or feature gives a company the ability to control incoming traffic and outgoing traffic for Amazon EC2 instances?  

A. Security groups  
B. Amazon Route 53  
C. AWS Direct Connect  
D. Amazon VPC  

[번역]  
어떤 AWS 서비스 또는 기능이 회사에 Amazon EC2 인스턴스의 인바운드 트래픽과 아웃바운드 트래픽을 제어할 수 있는 능력을 제공합니까?  

A. 보안 그룹(Security Groups)  
B. Amazon Route 53  
C. AWS Direct Connect  
D. Amazon VPC  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

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

## Question 176

A company is migrating its public website to AWS. The company wants to host the domain name for the website on AWS.  
Which AWS service should the company use to meet this requirement?  

A. AWS Lambda  
B. Amazon Route 53  
C. Amazon CloudFront  
D. AWS Direct Connect  

[번역]  
회사는 공용 웹사이트를 AWS로 마이그레이션하고 있습니다. 회사는 AWS에서 웹사이트의 도메인 이름을 호스팅하고자 합니다.  
이 요구 사항을 충족하기 위해 사용할 AWS 서비스는 무엇입니까?  

A. AWS Lambda  
B. Amazon Route 53  
C. Amazon CloudFront  
D. AWS Direct Connect  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 177

A company needs to evaluate its AWS environment and provide best practice recommendations,  
in five categories: cost, performance, service limits, fault tolerance, and security.  
Which AWS service can the company use to meet these requirements?  

A. AWS Shield  
B. AWS WAF  
C. AWS Trusted Advisor  
D. AWS Service Catalog  

[번역]  
회사는 AWS 환경을 평가하고 비용, 성능, 서비스 제한, 내결함성 및 보안의 5가지 범주에 대한 모범 사례 권장 사항을 제공해야 합니다.  
이 요구 사항을 충족하기 위해 사용할 수 있는 AWS 서비스는 무엇입니까?  

A. AWS Shield  
B. AWS WAF  
C. AWS Trusted Advisor  
D. AWS Service Catalog  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 178

Which AWS service provides the capability to view end-to-end performance metrics and troubleshoot distributed applications?  

A. AWS Cloud9  
B. AWS CodeStar  
C. AWS Cloud Map  
D. AWS X-Ray  

[번역]  
어떤 AWS 서비스가 엔드투엔드 성능 메트릭을 보고 분산 애플리케이션 문제를 해결할 수 있는 기능을 제공합니까?  

A. AWS Cloud9  
B. AWS CodeStar  
C. AWS Cloud Map  
D. AWS X-Ray  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 179

Which cloud computing benefit does AWS demonstrate with its ability to offer lower variable costs as a result of high purchase volumes?  

A. Pay-as-you-go pricing  
B. High availability  
C. Global reach  
D. Economies of scale  

[번역]  
AWS는 대량 구매로 인해 더 낮은 변동 비용을 제공할 수 있는 기능을 통해 클라우드 컴퓨팅의 어떤 이점을 보여줍니까?  

A. 사용한 만큼 지불하는 가격 책정  
B. 고가용성  
C. 글로벌 도달 범위  
D. 규모의 경제  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 180

Which AWS service provides threat detection by monitoring for malicious activities,  
and unauthorized actions to protect AWS accounts, workloads, and data that is stored in Amazon S3?  

A. AWS Shield  
B. AWS Firewall Manager  
C. Amazon GuardDuty  
D. Amazon Inspector  

[번역]  
어떤 AWS 서비스가 악의적인 활동과 승인되지 않은 작업을 모니터링하여 AWS 계정, 워크로드 및 Amazon S3에 저장된 데이터를 보호하는 위협 탐지를 제공합니까?  

A. AWS Shield  
B. AWS Firewall Manager  
C. Amazon GuardDuty  
D. Amazon Inspector  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 181

Which AWS service can a company use to store and manage Docker images?  

A. Amazon DynamoDB  
B. Amazon Kinesis Data Streams  
C. Amazon Elastic Container Registry (Amazon ECR)  
D. Amazon Elastic File System (Amazon EFS)  

[번역]  
회사가 Docker 이미지를 저장하고 관리하기 위해 사용할 수 있는 AWS 서비스는 무엇입니까?  

A. Amazon DynamoDB  
B. Amazon Kinesis Data Streams  
C. Amazon Elastic Container Registry (Amazon ECR)  
D. Amazon Elastic File System (Amazon EFS)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

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

## Question 186

Which task is a customer's responsibility, according to the AWS shared responsibility model?  

A. Management of the guest operating systems  
B. Maintenance of the configuration of infrastructure devices  
C. Management of the host operating systems and virtualization  
D. Maintenance of the software that powers Availability Zones  

[번역]  
AWS 공동 책임 모델에 따르면 고객의 책임은 무엇입니까?  

A. 게스트 운영 체제 관리  
B. 인프라 장치 구성 유지 관리  
C. 호스트 운영 체제 및 가상화 관리  
D. 가용 영역을 구동하는 소프트웨어 유지 관리  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

## Question 187

A company needs to deliver new website features quickly in an iterative manner to minimize the time to market.  
Which AWS Cloud concept does this requirement represent?  

A. Reliability  
B. Elasticity  
C. Agility  
D. High availability  

[번역]  
회사는 새로운 웹사이트 기능을 신속하게 반복적으로 제공하여 시장 출시 시간을 최소화해야 합니다.  
이 요구 사항은 AWS 클라우드의 어떤 개념을 나타냅니까?  

A. 신뢰성  
B. 탄력성  
C. 민첩성  
D. 고가용성  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 188

A company wants to increase its ability to recover its infrastructure in the case of a natural disaster.  
Which pillar of the AWS Well-Architected Framework does this ability represent?  

A. Cost optimization  
B. Performance efficiency  
C. Reliability  
D. Security  

[번역]  
회사는 자연재해 발생 시 인프라 복구 능력을 높이고 싶어 합니다.  
이 능력은 AWS Well-Architected Framework의 어느 기둥을 나타냅니까?  

A. 비용 최적화  
B. 성능 효율성  
C. 신뢰성  
D. 보안  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C 
</div>  
</details>

## Question 189

Which AWS service tracks API calls and user activity?  

A. AWS Organizations  
B. AWS Config  
C. Amazon CloudWatch  
D. AWS CloudTrail  

[번역]  
어떤 AWS 서비스가 API 호출과 사용자 활동을 추적합니까?  

A. AWS Organizations  
B. AWS Config  
C. Amazon CloudWatch  
D. AWS CloudTrail  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 190

Which AWS service, feature, or tool uses machine learning to continuously monitor cost and usage for unusual cloud spending?  

A. Amazon Lookout for Metrics  
B. AWS Budgets  
C. Amazon CloudWatch  
D. AWS Cost Anomaly Detection  

[번역]  
어떤 AWS 서비스, 기능 또는 도구가 기계 학습을 사용하여 비정상적인 클라우드 지출을 지속적으로 모니터링합니까?  

A. Amazon Lookout for Metrics  
B. AWS 예산  
C. Amazon CloudWatch  
D. AWS 비용 이상 탐지  

> ✅ 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 191

A company deployed an application on an Amazon EC2 instance. The application ran as expected for 6 months, but in the past week, users have reported latency issues. A system administrator found that the CPU utilization was at 100% during business hours. The company wants a scalable solution to meet demand.  
Which AWS service or feature should the company use to handle the load for its application during periods of high demand?  

A. Auto Scaling groups  
B. AWS Global Accelerator  
C. Amazon Route 53  
D. An Elastic IP address  

[번역]  
회사는 Amazon EC2 인스턴스에 애플리케이션을 배포했습니다. 애플리케이션은 6개월 동안 예상대로 작동했지만, 지난주에 사용자가 지연 문제를 보고했습니다. 시스템 관리자는 업무 시간 동안 CPU 사용률이 100%에 도달했음을 발견했습니다. 회사는 수요를 충족하기 위한 확장 가능한 솔루션을 원합니다.  
높은 수요 기간 동안 애플리케이션의 부하를 처리하기 위해 회사가 사용해야 하는 AWS 서비스 또는 기능은 무엇입니까?  

A. Auto Scaling 그룹  
B. AWS Global Accelerator  
C. Amazon Route 53  
D. 탄력적 IP 주소(Elastic IP)  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## Question 192

A company wants to migrate to AWS and use the same security software it uses on premises. The security software vendor offers its security software as a service on AWS.  
Where can the company purchase the security solution?  

A. AWS Partner Solutions Finder  
B. AWS Support Center  
C. AWS Management Console  
D. AWS Marketplace  

[번역]  
회사는 AWS로 마이그레이션하고 온프레미스에서 사용하는 동일한 보안 소프트웨어를 사용하고자 합니다. 보안 소프트웨어 공급업체는 AWS에서 서비스로 제공하는 보안 소프트웨어를 제공합니다.  
회사가 이 보안 솔루션을 구매할 수 있는 곳은 어디입니까?  

A. AWS 파트너 솔루션 파인더  
B. AWS 지원 센터  
C. AWS 관리 콘솔  
D. AWS 마켓플레이스  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## Question 193

A company is generating large sets of critical data in its on-premises data center. The company needs to securely transfer the data to AWS for processing. These transfers must occur daily over a dedicated connection.  
Which AWS service should the company use to meet these requirements?  

A. AWS Backup  
B. AWS DataSync  
C. AWS Direct Connect  
D. AWS Snowball  

[번역]  
회사는 온프레미스 데이터 센터에서 대량의 중요한 데이터를 생성하고 있습니다. 회사는 이 데이터를 처리하기 위해 AWS로 안전하게 전송해야 합니다. 이러한 전송은 전용 연결을 통해 매일 이루어져야 합니다.  
이 요구 사항을 충족하기 위해 회사가 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS Backup  
B. AWS DataSync  
C. AWS Direct Connect  
D. AWS Snowball  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## Question 194

A company wants to run production workloads on AWS. The company wants access to technical support from engineers 24 hours a day, 7 days a week. The company also wants access to the AWS Health API and contextual architectural guidance for business use cases. The company has a strong IT support team and does not need concierge support.  
Which AWS Support plan will meet these requirements at the LOWEST cost?  

A. AWS Basic Support  
B. AWS Developer Support  
C. AWS Business Support  
D. AWS Enterprise Support  

[번역]  
회사는 AWS에서 프로덕션 워크로드를 실행하고자 합니다. 회사는 연중무휴로 엔지니어의 기술 지원에 접근하고 싶어하며, AWS Health API와 비즈니스 사례에 대한 맥락적 아키텍처 지침도 필요합니다. 회사는 강력한 IT 지원 팀을 보유하고 있으며, 컨시어지 지원은 필요하지 않습니다.  
이 요구 사항을 가장 저렴한 비용으로 충족하는 AWS 지원 플랜은 무엇입니까?  

A. AWS 기본 지원  
B. AWS 개발자 지원  
C. AWS 비즈니스 지원  
D. AWS 엔터프라이즈 지원  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

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

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## Question 196

Which of the following actions are controlled with AWS Identity and Access Management (IAM)? (Choose two.)  

A. Control access to AWS service APIs and to other specific resources.  
B. Provide intelligent threat detection and continuous monitoring.  
C. Protect the AWS environment using multi-factor authentication (MFA).  
D. Grant users access to AWS data centers.  
E. Provide firewall protection for applications from common web attacks.  

[번역]  
다음 중 AWS Identity and Access Management (IAM)으로 제어되는 작업은 무엇입니까? (두 개를 선택하세요.)  

A. AWS 서비스 API 및 기타 특정 리소스에 대한 액세스 제어  
B. 지능형 위협 탐지 및 지속적인 모니터링 제공  
C. 다단계 인증(MFA)을 사용하여 AWS 환경 보호  
D. 사용자가 AWS 데이터 센터에 접근할 수 있도록 허용  
E. 일반적인 웹 공격으로부터 애플리케이션을 보호하기 위한 방화벽 제공  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## Question 197

Which of the following are shared controls that apply to both AWS and the customer, according to the AWS shared responsibility model? (Choose two.)  

A. Resource configuration management  
B. Network data integrity  
C. Employee awareness and training  
D. Physical and environmental security  
E. Replacement and disposal of disk drives  

[번역]  
AWS 공동 책임 모델에 따르면, AWS와 고객 모두에게 적용되는 공유 제어는 무엇입니까? (두 개를 선택하세요.)  

A. 리소스 구성 관리  
B. 네트워크 데이터 무결성  
C. 직원 인식 및 교육  
D. 물리적 및 환경적 보안  
E. 디스크 드라이브 교체 및 폐기  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

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

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

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

## Question 200

Which AWS service provides domain registration, DNS routing, and service health checks?  

A. AWS Direct Connect  
B. Amazon Route 53  
C. Amazon CloudFront  
D. Amazon API Gateway  

[번역]  
어떤 AWS 서비스가 도메인 등록, DNS 라우팅 및 서비스 상태 검사를 제공합니까?  

A. AWS Direct Connect  
B. Amazon Route 53  
C. Amazon CloudFront  
D. Amazon API Gateway  

> 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은:  
</div>  
</details>

## 99. 참고 자료

- [[AWS] examtopics](https://www.examtopics.com/exams/amazon/aws-certified-cloud-practitioner/view/2/)