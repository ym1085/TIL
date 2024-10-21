# Docker commit, save, load 차이점 정리

## docker commit(docker container -> docker image)

```shell
# -a: author
# -m: message
# -c: commit시, Dockerfile 명령 지정 [CMD, ENV]
# -p: 컨테이너 일시 정지 후 commit
docker container commit [option] [contianer id] [image:tag]
```

> 컨테이너 내에서 작업 진행 중 현재 상태를 기억하기 위해 commit 사용  
> commit을 사용하면 해당 컨테이너를 기반으로 image 생성 가능

- `실행중인 컨테이너`의 `변경 사항`을 `저장` 후 `새로운 이미지 생성`
- `export`와 다른 부분은 `commit`은 `새로운 image 생성`
- `export/save` 모두 `image`를 `file`로 생성
- 새로운 이미지 생성하면서 `-c` 옵션을 통해 CMD, ENV 명령어 적용 가능

## docker save(docker image -> tar)

```shell
# 특정 이미지를 tar 파일로 export
# save는 image를 대상으로 file로 export
$ docker save -o export.tar ubuntu_test_image
```

> docker save를 사용하면 특정 image를 기반으로 .tar 파일 생성 가능  
> export와 다른 부분은 레이어 계층만 archive를 한다는 부분과 해당 tar 파일은 load를 통해 다시 image화 진행  
> 즉, image -> .tar 변환 시 사용

- Docker `image`를 `tar 파일`로 저장
  - ubuntu image를 export.tar 파일로 저장 가능
- `export`는 `컨테이너`를, `save`는 `이미지`를 `archive` 하는 차이점 존재
- `export`한 tar 파일은 `import`로, `save`로 생성한 파일은 `load`로 이미지화 필요
  - `export`, `save`는 `압축하는 파일 구조` 및 `디렉토리가 다름`
    - `export`: `컨테이너`의 `루트 파일 시스템 전체`가 들어가있음
    - `save`: `레이어 구조`까지 `포함`한 형태로 압축

## docker load(tar -> docker image)

```shell
# tar 파일 image로 변환
$ docker load -i <tar_파일명>
```

> .tar 파일 image 변환 시 사용

- save에 의해 tar로 만들어진 .tar 파일을 다시 이미지로 로드

## docker export(docker container -> tar)

```shell
# tar 파일로 생성
# 루트 디렉토리까지 모두 아카이빙
$ docker export -o <파일명.tar> <container_id>
```

- export는 image가 아닌 실행중인 container 대상 .tar 파일 저장 제공

## docker import(tar -> docker image)

```shell
# tar 파일 기반 docker image 생성
$ docker import <파일명.tar> <이미지명>
```

- export 커멘드를 기반으로 만든 .tar 파일을 docker image로 생성하는 명령어

## 99. 참고 자료

- [docker image를 tar 파일로 저장 (export / import / save / load)](https://www.leafcats.com/240)
- [docker 이미지 생성 (commit, export, import, save, load)](https://nomad-programmer.tistory.com/305)
- [docker import vs save vs commit](https://m.blog.naver.com/freepsw/220992475915)