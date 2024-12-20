# AWS Practitional examtopics 문제 풀이

> AWS Practitional 자격증 취득을 위한 덤프 문제 풀이

## Question 201

A bank needs to store recordings of calls made to its contact center for 6 years.  
The recordings must be accessible within 48 hours from the time they are requested.  
Which AWS service will provide a secure and cost-effective solution for retaining these files?  

A. Amazon DynamoDB  
B. Amazon S3 Glacier  
C. Amazon Connect  
D. Amazon ElastiCache  

[번역]  
은행은 연락 센터에서 걸려온 통화 녹음을 6년 동안 저장해야 합니다.  
요청된 후 48시간 이내에 녹음에 접근할 수 있어야 합니다.  
이 파일을 안전하고 비용 효율적으로 보관하기 위한 AWS 서비스는 무엇입니까?  

A. Amazon DynamoDB  
B. Amazon S3 Glacier  
C. Amazon Connect  
D. Amazon ElastiCache  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon DynamoDB  

- `NoSQL 데이터베이스`
- 통화 녹음 파일을 장기 보관하고 저비용으로 아카이빙 하는데 적합하지 않음

B. Amazon S3 Glacier  

- `AWS S3 Glacier`는 `장기 보관` 및 `아카이빙` `목적`으로 사용하는 스토리지 `서비스`
- `AWS S3 Glacier`는 `데이터`에 `접근`하는 다양한 `옵션` 제공하며, 48시간 이내에 접근 가능하도록 데이터를 복구하는 옵션도 제공

C. Amazon Connect  

- `AWS Connect`는 `완전 관리형`으로 제공되는 `콜센터 솔루션`
- 고객이 인프라를 직접 관리하지 않고, 필요한 설정만 변경 및 확장 가능

D. Amazon ElastiCache  

- `AWS ElastiCache`는 `메모리 기반`의 `캐시 서비스`
- 데이터를 빠르게 읽고 쓰는데 적합하지만, 장기 저장 및 아카이빙에는 맞지 않음

</div>  
</details>

## Question 202

Which AWS service should be used to migrate a company's on-premises MySQL database to Amazon RDS?  

A. AWS Direct Connect  
B. AWS Server Migration Service (AWS SMS)  
C. AWS Database Migration Service (AWS DMS)  
D. AWS Schema Conversion Tool (AWS SCT)  

[번역]  
회사의 온프레미스 MySQL 데이터베이스를 Amazon RDS로 마이그레이션하기 위해 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS Direct Connect  
B. AWS Server Migration Service (AWS SMS)  
C. AWS Database Migration Service (AWS DMS)  
D. AWS Schema Conversion Tool (AWS SCT)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS Direct Connect  

- `AWS Direct Connect`는 네트워크를 공유하지 않고 전용 광섬유 전용 네트워크 선을 통해 통신하는 것을 의미
- 신뢰성 및 안정성 있는 통신을 IDC와 AWS 사이에서 수행 가능

B. AWS Server Migration Service (AWS SMS)  

- `AWS SMS`는 `가상머신`이나 `온프레미스 서버` `전체`를 `AWS`로 `마이그레이션` 할때 사용하는 도구
- 주로 애플리케이션 서버를 옮길 때 사용, DB 마이그레이션 서비스는 아님

C. AWS Database Migration Service (AWS DMS)  

- `AWS DMS`는 온프레미스 DB를 AWS RDS로 마이그레이션 하는데 적합한 도구
- 특히 MySQL과 같은 DB를 RDS로 전송할 때 주로 사용
- 데이터 복제 및 실시간 데이터 데이터 전송 기능 제공

D. AWS Schema Conversion Tool (AWS SCT)  

- `AWS SCT`는 `DB 스키마`를 `변환`하는데 사용
- 서로 다른 DB 간의 스키마 변환 지원

</div>  
</details>

## Question 203

Which benefits does a company gain when the company moves from on-premises IT architecture to the AWS Cloud? (Choose two.)  

A. Reduced or eliminated tasks for hardware troubleshooting, capacity planning, and procurement  
B. Elimination of the need for trained IT staff  
C. Automatic security configuration of all applications that are migrated to the cloud  
D. Elimination of the need for disaster recovery planning  
E. Faster deployment of new features and applications  

