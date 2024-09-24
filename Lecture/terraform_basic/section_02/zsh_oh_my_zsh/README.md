# ZSH 및 Oh-my-zsh 설치 및 활용

> 터미널 필수품 zsh & oh-my-zsh 설치 방법 정리

## ZSH 설치

- [zsh download](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [oh-my-zsh document](https://ohmyz.sh)

`zsh`란 `Z shell`의 `약자`로써, `기존 shell`의 `확장버전`이라 봐도 된다.  
이러한 `zsh`은 `다양한 테마`를 제공하는 것은 물론이며 추가적인 shell의 확장 기능도 제공한다.  
대표적으로 `Auto Completion`, `Auto Suggestion`, `Plugin` 등을 제공한다.

## Mac & Linux zsh 설치

> Mac or Linux에서 zsh를 설치하는 커멘드는 아래와 같음  
> AWS EC2 사용하면 기본 유저가 'ec2-user'

```shell
# Max
brew install zsh
```

```shell
# Linux zsh 설치
sudo yum install -y zsh
```

```shell
# 기본 쉘을 zsh로 변경
# chsh: change shell의 약자
chsh -s /bin/zsh
```

```shell
# oh-my-zsh 설치
# 이전에 git 설치해달라고 하면 git 설치해주면 됨
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

```shell
# 비밀번호 설정
sudo passwd ec2-user
New password:
Retype new password:
```

## 99. 참고 자료

- [[Terraform] ZSH 및 OH-MY-ZSH 설치](https://terraform101.inflearn.devopsart.dev/preparation/zsh/)