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

- `resource`는 terraform 내에서 실제 사용하는 리소스 자원(Security Group, ELB..) 의미
  - aws_security_group, aws_lb, aws_instance와 같은 리소스 존재
- 즉, 콘솔에서 어떠한 리소스를 만드는것처럼 해당 리소스(EC2, SG, Routing Table)을 지정하면 된다

### ✅ provider

> 참고 : https://www.terraform.io/docs/providers/index.html

```terraform
provider "aws" {
  region = "us-east-1"
  access_key = "access_key"
  secret_key = "secret_key"
}
```

- `provider`는 terraform으로 정의할 Infrastructure provider를 명시
- `provider`는 `특정 클라우드 서비스` or `플랫폼`과 `상호작용` 하기 위한 `플러그인` 의미
  - AWS, NCP, GCP.. 등등

### ✅ output

```terraform
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```

- `인프라`를 `프로비저닝`하고 `terraform` `결과물`을 `저장`하는 파일
- output로 추출한 부분은 추후 remote state에서 활용 가능

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

> Terraform을 활용하기 위해서는 아래 3가지 형상의 작동원리를 이해하는게 중요하다  
> Local Code(로컬 코드 작성) -> AWS 실제 인프라(실제 인프라 배포) -> Backend에 저장된 상태(가장 최근 배포된 테라폼 형상)

1. Local 코드: `현재 개발자가 작성하고 있는 코드`
2. AWS 실제 인프라: `실제로 AWS에 배포되어 있는 인프라`
3. Backend에 저장된 상태: `가장 최근에 배포한 테라폼 코드 형상`

- 여기서 `가장 중요한 부분`은 `AWS 실제 인프라`와 `Backend에 저장된 상태`가 `100% 일치`하도록 만드는 부분
- 위 2가지가 일치하는 것이 중요하며, terraform은 `import` 와 `state` 명령어를 제공한다
- 먼저 인프라 정의는 Local 코드로 시작
  - 1: `로컬`에서 개발자가 `코드 작성`
  - 2: 해당 코드를 `실제 인프라`에 `프로비저닝`
  - 3: backend 구성 + 최신 테라폼 코드 저장

> 1 - 3번에 대한 흐름은 아래와 같다

### Terraform init

```terraform
# provider.tf
provider "aws" {
  region = "ap-northeast-2"
}
```

- init 전에 우선 provider 부터 생성

```shell
# terraform init
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 3.37.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 3.37"

...중략
```

```shell
# .terraform 파일 생성되어 있음
$ ls -al
total 20
drwxr-xr-x. 3 ec2-user ec2-user    43 Sep 26 14:49 .
drwx------. 8 ec2-user ec2-user 16384 Sep 26 14:50 ..
drwxr-xr-x. 3 ec2-user ec2-user    21 Sep 26 14:48 .terraform
-rw-r--r--. 1 ec2-user ec2-user    47 Sep 26 14:48 provider.tf
```

- `지정한 backend`(s3)에 `상태 저장`을 위해 `terraform.tfstate` 파일 생성
  - `가장 최신 테라폼 내역 저장`
- `terraform init` 작업이 완료되면, 로컬에는 .terraform 디렉토리가 생성됨
  - 플러그인, 모듈, 백엔드 설정 등 저장
- 다른 개발자가 .tfstate 정의한게 있으면, `init` 통해 local에서 싱크(sync) 맞출수 있음

### Terraform plan

```terraform
resource "aws_s3_bucket" "test" {
  bucket = "terraform"
}
```

- s3 버킷 생성

```shell
# ec2-user @ terraform-ec2-test in ~/terraform [14:52:41]
# terraform plan 실행
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.test will be created
  + resource "aws_s3_bucket" "test" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "terraform"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

- `정의한 코드`가 `어떤 인프라`를 만들지 `예측 결과 확인`
- plan에 에러가 없어도 실제 배포 시 에러 있을 수 있음
- `Plan 명령어는 어떠한 형상에도 변화 주지 않음`

### Terraform apply

```shell
# ec2-user @ terraform-ec2-test in ~/terraform [14:54:25]
$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.test will be created
  + resource "aws_s3_bucket" "test" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "terraform101-ymkim"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.test: Creating...
aws_s3_bucket.test: Creation complete after 1s [id=terraform101-ymkim]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

```shell
# 버킷 생성시 버킷 이름은 전 세계적으로 고유해야 하기 때문에
# 다른 사용자가 사용중인 경우 사용을 못한다, uniq한 이름으로 변경
Error: Error creating S3 bucket: BucketAlreadyExists: The requested bucket name is not available. The bucket namespace is shared by all users of the system. Please select a different name and try again.
	status code: 409, request id: R5D4G7RGQVMR77M0, host id: 9OS1h9ooo79u2cjX05r6klEBDtmxZgaF91dgTrvjxx+WzEDmeP0EQKZUpW5pUhz1FglRBg3hhg/WlnOkOANqpg==
```

- `실제 인프라 배포` 명령어
  - apply시 실제 인프라 생성
  - apply시 작업 결과는 .tfstate 파일에 저장
  - apply시 해당 결과는 local의 .terraform 파일에도 저장

### Terraform import

- aws 인프라에 `배포된 리소스`를 `terraform state로 옮기는 작업`
- `local`의 `.terraform` 파일에 해당 리소스 상태 정보 저장
  - apply 전까지 backend에 저장 안함
  - import 이후 plan 하면 로컬 코드 없어짐
    - 리소스 삭제 및 변경된다는 결과 출력

## 99. 참고 자료

- [[Terraform] Terraform 기본](https://terraform101.inflearn.devopsart.dev/preparation/terraform-basic/)