[번역]  
회사가 온프레미스 IT 아키텍처에서 AWS 클라우드로 이동할 때 얻게 되는 이점은 무엇입니까? (두 개를 선택하세요.)  

A. 하드웨어 문제 해결, 용량 계획 및 조달 작업 감소 또는 제거  
B. 훈련된 IT 직원에 대한 필요성 제거  
C. 클라우드로 마이그레이션된 모든 애플리케이션의 자동 보안 구성  
D. 재해 복구 계획 필요성 제거  
E. 새로운 기능 및 애플리케이션의 더 빠른 배포  

> ✅ 

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, E
</div>  
</details>

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

## Question 205

Which task is the responsibility of the customer according to the AWS shared responsibility model?  

A. Maintain the security of the hardware that runs Amazon EC2 instances.  
B. Patch the guest operating system of Amazon EC2 instances.  
C. Protect the security of the AWS global infrastructure.  
D. Patch Amazon RDS software.  

[번역]  
AWS 공동 책임 모델에 따르면 고객의 책임은 무엇입니까?  

A. Amazon EC2 인스턴스를 실행하는 하드웨어의 보안을 유지합니다.  
B. Amazon EC2 인스턴스의 게스트 운영 체제를 패치합니다.  
C. AWS 글로벌 인프라의 보안을 보호합니다.  
D. Amazon RDS 소프트웨어를 패치합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 206

Which AWS Organizations feature can be used to track charges across multiple accounts and report the combined cost?  

A. Service control policies (SCPs)  
B. Cost Explorer  
C. Consolidated billing  
D. AWS Identity and Access Management (IAM)  

[번역]  
여러 계정의 비용을 추적하고 결합된 비용을 보고하는 데 사용할 수 있는 AWS Organizations 기능은 무엇입니까?  

A. 서비스 제어 정책(SCPs)  
B. 비용 탐색기(Cost Explorer)  
C. 통합 청구(Consolidated Billing)  
D. AWS Identity and Access Management (IAM)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. Service control policies (SCPs)  

- `AWS Service Control Policies`는 AWS `Organization` 서비스 중 하나
- `정책`을 `설정`하여 `여러 계정`의 `서비스 사용`을 `제어`하는 기능

B. Cost Explorer  

- `AWS Cost Explorer`는 AWS `서비스 사용 관련된 비용`을 `시각화`할 수 있는 서비스
- `여러 AWS 계정` 관련된 부분은 Cosolidated biling 사용

C. Consolidated billing  

- `AWS Consolidated billing`은 AWS `Organization` 기능 중 하나
- `여러 AWS 계정`에서 `발생`한 `비용`을 `1곳`에서 `추적` 및 `보고 가능`

D. AWS Identity and Access Management (IAM)  

- IAM은 사용자 및 리소스에 대한 접근 제어 하는 서비스

</div>  
</details>

## Question 207

Which of the following is a cloud benefit that AWS offers to its users?  

A. The ability to configure AWS data center hypervisors  
B. The ability to purchase hardware in advance of increased traffic  
C. The ability to deploy to AWS on a global scale  
D. Compliance audits for user IT environments  

[번역]  
다음 중 AWS가 사용자에게 제공하는 클라우드의 이점은 무엇입니까?  

A. AWS 데이터 센터 하이퍼바이저를 구성할 수 있는 능력  
B. 증가하는 트래픽에 대비하여 하드웨어를 미리 구매할 수 있는 능력  
C. 글로벌 규모로 AWS에 배포할 수 있는 능력  
D. 사용자 IT 환경에 대한 규정 준수 감사  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C

A. AWS 데이터 센터 하이퍼바이저를 구성할 수 있는 능력  

- AWS는 `하이퍼바이저`나 `물리적 서버 설정`은 `고객`에게 `노출하지 않음`
- 이러한 `인프라`는 `AWS`가 `관리`하고, 사용자는 서비스를 사용하기만 한다

B. 증가하는 트래픽에 대비하여 하드웨어를 미리 구매할 수 있는 능력  

