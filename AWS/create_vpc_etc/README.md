# VPC, Subnet, Routing Table, NAT 생성 정리

## VPC 관련 몇 가지 알아둘점

- 커스텀 VPC 생성 시 만들어지는 리소스
  - `라우팅 테이블`(`Routing Table`)
  - `기본 NACL`(`Network Access Control List`)
  - `기본 보안그룹`(`Security Group`)
- 커스텀 서브넷 생성 시
  - 모두 `기본 라우팅 테이블로 자동 연동` (중요)
  - AWS는 각 서브넷에서 총 5개의 IP를 미리 점유한다 ( ..0, ..1, ..2, ..3, ..255 )
    - 실제 서브넷 설계 시에는 사용하고자 하는 IP 개수 +5 범위로 CIDR 지정 필요
    - 1) `네트워크 주소` : 서브넷이 10.0.0.0/16 인 경우 10.0.0.0 네트워크 주소로 예약
    - 2) `VPC 라우터 IP 주소` : VPC 라우터의 IP 주소로 예약, 이 IP는 서브넷 내의 네트워크 라우팅에 사용
    - 3) `DNS 서버 주소` : 10.0.0.2
    - 4) `미래를 위해 남겨둠` : 10.0.0.3
    - 5) `브로드 캐스트 주소` (브로드 캐스트는 지원 안함) : 10.0.0.255
- VPC에는 단 `1개의 IGW`만 생성 가능
  - IGW는 생성 후 직접 VPC에 연결해야함
  - IGW는 자체적으로 HA/장애내구성 확보 가능
- 보안그룹은 VPC 단위
- 서브넷은 가용영역 단위(1 서브넷 = 1 가용영역)

## VPC 생성 및 AWS 환경 구성

> 구성할 환경은 아래와 같음

- VPC 생성(172.21.0.0/16) 진행
- 서브넷 3개 생성(public, private)
- 각 서브넷에 Routing Table 연결
- Public 서브넷에 IGW 연결 + 인터넷 경로 구성
- Public 서브넷에 EC2 프로비전
- Private 서브넷에 EC2 프로비전
  - Bastion Host
- Private 서브넷에 NAT Gateway 연결

### VPC 생성

- VPC > VPC > VPC 생성
  - 생성할 리소스: VPC만
  - 이름 태그: test-vpc-prod-172.21.0.0/16
  - IPv4 CIDR 블록: IPv4 CIDR 수동 입력
  - IPv4 CIDR: 172.21.0.0/16
  - IPv6 CIDR 블록: IPv6 CIDR 블록 없음
  - 테넌시: 기본값
  - 태그
    - Name: test-vpc-prod-172.21.0.0/16
  - 생성 버튼 클릭
  - VPC 생성 시
    - Routing Table 생성
    - 보안그룹 생성
    - NACL 생성됨

### 서브넷 생성

- VPC > 서브넷 > 서브넷 생성
  - VPC ID: 위에서 생성한 VPC 지정
  - 서브넷 설정
    - `public subnet`
      - 서브넷 이름: test-subnet-pub-01
        - 가용영역: A zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.10.0/24 -> 172.21.10.1 ~ 172.21.10.254 IP 주소 사용
      - 서브넷 이름: test-subnet-pub-02
        - 가용영역: B zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.20.0/24 -> 172.21.20.1 ~ 172.21.20.254 IP 주소 사용
      - 서브넷 이름: test-subnet-pub-03
        - 가용영역: C zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.30.0/24 -> 172.21.30.1 ~ 172.21.30.254 IP 주소 사용
    - `private subnet`
      - 서브넷 이름: test-subnet-pri-01
        - 가용영역: A zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.50.0/24 -> 172.21.50.1 ~ 172.21.50.254 IP 주소 사용
      - 서브넷 이름: test-subnet-pri-02
        - 가용영역: B zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.60.0/24 -> 172.21.60.1 ~ 172.21.60.254 IP 주소 사용
      - 서브넷 이름: test-subnet-pri-03
        - 가용영역: C zone
        - IPv4 CIDR 블록: 172.21.0.0/16
        - IPv4 서브넷 CIDR 블록: 172.21.70.0/24 -> 172.21.70.1 ~ 172.21.70.254 IP 주소 사용
