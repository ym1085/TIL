# 01. 인덱스와 샤드 - Index & Shards

## 01-1. 도큐먼트(document)?

```json
{
  "took" : 1,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 1,
      "relation" : "eq"
    },
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "seed-group",
        "_type" : "_doc",
        "_id" : "3W5esI0B0pf4oUDI6Ut2",
        "_score" : 1.0,
        "_source" : {
          "country" : [
            "국내음악",
            "국외음악"
          ],
		}
	]
}
```

- `Elasticsearch`에서 `단일 데이터 단위`를 `도큐먼트`(Document)라 한다
  - DB에서는 테이블 안에 여러개의 행이 존재한다
  - `ES와 비교 했을 때` `도큐먼트`는 `테이블에서의 1개의 행과 동일`하다 보면 된다
- 위와 같이 hits [ { ... } ] 안에 존재하는 1개의 { ... } 을 document라 보면 된다
- 또한 이러한 document를 모아둔 개념을 인덱스(index)라 지칭한다

## 01-2. 인덱스?

```bash
GET _cat/indicies?v
```

```bash
health status index                                                       uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   movie                                                       3zVFR2bvSNidXRnY1faNqw   1   1          0            0       566b           283b
green  open   radio-contents                                              O9oeXjT5S1mezzWjahXNjQ   1   3        320            0      1.8mb        466.6kb
```

- 해당 명령어 조회 시 위와 같은 결과가 출력이 된다
- movie, radio-contents는 각각 1개의 인덱스를 의미
- 이러한 인덱스는 샤드라는 단위로 분리가 된다
    - 이렇게 분리된 샤드는 각 노드에 분산되어 저장됨

## 01-3. 프라이머리 샤드(Primary Shart)와 복제본(Replica)

- 인덱스 생성 시 별도 설정 없으면 7.0 버전부터는 디폴트 1개 샤드 구성
- 인덱스 생성 시 별도 설정 없으면 6.x 버전 이하부터는 디폴트 5개 샤드 구성
- 클러스터에 노드 추가 시 각 샤드들이 각 노드들로 분산 저장됨
    - 디폴트로 1개의 복제본 생성
    - 처음 생성된 샤드 : 프라이머리(Primary) 샤드
    - 복제본 샤드 : 리플리카(Replica)
- 한 인덱스가 5개의 샤드로 구성, 클러스터가 4개의 노드로 구성
    - 샤드 5개 : 리플리카 5개
    - 총 10개의 샤드 생성
    - (샤드 개수(5) * (리플리카 개수(1) + 1) = 총 샤드 개수

> 노드가 1개만 있는 경우 프라이머리 샤드만 존재하고 리플리카는 생성되지 않음  
> Elasticsearch는 아무리 작은 클러스터여도 3개의 노드로 구성할 것을 권장

- 같은 샤드와 복제본은 동일한 데이터를 담고 있음
    - `반드시 서로 다른 노드에 저장이 됨`
- Node3이 떨어지는 경우 Node3에 있던 0번과 4번 샤드를 유실하게 됨
- 하지만 다른 노드들에 0, 4번 샤드가 남아있으므로 전체 데이터 유실없이 사용 가능
    - 처음에 클러스터는 먼저 유실된 노드가 복구 되기를 기다림
    - 타임아웃이 지나 노드가 복구되지 않는 경우 1개만 남은 0번, 4번 샤드들을 복제 시작
    - 샤드, 리플리카를 3대의 노드 서버에 다시 분배

> 프로이머리 샤드가 유실된 경우 새로 프라이머리 샤드가 생성되는건 아니다  
> 남아있던 복제본(Replica)이 먼저 프라이머리 샤드로 승격이 되고 다른 노드에서  
> 새로 복제본(Replica)를 생성한다

## 01-4. 샤드 개수 설정

```json
$ curl -XPUT "<http://localhost:9200/books>" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 5,
    "number_of_replicas": 1
  }
}'
```

- curl 명령어를 통해 REST API로 샤드가 5개, 복제본이 1개인 books 인덱스 생성

```json
$ curl -XPUT "<http://localhost:9200/books/_settings>" -H 'Content-Type: application/json' -d'
{
  "number_of_replicas": 0
}'
```

- books 인덱스의 복제본 개수를 0로 지정

# 99. 참고 자료

- [3.2 인덱스와 샤드 - Index & Shards](https://esbook.kimjmin.net/03-cluster/3.2-index-and-shards)