- AWS는 온디멘드 리소스 지원, `H/W 미리 구매할 필요 없음`

C. 글로벌 규모로 AWS에 배포할 수 있는 능력  

- AWS는 리전 > 가용영역 존재
- 글로벌 규모 애플리케이션 빠르게 배포 가능

D. 사용자 IT 환경에 대한 규정 준수 감사  

- `AWS`는 `자체 데이터 센터` + `인프라`에 대한 `규정 준수`는 관리
- `사용자`가 `애플리케이션` 및 `데이터`에 대한 `규정 준수 관리`해야 함

</div>  
</details>

## Question 208

An ecommerce company has migrated its IT infrastructure from an on-premises data center to the AWS Cloud.  
Which cost is the company's direct responsibility?  

A. Cost of application software licenses  
B. Cost of the hardware infrastructure on AWS  
C. Cost of power for the AWS servers  
D. Cost of physical security for the AWS data center  

[번역]  
전자 상거래 회사가 온프레미스 데이터 센터에서 AWS 클라우드로 IT 인프라를 마이그레이션했습니다.  
회사가 직접 책임져야 할 비용은 무엇입니까?  

A. 애플리케이션 소프트웨어 라이선스 비용  
B. AWS의 하드웨어 인프라 비용  
C. AWS 서버 전력 비용  
D. AWS 데이터 센터의 물리적 보안 비용  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

## Question 209

What are the five pillars of the AWS Well-Architected Framework?  

A. Encryption, documentation, speed, hybrid design, and cost optimization  
B. Containerization, cost margins, globalization, marketplace, and developer operations  
C. Network, compute, storage, security, and developer operations  
D. Operational excellence, reliability, performance efficiency, security, and cost optimization  

[번역]  
AWS Well-Architected Framework의 다섯 가지 기둥은 무엇입니까?  

A. 암호화, 문서화, 속도, 하이브리드 설계 및 비용 최적화  
B. 컨테이너화, 비용 마진, 글로벌화, 마켓플레이스 및 개발자 운영  
C. 네트워크, 컴퓨팅, 스토리지, 보안 및 개발자 운영  
D. 운영 우수성, 신뢰성, 성능 효율성, 보안 및 비용 최적화  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 210

A company accepts enrollment applications on handwritten paper forms. The company uses a manual process to enter the form data into its backend systems.  
The company wants to automate the process by scanning the forms and capturing the enrollment data from scanned PDF files.  
Which AWS service should the company use to build this process?  

A. Amazon Rekognition  
B. Amazon Textract  
C. Amazon Transcribe  
D. Amazon Comprehend  

[번역]  
회사는 손으로 쓴 종이 양식으로 등록 신청서를 받습니다. 회사는 양식 데이터를 백엔드 시스템에 수동으로 입력하는 프로세스를 사용하고 있습니다.  
회사는 양식을 스캔하고 스캔된 PDF 파일에서 등록 데이터를 캡처하여 이 프로세스를 자동화하고 싶어 합니다.  
이 프로세스를 구축하는 데 사용할 AWS 서비스는 무엇입니까?  

A. Amazon Rekognition  
B. Amazon Textract  
C. Amazon Transcribe  
D. Amazon Comprehend  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B

A. Amazon Rekognition 

- `이미지` + `비디오` 분석 서비스
- `얼굴인식`, `객체 탐지`등 시각적 데이터 분석 가능
- 이미지 기반 작업 특화

B. Amazon Textract  

- `문서`에서 `텍스트`와 `데이터` `추출`하는 서비스
- `스캔된 문서`나 `PDF`에서 텍스트, 테이블, 양식 데이터 식별 및 추출

C. Amazon Transcribe  

- `음성 데이터`를 `텍스트`로 `변환`하는 서비스
- `오디오 파일 업로드` 시 `자동 텍스트 변환` 후 `자막` 및 `대본` 생성 가능

D. Amazon Comprehend  

- `자연어 처리`(NLP) 서비스
- `텍스트`에서 `감정 분석`하여 `인사이트`를 얻는다
- `문서`에서 텍스트 추출하는 데 사용 안함

