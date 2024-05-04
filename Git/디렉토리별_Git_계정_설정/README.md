# 01. 서론

- **git**을 사용하는 도중 **git config 설정이 되어있지 않아서** 개인 Git 계정과, 회사 계정이 구분이 되지 않는 상황이 발생 하였다
- 계정을 구분하지 않으면 하나의 계정으로 모든 Git을 제어해야 하는데, 이렇게 되면 회사 Git 계정은 Credential로 인해 권한이 거부 되는 경우가 존재하였다

## 02. 로컬 데스크탑에서 gitconfig 파일 위치 확인

```shell
# git 설정 확인
vi .gitconfig

# 위치를 모르면 아래 명령어 입력
git config --list --show-origin
```

- **.gitconfig** 파일을 열어서 수정해주면 된다. 만약 위치를 알지 못하면 아래 명령어를 입력하면 된다
- **.gitconfig** 파일을 열어보면 아래와 같이 **전역**으로 선언된 **git 설정**을 확인 할 수 있다

```shell
# vi .gitconfig
[user]
  name = ym1085
  email = youngmin1085@gmail.com
  [credential "https://git-dev.xxx.co.kr"]
  provider = generic
[alias]
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
  s = status -s
  co = checkout
  ci = commit
  br = branch
[core]
  quotepath = false
  autocrlf = input
```

- gitconfig 설정파일 상태

```shell
[user]
  email=user@email.com
  name=username
```

- 우선 .gitconfig 파일에서 위 내용은 전부 지워버리고, 아래 내용을 추가한다

```shell
# ~/Users/youngminkim/projects/workspace-personal 밑에 폴더는 .gitconfig-personal 이 설정된다
[includeIf "gitdir:~/Users/youngminkim/projects/workspace-personal"]
  path = .gitconfig-personal

# ~/Users/youngminkim/projects/workspace-company 밑에 폴더는 .gitconfig-professional 이 설정된다
[includeIf "gitdir:~/Users/youngminkim/projects/workspace-company"]
  path = .gitconfig-company
```

- .gitconfig 파일 안에 위와 같이 includeIf를 사용  
  - **includeIf를 사용하면 특정 디렉토리 하위 경로에 있는 git 계정(email, username) 설정이 가능해진다**
- 기준 디렉토리와 어떤 git 설정을 먹일건지 확인하는 부분

## 03. .gitconfig-personal

```shell
[user]
  email = youngmin1085@gmail.com # note we use the noreply github mail
  name = ym1085
```

## 04. .gitconfig-professional

```shell
[user]
  email = ymkim1085@company.com
  name = ymkim1085
```

> 위와 같이 설정 해주면 각 폴더 안에 있는 프로젝트 내에서 커밋(commit)을 하면 계정이 구분될 것이다.

## 99. 참고 자료

- [uzihoon.com](https://uzihoon.com/post/08d0e600-eaf4-11eb-8358-cfe0370fea45)