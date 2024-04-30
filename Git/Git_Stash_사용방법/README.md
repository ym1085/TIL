# 01. git stash

```bash
git checkout 
```

- 작업을 진행 도중 **커밋을 할 수 m없는 상태**일 때 주로 사용하는 명령어를 **git stash** 라고 한다
    - 대표적인 예로 브랜치 전환이 필요한 경우 사용 한다
- commit 이전의 작업 파일과 git add로 추가된 파일까지 모두 stash 영역으로 저장됨
- **새롭게 생성한 파일**(untracked file)은 **staged 상태**로 변경해야 **stash**가 가능해진다

```bash
# 작업한 파일의 상태를 staged 상태로 변경
git add <파일명>

# stash 보관소에 임시 저장
git stash

# add를 하기 귀찮다면 -u 옵션을 사용해 새로 생성한 파일도 같이 stash 할 수 있음
# git stash -u
```

# 02. git stash 기본 명령어

```bash
git stash
```

- git add 명령어를 통해 한번이라도 index 영역에 트래킹 된 파일을 기본 명칭으로 stash 영역에 저장

```bash
youngminkim ~/projects/workspace-personal/git-test feature/hello ± git status
On branch feature/hello
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt

no changes added to commit (use "git add" and/or "git commit -a")
 youngminkim ~/projects/workspace-personal/git-test feature/hello ± git stash            
Saved working directory and index state WIP on feature/hello: a94dff9 first commit
```

- 위와 같이 현재 수정된 파일 목록이 존재하고, 해당 파일을 stash 영역으로 임시 보관 하는 케이스가 존재

```bash
git stash -u
```

- 새롭게 추가된 파일(untracked file)도 stash 영역에 저장

```bash
youngminkim ~/projects/workspace-personal/git-test feature/hello git status
On branch feature/hello
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        b.txt

nothing added to commit but untracked files present (use "git add" to track)
 youngminkim ~/projects/workspace-personal/git-test feature/hello git stash 
No local changes to save
```

- 위 예시를 보면 현재 b.txt는 untracked 상태이며, **git stash** 명령어만 치면 **No local changes**라고 나온다
- 그렇다면 다음은 **git stash -u** 옵션을 사용하는 케이스를 보자

```bash
youngminkim ~/projects/workspace-personal/git-test feature/hello git status
On branch feature/hello
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        b.txt

nothing added to commit but untracked files present (use "git add" to track)
 youngminkim ~/projects/workspace-personal/git-test   feature/hello git stash -u 
Saved working directory and index state WIP on feature/hello: a94dff9 first commit
```

- 이전과는 다르게 -u 옵션을 붙히면 추적하지 않는 파일(untracked file)도 stash 영역에 바로 저장이 가능하다
- -u : **--include-untracked (추적하지 않는 파일도 stash에 저장)**

```bash
git stash save <stash name>
```

- stash 사용할 때 stash 이름을 지정하는 부분

```bash
git add .            
git stash save test-stash   
Saved working directory and index state On feature/hello: test-stash

git stash list

stash@{0}: On feature/hello: test-stash
stash@{1}: WIP on feature/hello: a94dff9 first commit
```

- git stash list를 통해 확인하면 위와 같이 test-stash로 지정이 되어 있는 부분이 확인 가능하다

```bash
git stash apply
```

- **가장 최근**에 저장한 stash를 **복원**한다
- 하지만 **pop**과는 다르게 복원된 stash를 **삭제**하지 않는다

```bash
git stash apply {$stashId}
```

- 특정 stash id 기반 복원

```bash
git stash drop
```

- **가장 최근**에 저장한 stash를 **삭제**한다

```bash
git stash drop {$stashId}
```

- 특정 stash id 기반 삭제

```bash
git stash clear
```

- 모든 stash **기록**을 **제거**한다
- 지금까지 임시로 보관한 stash 기록이 날아가기에 유의하여 사용 필요

```bash
git stash pop
```

- stash 복원 후 해당 stash는 바로 제거
- 필자는 실무에서 위 명령어를 주로 사용한다

# 99. 참고 자료

- [05. git stash](https://wikidocs.net/17169)