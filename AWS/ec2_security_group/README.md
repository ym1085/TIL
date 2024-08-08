# 01. EC2에 Attatched 된 보안 그룹 사용 시 사용하는 명령어

> EC2에 Attatched 된 보안그룹에 대해 사용하는지 확인해야 하는 이슈가 존재하여 아래 명령어 사용

## 특정 보안그룹을 사용하는 EC2 목록을 상세 확인하는 경우 사용

```shell
aws ec2 describe-instances --filters Name=instance.group-id,Values=sg-0xxxxxxxxx --no-cli-page
```

- 위 명령어 사용 시 해당 SG를 사용하는 EC2 상세 내용 확인 가능

## 특정 보안그룹을 사용하는 EC2 목록 이름만 확인하는 경우 사용

```shell
aws ec2 describe-instances --filters Name=instance.group-id,Values=sg-0xxxxxxxxx --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value' --output text
```

- 위 명령어 사용 시 해당 SG를 사용하는 EC2 이름 확인 가능