- 서브넷 생성 시 생성되는 부분
  - 해당 서브넷을 -> NACL에 자동으로 붙혀준다
  - 해당 서브넷을 -> Routing Table에 자동으로 연결해준다 ( 명시적 연결이 없는 서브넷에 나옴 )

### 라우팅 테이블 생성

- 라우팅 테이블 > 작업 > 서브넷 연결 편집 > private subnet 연결
  - 실제로는 Routing Table을 하나 더 만들어서 연결해야 할듯
- VPC > 라우팅 테이블 > 라우팅 테이블 생성
  - 이름: test-routing-table-public
  - VPC: test-vpc-prod-172.21.0.0/16
  - 라우팅 테이블 생성
  - public subnet을 위 라우팅 테이블에 연결

### 인터넷 게이트웨이 생성

- VPC > 인터넷 게이트웨이 > 인터넷 게이트웨이 생성
  - 이름 태그: test-internet-gateway
  - 인터넷 게이트웨이 생성
  - 작업 > VPC에 연결
    - 사용 가능한 VPC: test-vpc-prod-172.21.0.0/16
    - 인터넷 게이트웨이 연결

### 라우팅 테이블 탭

- VPC > 라우팅 테이블 > 퍼블릭 라우팅 테이블 선택 > 라우팅 편집
  - 라우팅 추가
    - 소스: 0.0.0.0/0
    - 대상: 인터넷 게이트웨이 (test-internet-gateway)
  - 172.0.0.0/16 -> local (VPC 내에서 트래픽 전달 -> Local로 간다)
  - 0.0.0.0/16 -> Igw (VPC 내부 트래픽이 아니면 -> 인터넷 게이트웨이 이동)

### public EC2 생성

- EC2 > 인스턴스 > Launch instance
  - 이름: demo-ec2-public
  - Amazon Machine Image(AMI): Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  - 아키텍처: 64비트(x86)
  - 인스턴스 유형: t2.micro (프리티어)
  - 키 페어(로그인): 없음
  - 네트워크 설정 > 편집
    - VPC: test-vpc-prod-172.21.0.0/16
    - 서브넷: ap-northeast-2a
    - 퍼블릭 IP 자동 할당: True (public IP를 만들건지 안 만들건지?)
    - 보안그룹: default 보안그룹
  - 인스턴스 시작
- 만약 public EC2의 key pair를 만들었다면, 아래 순서를 통해 키 업로드
  - Key가 있는 경로에서 git bash 오픈
  - chmod 400 ./test-vpc-private.pem
    - read: 4 / writer: 2 / access: 1
    - 4: 소유자 / 0: 그룹 / 0: other
  - scp -i <키 경로> <host@ip:/path>
    - secure copy ssh: scp + -i: identity file[파일 지정])
  - scp -i ./test-vpc-private.pem <ec2-user@54.123.xx.xx>:/home/ec2-user/
- public EC2에서 외부 통신 가능한지 확인
  - ping 8.8.8.8
  - curl -v naver.com

### private EC2 생성

- EC2 > 인스턴스 > Launch instance
  - 이름: demo-ec2-private
  - Amazon Machine Image(AMI): Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  - 아키텍처: 64비트(x86)
  - 인스턴스 유형: t2.micro (프리티어)
  - 키 페어(로그인): test-vpc-private
  - 네트워크 설정 > 편집
    - VPC: test-vpc-prod-172.21.0.0/16
    - 서브넷: ap-northeast-2a
    - 퍼블릭 IP 자동 할당: True (public IP를 만들건지 안 만들건지?)
    - 보안그룹: default 보안그룹
  - 인스턴스 시작
  - 인스턴스 연결 하여도 실제 실행 안됨
    - private subnet에 위치하였기에, public IP 할당 되어도 연결 불가능
    - SSM 사용하여 접속 가능하나, .pem 키를 사용하여 접속 진행