</div>  
</details>

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
정답은: B

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

## Question 212

An ecommerce company wants to use Amazon EC2 Auto Scaling to add and remove EC2 instances based on CPU utilization.  
Which AWS service or feature can initiate an Amazon EC2 Auto Scaling action to achieve this goal?  

A. Amazon Simple Queue Service (Amazon SQS)  
B. Amazon Simple Notification Service (Amazon SNS)  
C. AWS Systems Manager  
D. Amazon CloudWatch alarm  

[번역]  
전자상거래 회사는 CPU 사용률에 따라 EC2 인스턴스를 추가 및 제거하기 위해 Amazon EC2 Auto Scaling을 사용하려고 합니다.  
이 목표를 달성하기 위해 Amazon EC2 Auto Scaling 작업을 시작할 수 있는 AWS 서비스 또는 기능은 무엇입니까?  

A. Amazon Simple Queue Service (Amazon SQS)  
B. Amazon Simple Notification Service (Amazon SNS)  
C. AWS Systems Manager  
D. Amazon CloudWatch 알람  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 213

A company wants to host a private version control system for its application code in the AWS Cloud.  
Which AWS service should the company use to meet this requirement?  

A. AWS CodePipeline  
B. AWS CodeStar  
C. AWS CodeCommit  
D. AWS CodeDeploy  

[번역]  
회사는 AWS 클라우드에서 애플리케이션 코드의 개인 버전 제어 시스템을 호스팅하려고 합니다.  
이 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 서비스는 무엇입니까?  

A. AWS CodePipeline  
B. AWS CodeStar  
C. AWS CodeCommit  
D. AWS CodeDeploy  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

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

## Question 215

Which AWS service is used to host static websites?  

A. Amazon S3  
B. Amazon Elastic Block Store (Amazon EBS)  
C. AWS CloudFormation  
D. Amazon Elastic File System (Amazon EFS)  

[번역]  
정적 웹사이트를 호스팅하는 데 사용되는 AWS 서비스는 무엇입니까?  

A. Amazon S3  
B. Amazon Elastic Block Store (Amazon EBS)  
C. AWS CloudFormation  
D. Amazon Elastic File System (Amazon EFS)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

## Question 216

Which AWS service contains built-in engines to protect web applications that run in the cloud from SQL injection attacks and cross-site scripting?  

A. AWS WAF  
B. AWS Shield Advanced  
C. Amazon GuardDuty  
D. Amazon Detective  

[번역]  
다음 중 클라우드에서 실행되는 웹 애플리케이션을 SQL 삽입 공격 및 교차 사이트 스크립팅으로부터 보호하는 내장 엔진이 포함된 AWS 서비스는 무엇입니까?  

A. AWS WAF  
B. AWS Shield Advanced  
C. Amazon GuardDuty  
D. Amazon Detective  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

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

## Question 220

What is the primary use case for Amazon GuardDuty?  

A. Prevention of DDoS attacks  
B. Protection against SQL injection attacks  
C. Automatic monitoring for threats to AWS workloads  
D. Automatic provisioning of AWS resources  

[번역]  
Amazon GuardDuty의 주요 사용 사례는 무엇입니까?  

A. DDoS 공격 방지  
B. SQL 삽입 공격 방지  
C. AWS 워크로드에 대한 위협을 자동으로 모니터링  
D. AWS 리소스의 자동 프로비저닝  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 221

Which statements explain the business value of migration to the AWS Cloud? (Choose two.)  

A. The migration of enterprise applications to the AWS Cloud makes these applications automatically available on mobile devices.  
B. AWS availability and security provide the ability to improve service level agreements (SLAs) while reducing risk and unplanned downtime.  
C. Companies that migrate to the AWS Cloud eliminate the need to plan for high availability and disaster recovery.  
D. Companies that migrate to the AWS Cloud reduce IT costs related to infrastructure, freeing budget for reinvestment in other areas.  
E. Applications are modernized because migration to the AWS Cloud requires companies to rearchitect and rewrite all enterprise applications.  

