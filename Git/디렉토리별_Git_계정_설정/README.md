# 01. 서론

- 개인 / 회사 Git 계정을 구분하기 위함
- 구분하지 않으면 하나의 계정으로 모든 Git을 제어해야함

# 02. gitconfig 파일 위치 확인

```bash
git config --list --show-origin
```

- .gitconfig 파일을 열어보면 전역으로 선언된 git 설정 확인 가능

```bash
[user]
  email=user@email.com
  name=username
```

- 우선 위 내용은 전부 지우고, 아래 내용을 추가한다

```bash
# ~/home/code/personal/ 밑에 폴더는 .gitconfig-personal 설정을 먹인다
[includeIf "gitdir:~/code/personal/"]
	path = .gitconfig-personal

# ~/home/code/professional/ 밑에 폴더는 .gitconfig-professional 설정을 먹인다
[includeIf "gitdir:~/code/professional/"]
	path = .gitconfig-professional
```

- .gitconfig 파일 안에 위와 같이 includeIf를 사용
- 기준 디렉토리와 어떤 git 설정을 먹일건지 확인하는 부분

**.gitconfig-personal**

```bash
[user]
  	email = user.personal@users.noreply.github.com     # note we use the noreply github mail
  	name = personal_username
```

**.gitconfig-professional**

```bash
[user]
  	email = user.professional@dns.com
  	name = professional_username
```

# 99. 참고 자료

- [[Git] Directory별 계정 설정하기](https://uzihoon.com/post/08d0e600-eaf4-11eb-8358-cfe0370fea45)