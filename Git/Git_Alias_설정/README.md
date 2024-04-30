# 01. Git alias 지정

```bash
[user]
	name = ymkim
	email = ymkim1085@funin.camp
[credential "https://git-dev.ktmusic.co.kr"]
	provider = generic
[alias]
	lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
	s = status -s
	co = checkout
	ci = commit
	br = branch
[core]
	quotepath = false
```

- .gitconfig 파일을 위와 같이 수정 해준다
- 수정후에 해당 alias 사용 가능

```bash
git status -s
```

- M : 수정된 파일
- A : 새로운 파일
- D : 삭제 파일
- ?? : 추적 안하는 파일

# 99. 참고 자료

- [[Git] 편리한 git alias 설정하기](https://johngrib.github.io/wiki/git-alias/)