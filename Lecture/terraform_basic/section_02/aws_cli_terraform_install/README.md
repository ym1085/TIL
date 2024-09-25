# AWS CLI 및 Terraform 설치

> 이번에는 AWS CLI와 Terraform을 설치하는 부분을 진행

## AWS CLI 2 설치

> AWS CLI는 version 1, 2가 확실히 많은 기능이 있기에 버전 2로 설치하는 것을 권장

- [[AWS] 최신 버전의 AWS CLI V2 설치 또는 업데이트](https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/getting-started-install.html)
- [[AWS] AWS MacOS 전용 AWS CLI V2 설치 파일](https://awscli.amazonaws.com/AWSCLIV2.pkg)

### Mac OS

```shell
# aws 실행 파일 위치 확인
which aws
/usr/local/bin/aws

# aws 설치 버전 확인
aws --version
aws-cli/2.17.56 Python/3.12.6 Darwin/23.6.0 source/x86_64
```

which <command> 명령어는 특정 명령어의 실행 파일이 위치하는 경로를 확인하는데 사용한다.  
which python 입력 시 python `실행 파일 경로의 위치`를 알려준다.

### Linux

- [[AWS] AWS CLI Linux 설치 방법](https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/getting-started-install.html#cliv2-linux-install)

```shell
# Linux x86 (64-bit)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Linux ARM
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Terraform 설치

> ✅ Terraform 설치 방법 정리

- Terraform은 `Infrastructure as Code`를 구현할 수 있는 대표적으로 `오픈소스 툴`
- `최신 테라폼 버전`을 `다운` 받는 것을 `권장`

### URL로 특정 버전 설치

```shell
# tap
# - 새로운 소스 저장소 추가할 때 사용 
# - homebrew는 기본적으로 메인 공식 저장소에서 S/W 패키지를 설치
# - tap 사용시 비공식 패키지 설치도 가능(조직에서 사용하는 패키지)
# 
# 하지만 tap 명령어를 사용하여 추가적인 저장소(hashicorp/tap)를 지정하면 메인 저장소에 없는 패키지 설치 가능.  
# 아래 명령어는 Hashicorp에서 제공하는 S/W 패키지들을 HomeBrew에 추가하는 작업이다.
brew tap hashicorp/tap
```

```shell
# 추가된 hashicorp/tap 저장소에서 terraform 패키지를 설치한ㄷ 
brew install hashicorp/tap/terraform
```

> Mac OS쓰는 경우 brew로 설치

- 최신 버전 테라폼 설치 URL : [https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)
- 이전 버전 테라폼 설치 URL : [https://releases.hashicorp.com/terraform/](https://releases.hashicorp.com/terraform/)

이번에는 Terraform 이전 버전을 AWS EC2에 설치하여 실습을 진행한다.  
`Terraform`은 [Hashicorp](https://www.hashicorp.com)에서 제공이 되는 오픈소스로, 툴들은 대부분 `Go 언어`를 기반으로 만들어졌다.  
Go 언어 기반으로 만들어졌기에 실행 파일 1개만 생기게 된다.

```shell
# wget을 통해 terraform 설치
[ec2-user@ip-172-xx-xx-xx ~]$ wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
--2024-09-25 03:39:57--  https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
Resolving releases.hashicorp.com (releases.hashicorp.com)... 54.230.61.31, 54.230.61.88, 54.230.61.113, ...
Connecting to releases.hashicorp.com (releases.hashicorp.com)|54.230.61.31|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 28424050 (27M) [application/zip]
Saving to: ‘terraform_0.12.29_linux_amd64.zip’

terraform_0.12.29_linux_amd64.zip  100%[===============================================================>]  27.11M  15.1MB/s    in 1.8s

2024-09-25 03:40:00 (15.1 MB/s) - ‘terraform_0.12.29_linux_amd64.zip’ saved [28424050/28424050]
```

```shell
# 압축 해제
unzip terraform_0.12.29_linux_amd64.zip
```

```shell
# 압축 파일 삭제
rm terraform_0.12.29_linux_amd64.zip
```

```shell
echo $PATH
/home/ec2-user/.local/bin:/home/ec2-user/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
```

```shell
# 시스템 전역에서 사용하기 위해 /usr/local/bin 경로로 이동
sudo mv terraform /usr/local/bin
```

```shell
# terraform 버전 확인
terraform --version
Terraform v0.12.29

Your version of Terraform is out of date! The latest version
is 1.9.5. You can update by downloading from https://www.terraform.io/downloads.html
```

## 99. 참고 자료

- [[Terraform] AWS CLI 및 Terraform 설치](https://terraform101.inflearn.devopsart.dev/preparation/install-terraform-aws)