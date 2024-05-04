# 01. Git alias 지정

```bash
# home 경로 이동
cd ~

# .gitconfig 파일 확인
vi .gitconfig
```

```bash
# .gitconfig 파일
[user]
	name = ymkim
	email = ymkim1085@xxx.com
[credential "https://git-xxx.xxx.co.kr"]
	provider = generic
[alias]
    parent = "!f() { branch=$(git rev-parse --abbrev-ref HEAD); git show-branch -a 2>/dev/null | grep '\\*' | grep -v \"$br    anch\" | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//'; }; f"
	lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
	s = status -s
	co = checkout
	ci = commit
	br = branch
[core]
	quotepath = false
```

- .gitconfig 파일의 `alias` 부분에 별칭으로 사용할 키워드를 추가해준다
- 수정후에 해당 alias 사용 가능

```bash
git status -s
```

- M : 수정된 파일
- A : 새로운 파일
- D : 삭제 파일
- ?? : 추적 안하는 파일

```bash
git lg
```

- git log 히스토리를 formatting 된 형식으로 보여준다

```bash
git parent
```

- 현재 위치한 HEAD 브랜치의 베이스 브랜치를 확인하는 alias
- dev(parent) > feature/AAA(child)
- 위 커멘드를 수행 시 dev 브랜치가 출력된다

## 99. 참고 자료

- [[Git] 편리한 git alias 설정하기](https://johngrib.github.io/wiki/git-alias/)
- [[Git] 부모 브랜치 조회](https://yamoe.tistory.com/720)