[번역]  
AWS 클라우드로의 마이그레이션이 제공하는 비즈니스 가치는 무엇입니까? (두 개를 선택하세요.)  

A. 엔터프라이즈 애플리케이션을 AWS 클라우드로 마이그레이션하면 해당 애플리케이션이 모바일 기기에서 자동으로 사용 가능해집니다.  
B. AWS의 가용성 및 보안은 서비스 수준 계약(SLA)을 개선하고 위험과 계획되지 않은 다운타임을 줄일 수 있는 능력을 제공합니다.  
C. AWS 클라우드로 마이그레이션한 회사는 고가용성과 재해 복구 계획을 세울 필요가 없습니다.  
D. AWS 클라우드로 마이그레이션한 회사는 인프라 관련 IT 비용을 줄여 다른 영역에 재투자할 예산을 확보할 수 있습니다.  
E. 애플리케이션은 AWS 클라우드로 마이그레이션할 때 모든 엔터프라이즈 애플리케이션을 재설계하고 다시 작성해야 하므로 현대화됩니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B, D
</div>  
</details>

## Question 222

A company needs to identify personally identifiable information (PII), such as credit card numbers, from data that is stored in Amazon S3.  
Which AWS service should the company use to meet this requirement?  

A. Amazon Inspector  
B. AWS Shield  
C. Amazon GuardDuty  
D. Amazon Macie  

[번역]  
회사는 Amazon S3에 저장된 데이터에서 신용 카드 번호와 같은 개인 식별 정보를 식별해야 합니다.  
이 요구 사항을 충족하기 위해 회사가 사용해야 하는 AWS 서비스는 무엇입니까?  

A. Amazon Inspector  
B. AWS Shield  
C. Amazon GuardDuty  
D. Amazon Macie  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 223

Which AWS services or tools are designed to protect a workload from SQL injections, cross-site scripting, and DDoS attacks? (Choose two.)  

A. VPC endpoint  
B. Virtual private gateway  
C. AWS Shield Standard  
D. AWS Config  
E. AWS WAF  

[번역]  
다음 중 SQL 삽입 공격, 크로스 사이트 스크립팅 및 DDoS 공격으로부터 워크로드를 보호하도록 설계된 AWS 서비스 또는 도구는 무엇입니까? (두 개를 선택하세요.)  

A. VPC 엔드포인트  
B. 가상 프라이빗 게이트웨이  
C. AWS Shield 표준  
D. AWS Config  
E. AWS WAF  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C, E
</div>  
</details>

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

## Question 227

Which task is the responsibility of AWS, according to the AWS shared responsibility model?  

A. Apply guest operating system patches to Amazon EC2 instances.  
B. Provide monitoring of human resources information management (HRIM) systems.  
C. Perform automated backups of Amazon RDS instances.  
D. Optimize the costs of running AWS services.  

[번역]  
AWS 공동 책임 모델에 따르면 AWS의 책임은 무엇입니까?  

A. Amazon EC2 인스턴스에 게스트 운영 체제 패치를 적용합니다.  
B. 인적 자원 정보 관리 시스템(HRIM)의 모니터링을 제공합니다.  
C. Amazon RDS 인스턴스의 자동 백업을 수행합니다.  
D. AWS 서비스 실행 비용을 최적화합니다.  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 228

A company needs to deploy a PostgreSQL database into Amazon RDS.  
The database must be highly available and fault tolerant.  
Which AWS solution should the company use to meet these requirements?  

A. Amazon RDS with a single Availability Zone  
B. Amazon RDS snapshots  
C. Amazon RDS with multiple Availability Zones  
D. AWS Database Migration Service (AWS DMS)  

[번역]  
회사는 Amazon RDS에 PostgreSQL 데이터베이스를 배포해야 합니다.  
데이터베이스는 고가용성과 내결함성을 가져야 합니다.  
이 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 솔루션은 무엇입니까?  

A. 단일 가용 영역의 Amazon RDS  
B. Amazon RDS 스냅샷  
C. 여러 가용 영역을 사용하는 Amazon RDS  
D. AWS 데이터베이스 마이그레이션 서비스(AWS DMS)  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: C
</div>  
</details>

## Question 229

