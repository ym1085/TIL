# 01. ES 운영중인 Live 서비스의 alias 교체 방법

> 실제 Live 서비스 중에 핵심 메타인 인덱스의 alias를 변경해야 하는 순간이 왔다  
> 상용 Live 서비스이기에 상당히 부담감이 심했지만, 어떻게든 alias를 교체해야 했다  
> 이번에는 alias를 near real time으로 변경한 방법에 대해 기재한다

## 01-1. alias 변경 필요 이유

- 기존 메타 인덱스(alias-xxx-meta)의 경우 `shard 개수`가 `6개` `replica 개수`가 `1개`로 지정되 있었다
- 하지만 서비스 이슈로 인하여 데이터 노드를 6개 -> 18개로 증설하는 작업이 있었다
- 여기서 보면 shard가 6개인데 replica가 1개이면
  - 6(shard) * (1(replica) + 1) = 12개의 샤드 생성
  - 18(데이터 노드 개수) / 12개 샤드 -> 적절히 분배가 안됨
- 그래서 9(shard) * (1(replica) + 1) = 18개의 샤드 생성
  - 18(데이터 노드 개수) / 18 = 1
  - 각 노드에 적절히 배분이 되도록 shard 개수를 조정하였다
- 하지만 알다시피 `shard의 개수`는 `인덱스 생성 후` `수정`이 `불가능`하다
- 수정하려면 `신규 인덱스를 만들어서` 해당 인덱스를 `수정된 템플릿에 적용`해야 된다

## 01-2. 신규 인덱스 생성 + 수정된 템플릿 적용

- 신규 인덱스도 만들었고, 수정된 템플릿에 잘 적용도 되었다
- 하지만 갑자기 서비스 이슈가 발생하여 롤백을 진행
- 현재 box_type change(어제자 인덱스를 -> 오늘자 인덱스로 alias change) 작업이 수동으로 필요한 상황
- alias change를 바로 할 수 있는 방법은 아래와 같다
- 아래 명령어 사용하면 현재 적용된 alias는 remove(제거)하고 add(추가)도 바로 가능하다
- 실 서비스에서 적용 해보았는데 Grafana, Cloudwatch 등 모니터링에 발생한 에러도 없었다(다행)
  - 하지만 해당 명령어 치기 전에 STG, DEV에서 1번은 테스트 진행하고 하는걸 권장한다

```shell
# 2024-05-22로 alias 설정
POST /_aliases
{
  "actions": [
    {
      "remove": {
        "index": "xxx-meta.2024-05-21",
        "alias": "alias-xxx-meta"
      }
    },
    {
      "add": {
        "index": "xxx-meta.2024-05-22",
        "alias": "alias-xxx-meta"
      }
    }
  ]
}

# 2024-05-21로 alias 원복
POST /_aliases
{
  "actions": [
    {
      "remove": {
        "index": "xxx-meta.2024-05-21",
        "alias": "alias-xxx-meta"
      }
    },
    {
      "add": {
        "index": "xxx-meta.2024-05-22",
        "alias": "alias-xxx-meta"
      }
    }
  ]
}
```

## 01-3. ES 노드 뻗는 경우 아래 명령어 사용

> ES 노드 뻗어버리면 Kibana도 맛이 간다, 그렇기에 서버상에 직접 들어가서 curl로 확인해야 한다  
> ChatGPT한테 물어보면 알려주겠지만 혹시 급한 경우 사용

```shell
# reject count 확인
GET _cat/thread_pool?v&s=rejected:desc

# 클러스터의 샤드 할당 상태 설명 요청
curl -X GET "http://172.21.70.xx:9200/_cluster/allocation/explain?pretty"

# 노드의 운영 체제 통계 확인
curl -X GET "http://172.21.70.xx:9200/_nodes/stats/os?pretty"

# 클러스터의 모든 별칭(alias) 확인
curl -X GET "localhost:9200/_cat/aliases?v"

# 클러스터의 샤드 할당 정보 확인
curl -X GET "localhost:9200/_cat/allocation?v"

# 클러스터의 블록 정보 확인
curl -X GET "localhost:9200/_cat/blocks?v"

# 클러스터의 스냅샷 저장소(repository) 정보 확인
curl -X GET "localhost:9200/_cat/repositories?v"

# 클러스터의 상태(health) 확인
curl -X GET "localhost:9200/_cat/health?v"

# 클러스터의 인덱스 정보 확인
curl -X GET "localhost:9200/_cat/indices?v"

# 현재 클러스터의 마스터 노드 정보 확인
curl -X GET "localhost:9200/_cat/master?v"

# 클러스터의 샤드 복구 상태 확인
curl -X GET "localhost:9200/_cat/recovery?v"

# 클러스터의 샤드 정보 확인
curl -X GET "localhost:9200/_cat/shards?v"

# 클러스터의 세그먼트 정보 확인
curl -X GET "localhost:9200/_cat/segments?v"

# 현재 실행 중인 태스크 목록 확인
curl -X GET "localhost:9200/_cat/tasks?v"

# 클러스터의 템플릿 정보 확인
curl -X GET "localhost:9200/_cat/templates?v"

# 클러스터의 쓰레드 풀(thread pool) 정보 확인
curl -X GET "localhost:9200/_cat/thread_pool?v"

# 필드 데이터(field data) 메모리 사용 정보 확인
curl -X GET "localhost:9200/_cat/fielddata?v"

# 쿼리 캐시(query cache) 정보 확인
curl -X GET "localhost:9200/_cat/query_cache?v"

# 인덱스의 세그먼트 상태 확인 (중복 제거됨)
curl -X GET "localhost:9200/_cat/segments?v"

# 클러스터의 노드 및 디스크 사용량 확인
curl -X GET "localhost:9200/_cat/nodes?v&h=name,disk.used_percent"

# 노드의 트랜잭션 로그 상태 확인
curl -X GET "localhost:9200/_cat/translog?v"

# 설치된 플러그인 목록 확인
curl -X GET "localhost:9200/_cat/plugins?v"

# 노드의 힙 메모리 및 RAM 사용량 확인
curl -X GET "localhost:9200/_cat/nodes?v&h=name,heap.percent,ram.percent,ram.max"

# 클러스터의 스냅샷 정보 확인
curl -X GET "localhost:9200/_cat/snapshots?v"

# 특정 별칭(alias)의 메타 정보 확인
curl -X GET "localhost:9200/_cat/aliases/alias-xxx-meta?v"

# 클러스터의 상태(health) 확인 (중복 제거됨)
curl -X GET "localhost:9200/_cluster/health?pretty"

# 노드 정보 확인 (중복 제거됨)
curl -X GET "localhost:9200/_cat/nodes?v"

# 현재 클러스터의 상태 요약 확인
curl -X GET "localhost:9200/_cat"

# CPU 사용량 기준으로 정렬된 노드 정보 확인
curl -X GET "localhost:9200/_cat/nodes?v&s=cpu:desc"
```