- private .pem key를 열어서 복사 후 public ec2 서버에 test-vpc-private.pem 에 복사
  - public EC2 -> private EC2 서버 접속
  - ssh -i "./test-vpc-private.pem" <ec2-user@172.21.x.x>
- sudo yum install -y mysql
  - 현재 private subnet에 위치한 EC2는 외부 연결이 되어 있지 않기에 통신 불가
  - NAT Gateway를 생성 후 Routing Table에서 해당 NAT Gateway 연결 후 통신 시켜야 함

### Private EC2의 외부 통신을 위해 NAT 생성

- VPC > NAT 게이트웨이 > NAT 게이트웨이 생성
  - 이름: test-nat-gateway-01
  - 서브넷: test-subnet-pub-01
  - 연결유형: 퍼블릭
  - 탄력적 IP 할당 ID: 신규 탄력적 IP 할당
  - NAT 게이트웨이 생성
- routing-table-private 수정
  - 0.0.0.0/0 -> NAT GW 연결
  - 실무에서는 0.0.0.0/0 쓰는것도 안 좋고, 외부 통신은 웬만하면 지양 (중요)
  - 172.21.50.0/24 -> CIDR 범위를 잡아주는것이 좋아보임 -> 근데 이것도 지양

### EC2(Private)에서 VPC 엔드포인트 통신 확인

> 여기서 ECR, ECS, XRAY, Cloudwatch 엔드포인트 테스트 진행  
> 우선 ECS 관련 엔드포인트 생성 후 엔드포인트로 지정된 보안그룹의 인바운드, 아웃바운드에 443 port 허용이 되어야 한다 (제일 중요)

- 엔드포인트 설정한 보안그룹의 인바운드/아웃바운드
  - 2개다 열려 있어야 통신이 가능한것으로 보임
    - 인바운드 -> 포트: 443 / VPC 대역 ( 172.21.0.0/16 )
    - 아웃바운드 -> 포틔: 443 / VPC 대역 ( 172.21.0.0/16 )
- 프로메테우스 관련 엔드포인트 설정
  - 인바운드 + 아웃바운드 VPC 대역 ( 172.21.0.0/16 )으로 전부 뚫고, PORT는 443로 연다
  - VPC Endpoint는 Interface ecs 생성

```shell
telnet api.ecr.ap-northeast-2.amazonaws.com 443 # ECR VPC 엔드포인트 확인
telnet logs.ap-northeast-2.api.aws 443 # Cloudwatch Logs VPC 엔드포인트 확인
telnet xray.ap-northeast-2.amazonaws.com 443 # Xray VPC 엔드포인트 확인
telnet ecs.ap-northeast-2.amazonaws.com 443 # ECS VPC 엔드포인트 확인
```

### ECS CLI를 사용하기 위한 IAM Role은 아래와 같음

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecs:ListTasks",
                "ecs:DescribeTasks",
                "ecs:ListClusters",
                "ecs:DescribeClusters",
                "ecs:ListServices",
                "ecs:DescribeServices",
                "ec2:DescribeNetworkInterfaces"
            ],
            "Resource": "*"
        }
    ]
}
```

### ECS CLI 테스트

```shell
aws ecs list-clusters \
--region ap-northeast-2 \
--endpoint-url https://ecs.ap-northeast-2.amazonaws.com \
--debug
```

## 99. 참고 자료

- [[AWS] VPC 생성 강의](https://www.youtube.com/watch?v=hi6S3DUJBBk&t=77s)
- [[AWS] AWS SAA 자격증 준비 (4) - 네트워크 (VPC, 네트워크 ACL, 보안그룹, Route 53, ELB)](https://julie-tech.tistory.com/125)
- [[AWS] VPC와 Subnet, EC2 네트워크 개요](https://velog.io/@on5949/AWS-VPC%EC%99%80-Subnet-EC2-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EC%9D%B4%EB%A1%A0%ED%8E%B8)
- [[AWS] Notion 참고 자료](https://cloudest.oopy.io/posting)
