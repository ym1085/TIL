# 01. gitignore 작동 안함

```bash
git rm -r --cached .

git add .

git commit -m "fixed untracked files"
```

- .gitignore가 작동하지 않아서, **ignore한 파일이 자꾸 changes에 나오는 경우 존재**
- 위 부분은 git의 캐시 문제가 있는거라서 **캐시 내용 전부 삭제 필요**
- 캐시 내용 전부 삭제 했으면 **add All** 해서 커밋

# 02. Untracked 파일 삭제

```bash
 rm <파일명>

rm -rf <디렉토리명>
```

- 기본적으로 Linux 서버에서 사용하는 것과 동일하게 **rm** 으로 삭제하면 됨

# 03. Tracked 파일 삭제(git rm)

## 03-1. 로컬 디렉토리와 git 저장소에서 모두 삭제

```bash
git rm sample.txt

git commit -m "Delete sample.txt"
```

- git rm 명령어 사용하면 **로컬 디렉토리**, **git 저장소** 모두에서 파일 삭제 가능

## 03-2. 로컬 디렉토리는 삭제하지 않고 git 저장소에서만 삭제

```bash
git rm -r --cached sample.txt

git commit -m "Delete sample.txt"
```

- 가끔 git add . 사용하다 보면 커밋하지 말아야 하는 파일들을 커밋하는 경우 발생
- 이런 경우 git rm —cached <filename> 사용하여 로컬 디렉토리는 유지하고, 깃 저장소에서만 삭제 가능

# 99. 참고 자료

- [.gitignore가 작동하지 않을때 대처법](https://jojoldu.tistory.com/307)
- [05: 파일 삭제하기(git rm)](https://seonkyukim.github.io/git-tutorial/git-rm/)