A company wants to add facial identification to its user verification process on an application.  
Which AWS service should the company use to meet this requirement?  

A. Amazon Polly  
B. Amazon Transcribe  
C. Amazon Lex  
D. Amazon Rekognition  

[번역]  
회사는 애플리케이션의 사용자 인증 과정에 얼굴 인식을 추가하려고 합니다.  
이 요구 사항을 충족하기 위해 회사에서 사용해야 하는 AWS 서비스는 무엇입니까?  

A. Amazon Polly  
B. Amazon Transcribe  
C. Amazon Lex  
D. Amazon Rekognition  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D

A. Amazon Polly  

- 텍스트를 음성 데이터로 변환하는 서비스

B. Amazon Transcribe  

- 음성 파일을 텍스트로 변환하는 서비스

C. Amazon Lex  

- 음성 인식 및 자연어 처리 기반, 대화형 봇 구축 서비스

D. Amazon Rekognition  

- 이미지, 비디오 분석 서비스
- 얼굴 인식, 객체 탐지, 이미지 기반 서비스 제공

</div>  
</details>

## Question 230

A company wants the ability to quickly upload its applications to the AWS Cloud without needing to provision underlying resources.  
Which AWS service will meet these requirements?  

A. AWS CloudFormation  
B. AWS Elastic Beanstalk  
C. AWS CodeDeploy  
D. AWS CodeCommit  

[번역]  
회사는 AWS 클라우드로 애플리케이션을 신속하게 업로드하고 기본 리소스를 프로비저닝할 필요가 없는 기능을 원합니다.  
이 요구 사항을 충족하기 위해 사용할 AWS 서비스는 무엇입니까?  

A. AWS CloudFormation  
B. AWS Elastic Beanstalk  
C. AWS CodeDeploy  
D. AWS CodeCommit  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: B
</div>  
</details>

## Question 231

Which AWS service monitors CPU utilization on Amazon EC2 instances?  

A. AWS CloudTrail  
B. Amazon Inspector  
C. AWS Config  
D. Amazon CloudWatch  

[번역]  
Amazon EC2 인스턴스에서 CPU 사용량을 모니터링하는 AWS 서비스는 무엇입니까?  

A. AWS CloudTrail  
B. Amazon Inspector  
C. AWS Config  
D. Amazon CloudWatch  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 232

A company needs to label its AWS resources so that the company can categorize and track costs.  
What should the company do to meet this requirement?  

A. Use cost allocation tags.  
B. Use AWS Identity and Access Management (IAM).  
C. Use AWS Organizations.  
D. Use the AWS Cost Management coverage report.  

[번역]  
회사는 AWS 리소스에 라벨을 붙여 비용을 분류하고 추적할 수 있어야 합니다.  
이 요구 사항을 충족하기 위해 회사는 무엇을 해야 합니까?  

A. 비용 할당 태그 사용  
B. AWS Identity and Access Management (IAM) 사용  
C. AWS Organizations 사용  
D. AWS 비용 관리 보고서 사용  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

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

## Question 234

Which task can a company complete by using AWS Organizations?  

A. Track application deployment statuses globally.  
B. Remove unused and underutilized AWS resources across all accounts.  
C. Activate DDoS protection across all accounts.  
D. Share pre-purchased Amazon EC2 resources across accounts.  

[번역]  
회사는 AWS Organizations를 사용하여 어떤 작업을 완료할 수 있습니까?  

A. 전 세계 애플리케이션 배포 상태 추적  
B. 사용되지 않거나 저활용된 AWS 리소스 제거  
C. 모든 계정에서 DDoS 보호 활성화  
D. 여러 계정 간에 미리 구매한 Amazon EC2 리소스 공유  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 235

A user has been granted permission to change their own IAM user password.  
Which AWS services can the user use to change the password? (Choose two.)  

A. AWS Command Line Interface (AWS CLI)  
B. AWS Key Management Service (AWS KMS)  
C. AWS Management Console  
D. AWS Resource Access Manager (AWS RAM)  
E. AWS Secrets Manager  

