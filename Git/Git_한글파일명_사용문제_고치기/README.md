# 01. git 한글 문제

- 지금까지 git을 숱하게 사용했지만 `한글 파일명은 문제가 생긴다는 사실`을 알아야 한다
- 한글 파일명에 문제가 생기는 경우 아래와 같은 명령어를 통해 해소가 필요하다

```bash
git config --global core.quotepath false
```

- 다음처럼 `core.quotepath`를 끄면 `commit`, `status` 등에서 한글 출력이 정상으로 돌아온다.
- 이 설정은 일반적이지 않은 문자를 탈출문자로 처리하는 기능을 수행한다. 그래서 한글 앞에 탈출 문자를 붙인 탓에 이런 문제가 발생했다.

# 99. 참고 자료

- [[Git] git 한글 파일명 사용 문제 고치기 core.quotepath](https://edykim.com/ko/post/git-fix-problem-using-filename-core.quotepath/)