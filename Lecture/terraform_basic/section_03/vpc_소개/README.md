# AWS VPC 소개

> AWS VPC(Virtual Private Network)는 사용자에 의해 생성이 가능한 AWS 가상 사설망을 의미한다  
> 이러한 VPC는 public, private subnet로 구분이 되며 IGW를 통해 외부 통신을 가능하게 한다

## AWS VPC 구성 요소 및 개념

### VPC

- `Virtual Private Network`의 약자
- `사용자 AWS 계정 내`의 `격리된 가상 네트워크`
- `VPC`는 `사용자`가 `지정`한 `사설 IP`(172.21.0.0/16) `주소`를 갖는다

### 서브넷

- `AWS의 리소스는` VPC에 배치되지 않고, `서브넷`(Subnet)에 `배치`된다
- `VPC 내`의 `IP 주소 모음`으로 `리소스 그룹화`를 도와준다
- Subnet은 리소스를 공개(public subnet)할지, 비공개(private subnet)할지 결정한다

### 라우팅 테이블

- `VPC 내부 네트워크 트래픽`이 `어디로 전달`될지 결정하는 `라우팅 규칙 집합`
- 1(서브넷) : 1(라우팅 테이블) 관계 매칭

### 인터넷 게이트웨이

- VPC에 Attach하여 `외부 인터넷 통신`을 위해 사용

### NAT 게이트웨이

- `프라이빗 서브넷`에서 `외부 인터넷 통신`을 위해 사용하는 개념
- 퍼블릿 서브넷에 위치해야 외부 통신 가능
- 외부에서 NAT 게이트웨이를 통해 내부로 들어오는건 불가능

### 보안 그룹

- 인스턴스 레벨에서 인바운드, 아웃바운드 트래픽을 제어하는 애플리케이션 방화벽
- `Stateful`를 사용하여 인바운드 허용 시 아웃바운드는 검사하지 않는다

### VPC 엔드포인트

- 프라이빗 서브넷에서 NAT 게이트웨이, AWS Direct Connect, IGW, VPN 사용하지 않고 AWS 전용 회선인 `PrivateLink`를 사용하여 AWS 서비스를 사용하는 개념

## 99. 참고 자료

- [[Terraform] VPC 소개](https://terraform101.inflearn.devopsart.dev/cont/vpc-intro/)