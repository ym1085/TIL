# 테라폼 작동원리와 CLI 실습

## Terraform 기본 개념

> 아래 내용은 테라폼 활용을 위한 기본 개념이다

```shell
- resource : 실제 인프라 자원(AWS SG, AWS VPC, AWS LB 등등)
- provider : 공급자(AWS, AZURE, GCP..)
- output : 프로비저닝 후 생성된 자원 output 저장
- backend : 상태를 저장할 공간 지정 -> S3 저장
- module : 공통 인프라 코드 모듈화 공간
- remote state : 공용 서비스 타 서비스에서 사용 가능
```

### ✅ resource

```terraform
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
```

`resource`는 `terraform 내`에서 `실제로 사용할 인프라 자원`을 의미한다.  
예시로 `aws_security`, `aws_lb`, `aws_instance`와 같은 내용이 존재한다.

### ✅ provider

> 참고 : https://www.terraform.io/docs/providers/index.html

```terraform
provider "aws" {
  region = "us-east-1"
  access_key = "access_key"
  secret_key = "secret_key"
}
```

Terraform으로 정의할 infrastructure provider 명시한다.  
즉 `provider`란 `Terraform`이 특정 `클라우드 서비스`나 `플랫폼`과 `상호작용`하기 위한 `플러그인`을 의미한다.  

### ✅ output

```terraform
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```

- `인프라를 프로비저닝 후`에 `생성된 자원`을 `output`로 뽑을 수 있음
- `OutPut`로 `추출한 부분`은 이후에 `remote state` 에서 활용 가능

### ✅ backend

```terraform
terraform {
  backend "s3" {
    bucket = "my-tf-state"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```

- `terraform`의 `상태`를 `저장`할 `공간을 지정`
- backend 사용 시 현재 배포된 최신 상태를 외부에 저장 -> `다른 사람 협업 가능`
- 가장 대표적으로 `S3`가 존재

### ✅ module

```terraform
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.3.0"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}
```

- `공통적으로 활용`할 수 있는 `인프라 코드`를 한곳에 모아 정의
- module 사용 시 변수만 바꿔서 동일한 리소스를 쉽게 생성 가능

### ✅ remote state

```terraform
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "my-tf-state"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.vpc.outputs.subnet_id
}
```

- VPC, IAM 같은 `공용 서비스`를 `다른 서비스`에서 `참조 가능`
- `tfstate파일`(최신 테라폼 상태정보)이 저장된 backend 정보 명시하면, terraform이 해당 backend에서 output 정보를 가져온다

### Terraform 작동 원리

> Local Code, AWS Real Infra, Backend State

테라폼을 활용하기 위해서는 테라폼의 작동 원리를 이해하는 것이 중요하다.  
`테라폼`에는 기본적으로 `3가지 형상`이 `존재`한다.

1. Local 코드: `현재 개발자가 작성/수정하고 있는 코드`
2. AWS 실제 인프라: `실제로 AWS에 배포되어 있는 인프라`
3. Backend에 저장된 상태: `가장 최근에 배포한 테라폼 코드 형상`

여기서 가장 중요한 부분은 `AWS 실제 인프라`와 `Backend에 저장된 상태`가 `100%[🔥] 일치` 하도록 만드는 것이다.  
위 2가지가 100% 일치하도록 유지하는것이 중요한데, `Terraform`은 `import`, `state` 명령어를 제공한다.

먼저 인프라 정의는 `Local 코드`로 시작한다.  

1. `개발자`는 `로컬`에서 `테라폼 코드 정의` (로컬 개발 느낌?)
2. `코드 정의 후` `실제 인프라로 프로비저닝` (PROD 서버 배포?)
3. 이 때 `backend를 구성`하여 `최신 코드를 저장`한다, 흐름은 아래와 같다

### Terraform init

> git fetch 같은 느낌인데?

- 지정한 backend(S3 등등)에 상태(state) 저장을 위해 `.tfstate 파일 생성`, 여기에는 가장 마지막에 적용한 테라폼 내역 저장
- `init 작업 완료 후` `local`에는 `.tfstate`에 정의된 내용을 담은 `.terraform` 파일 생성됨
- 기존 다른 개발자가 이미 `.tfstate`를 정의한게 있으면, 다른 개발자는 init 작업을 통해 local에 sync 맞출 수 있음

### Terraform plan

- 정의한 코드가 `어떤 인프라`를 만들지 `미리 예측 결과를 보여준다`
- 단, plan에 에러가 없어도 실제 배포 시 에러 있을 수 있음
- `Plan 명령어는 어떠한 형상에도 변화 주지 않음`

### Terraform apply

- 실제 인프라 배포를 위한 명령어
- `apply`시 `실제 인프라 생성` + `작업 결과`는 `backend`의 `.tfstate 파일에 저장`됨
- `apply`시 `해당 결과`는 `local`의 `.terraform 파일에도 저장`됨

### Terraform import

- `AWS 인프라에 배포된 리소스` -> `terraform state`로 `옮기는 작업`
- local의 .terraform에 해당 리소스의 상태 정보를 저장하는 역할
  - apply 전까지는 backend에 저장 안됨
  - import 이후에 plan을 하면 로컬에 코드가 없기에 리소스가 삭제 및 변경된다는 결과를 보여준다

## 99. 참고 자료

- [[Terraform] Terraform 기본](https://terraform101.inflearn.devopsart.dev/preparation/terraform-basic/)