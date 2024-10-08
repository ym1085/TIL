# 01.  Tag란?

1. 커밋을 참조하기 쉽도록 알기 쉬운 이름을 붙히는 것
2. 저장소의 소스 버전을 간단히 표기 하기 위해 사용
3. 특정 커밋에 Tag를 붙혀 사용, HEAD commit에 붙히는 듯

# 02. **tag 조회하기**

현재 존재하는 tag를 조회할 때 사용하는 명령어 입니다. 태그는 문자 순서대로 정렬하여 보여주므로 버전형식을 잘 갖췄다면 오래된 버전이 가장 먼저 출력됩니다.

보통 저같은 경우는 v1.0.0-2021-11-11 형식으로 버전과 날짜를 같이 기입하는 방식으로 Tag 명을 입력합니다.

```bash
git tag

```

- 검색 패턴을 사용해서 조회도 가능
- v1. 대 영역을 보고 싶다면 아래와 같이 태그를 조회합니다

```bash
git tag -l v1.0.*
```

# 03. **tag 생성하기**

- tag 에는 두가지 종류가 있습니다.
  - 일반 태그 (Lightweight Tag) : 단순 버전같은 태그 이름만을 남기는 태그
  - 주석 태그 ( Annotated Tag) : 만든 사람의 이름, 이메일, 태깅 날짜, 태그 메시지 까지 저장하며, GPG(GNU Privacy Guard) 로 서명까지 가능.

### Lightweight 태그 생성하기

```bash
git tag v1.0.0-2021-11-11

```

### Annotated 태그 생성하기

```bash
git tag -a v1.0.0-2021-11-11 -m "최소 생성 태그"
```

# 04. **tag 삭제하기**

- 저장된 Tag를 삭제할 수 도 있다
- -d 옵션을 이용해서, Tag 이름으로 삭제하는 명령어 입니다.

```bash
git tag -d v1.0.0-2021-11-11
```

# 05. **tag 원격 저장소 push**

- git push 만 이용한다고 해서 Tag 가 원격 저장소에 저장되지 않음
- 아래 명령어를 이용해서 원격 저장소에 Tag를 push 하면 됨

```bash
git push origin v1.0.0-2021-11-11
```

- 모든 태그를 push 하려면 아래와 같은 명령어 입력

```bash
git push origin --tags
```

# 99. 참고 자료

- [[Git] 6. Git 태그 생성 및 사용방법 - tag](https://holjjack.tistory.com/213)