[번역]  
사용자가 자신의 IAM 사용자 암호를 변경할 수 있는 권한을 부여받았습니다.  
사용자가 암호를 변경하기 위해 사용할 수 있는 AWS 서비스는 무엇입니까? (두 개를 선택하세요.)  

A. AWS Command Line Interface (AWS CLI)  
B. AWS Key Management Service (AWS KMS)  
C. AWS 관리 콘솔  
D. AWS Resource Access Manager (AWS RAM)  
E. AWS Secrets Manager  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A, C
</div>  
</details>

## Question 236

A company needs to run an application on Amazon EC2 instances. The instances cannot be interrupted at any time.  
The company needs an instance purchasing option that requires no long-term commitment or upfront payment.  
Which instance purchasing option will meet these requirements MOST cost-effectively?  

A. On-Demand Instances  
B. Spot Instances  
C. Dedicated Hosts  
D. Reserved Instances  

[번역]  
회사는 Amazon EC2 인스턴스에서 애플리케이션을 실행해야 합니다. 인스턴스는 중단될 수 없습니다.  
회사는 장기적인 약정이나 선불이 필요하지 않은 인스턴스 구매 옵션이 필요합니다.  
이 요구 사항을 가장 비용 효율적으로 충족하는 인스턴스 구매 옵션은 무엇입니까?  

A. 주문형 인스턴스  
B. 스팟 인스턴스  
C. 전용 호스트  
D. 예약 인스턴스  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: A
</div>  
</details>

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

## Question 238

Which task can a user complete by using AWS Identity and Access Management (IAM)?  

A. Validate JSON syntax from an application configuration file.  
B. Analyze logs from an Amazon API Gateway call.  
C. Filter traffic to or from an Amazon EC2 instance.  
D. Grant permissions to applications that run on Amazon EC2 instances.  

[번역]  
사용자가 AWS Identity and Access Management (IAM)를 사용하여 수행할 수 있는 작업은 무엇입니까?  

A. 애플리케이션 구성 파일의 JSON 구문 유효성 검사  
B. Amazon API Gateway 호출에서 로그 분석  
C. Amazon EC2 인스턴스로 들어오거나 나가는 트래픽 필터링  
D. Amazon EC2 인스턴스에서 실행되는 애플리케이션에 대한 권한 부여  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## Question 239

A company needs to generate reports for business intelligence and operational analytics on petabytes of semistructured and structured data.  
These reports are produced from standard SQL queries on data that is in an Amazon S3 data lake.  
Which AWS service provides the ability to analyze this data?  

A. Amazon RDS  
B. Amazon Neptune  
C. Amazon DynamoDB  
D. Amazon Redshift  

[번역]  
회사는 비즈니스 인텔리전스 및 운영 분석을 위해 페타바이트 규모의 반구조적 및 구조적 데이터에 대한 보고서를 생성해야 합니다.  
이러한 보고서는 Amazon S3 데이터 레이크에 있는 데이터를 기반으로 표준 SQL 쿼리를 사용하여 생성됩니다.  
이 데이터를 분석할 수 있는 AWS 서비스는 무엇입니까?  

A. Amazon RDS  
B. Amazon Neptune  
C. Amazon DynamoDB  
D. Amazon Redshift  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D 
</div>  
</details>

## Question 240

A system automatically recovers from failure when a company launches its workload on the AWS Cloud services platform.  
Which pillar of the AWS Well-Architected Framework does this situation demonstrate?  

A. Cost optimization  
B. Operational excellence  
C. Performance efficiency  
D. Reliability  

[번역]  
회사가 AWS 클라우드 서비스 플랫폼에서 워크로드를 시작할 때 시스템이 자동으로 장애에서 복구됩니다.  
이 상황은 AWS Well-Architected Framework의 어느 기둥을 나타냅니까?  

A. 비용 최적화  
B. 운영 우수성  
C. 성능 효율성  
D. 신뢰성  

> ✅

<details>  
<summary>정답 보기</summary>  
<div markdown="1">  
정답은: D
</div>  
</details>

## 99. 참고 자료

- [[AWS] examtopics](https://www.examtopics.com/exams/amazon/aws-certified-cloud-practitioner/view/2/)
