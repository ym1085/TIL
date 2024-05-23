# 01. ES 클러스터 운영 중 노드 순차적 재시작(Rolling Restart)

> 상용 ES를 운연하던 도중 데이터 노드의 CPU가 90%를 넘겨서 재기동을 진행해야 했다  
> 또한 Thread 상태를 확인해본 결과 rejected 된 결과가 1,414,844개가 쌓여 있었다  
> 
> ❌ 하지만 데이터 노드를 그냥 재기동해버리면 해당 노드의 데이터에 문제가 발생할 수 있다  
> 이러한 이유로 인해 서비스를 운영하는 도중에 데이터 노드를 재기동 하는 방법에 대해 기재한다

## 01-1. 이슈 내용 확인

```
특정 data node(2대)의 CPU가 3분간 98% 유지
```

```shell
# 현재 ES thread_pool에서 rejected 된 thread 상태 및 원인 내용 확인
GET _cat/thread_pool?v&s=rejected:desc

node_name name                active queue rejected
es-za-dxx search                  13     0  1414844
es-za-dxx search                   9     0  1190554
es-za-ixx search                   0     0  1060483
es-za-dxx search                  11     0    75173
es-za-dxx search                  11     0    56111
es-zb-dxx search                   9     0    48202
```

- 현재 Kibana 상에서 _thread_pool 명령어를 통해 확인한 결과
- 검색이 밀리면서 search(검색) Thread가 reject되는 현상이 발생
  - 물론 Grafana 상에서 검색도 밀리기 시작
  - Slack 알람, Cloudwatch 알람 등등... 계속해서 메시지가 발송됨
- 이러한 이슈로 인해 문제가 되고 있는 data node를 순차적으로 재기동 해야 했다
- 하지만 data node를 특정 작업 없이 그대로 재기동 하면 문제가 커진다
  - 샤드 할당(Shard Allocation) 발생 -> 데이터 노드이기에 다른 노드로 데이터 옮기기 시작하면 시간이 오래 걸리는 현상 발생
  - 빨리 해소가 되어야 하는데 시간이 오래 걸리면 서비스 장애로 이어짐

## 01-2. 왜 문제가 커지는가?

> https://mondayus.tistory.com/54  
> 샤드 할당을 막지 않으면 오버헤드 + 데이터 노드가 샤딩하면서 드는 시간도 오래 걸릴 것이다..

ES 입장에서 클러스터에 속한 `노드 중 1대가 정지`되면 `해당 노드`의 `Primary Shard` or `replica 샤드`를  
다른 노드로 옮기는 `샤드 할당`(`Shard Allocation`)이 발생한다. 이는 클러스터의 특정노드가 장애 상황인 경우  
이 부분에 대한 Fail Over가 동작하는 과정이다. 하지만 `순차적 재시작`에서는 이러한 부분이 오히려  
오버헤드(overhead)를 발생시키는 원인이 될 수 있기에 반드시 재시작 전에는 클러스터의 샤드 할당 기능을 꺼서  
샤드 할당(Shard Allocation)이 발생하는것을 막아야 한다.

## 01-2. Rolling Restart(순차적 재시작) 사용 이유

> Rolling Restart는 서비스 가용성을 최대한 유지하면서 업그레이드, 재시작, 설정 변경을 가능하게 한다  
> ES의 경우 대부분 Real Time(실시간) 서비스로 사용이 되는 경우가 빈번하기에 순차적 재시작은 피할수없는 부분이다

- 검색 서비스 중단 없이 H/W 교체, Elasticsearch 업그레이드 작업 위해 사용
- 이슈가 생긴 경우 해당 노드를 재기동 하기 위해 사용

### rebalancing 기능 disable?

> https://4orty.tistory.com/3

- `rebalancing` 이란 `노드 추가/삭제` 된 경우 `클러스터`를 `균형`있게 `유지`하기 위한 기능
- `rebalancing`의 `단점`은 `노드`가 `삭제`되면 `restart 때문인지 아니면 장애` 때문이지 ES는 모름
- 따라서 운영자는 restart 작업인걸 ES에게 알려줘야 함

> 운영자가 restart 작업인걸 ES에게 어떻게 알려주어야 하는가?  
> 그렇다면 이제 샤드 할당 중지 기능 적용 후 순차적 재기동 작업을 진행해보고  
> ES에 커멘드를 요청하여 restart임을 알리자

## 01-3. 클러스터 상태 확인

> 특정 노드를 재기동하기 위한 순서는 다음과 같다. 필자는 Data node를 재기동할 때 다음과 같은 방식을 사용하였으며  
> 반드시 해당 명령어를 키바나에서 치기 전에 신중히 설정 등을 고려하고 진행하는 것을 권장한다. (검색 엔진 한번 떨어짐)

```shell
# 실행
GET _cluster/settings

# 결과
{
  "persistent" : {
    "xpack" : {
      "monitoring" : {
        "collection" : {
          "enabled" : "true"
        }
      }
    }
  },
  "transient" : { }
}
```

- 우선 위 명령어를 통해 해당 클러스터의 settings 값을 확인한다
- 현재 샤드 할당 기능 관련하여 settings 값에 어떠한 설정도 존재하지 않는다

## 01-4. 샤드 할당 기능 중지

> persistent, transient update 방식 존재  
> transient > persistent, elasticsearch.yml 순서

```json
// 필자는 persistent 명령어를 사용하였다
// persistent는 영구 적용 옵션이다
// none 옵션 주면 클러스터 상태 -> red -> 필자는 괜찮았음
// primary 옵션 주면 클러스터 상태 -> yellow
PUT /_cluster/settings
{
    "persistent" : {
        "cluster.routing.allocation.enable" : "none"
    }
}

// 특정 블로그에서는 아래 명령어도 제안을 한다
PUT /_cluster/settings
{
    "transient" : {
        "cluster.routing.allocation.enable" : "none"
    }
}
```

- `transient`는 클러스터 `재시작` 시 `reset`
- `persistent`는 `영구적`으로 적용이 된다
- 데이터 노드가 아니면 데이터 할당(sharding) 안하기에 위 명령어 필요없음
- kibana에서 1번째 명령어를 요청해보자, 후에 바로 _flush/synced 명령어 실행해야 한다

## 01-5. 프라이머리 샤드 리플리카 샤드 데이터 동기화

```json
// 실제 명령어
POST _flush/synced

//curl -XPOST 'localhost:9200/_flush/synced?pretty'
```

> node 재시작 후에 샤드 데이터를 다시 색인할 필요가 없음을 sync_id로 빠르게 확인하기 때문에 복구 시간이 단축됨

- 엘라스틱서치에서 `데이터의 안정성`을 높히고 `복구 시간 단축`을 위해 사용
- 해당 명령은 `동기화된 플러시`(`synced flush`)를 수행
- <u>Synced flush 수행`하면 `flush 수행 후` 존재하는 `모든 샤드`마다 `유니크한 sync-id 발급</u>
- <u>Primary shard, replica shard 데이터 동기화</u>
- 8버전부터는 삭제됨

## 01-6. ES 재기동 진행

```shell
# ES pid 기반 프로세스 kill
kill -9 <pid>
```

```shell
# es 백그라운드 실행
./bin/elasticsearch -d
```

```shell
es 재기동 후에는 반드시 kibana 내에서 해당 node가 클러스터에 합류했는지 확인해야함
```

## 01-7. 클러스터 셋팅 및 헬스 체크

```json
GET _cluster/settings
GET _cluster/health
```

- 변경 된 클러스터 셋팅 및 헬스 체크 확인

## 01-8. 

```json
PUT _cluster/settings
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
```

- 샤드 할당 기능 옵션을 다시 null(기본 값)로 셋팅
- `null`은 실제 `all` 옵션과 동일하다
  - `all`: 모든 샤드 할당 활성화
  - `primaries`: 기본(primary) 샤드 할당만 활성화
  - `new_primaries`: 새로 생성된 인덱스의 기본(primary) 샤드 할당만 활성화
  - `none`: **모든 샤드 할당 비활성화**

## 99. 참고 자료

- [ElasticStack 노드 재시작](https://m.blog.naver.com/fbfbf1/223157598088)
- [운영 중인 엘라스틱서치 순차적 재시작 ( Rolling-Restart )](https://mondayus.tistory.com/54)
- [엘라스틱서치(ES) 클러스터 재시작 혹은 업그레이드 Tip](https://www.popit.kr/%EC%97%98%EB%9D%BC%EC%8A%A4%ED%8B%B1%EC%84%9C%EC%B9%98es-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EC%9E%AC%EC%8B%9C%EC%9E%91-%ED%98%B9%EC%9D%80-%EC%97%85%EA%B7%B8%EB%A0%88%EC%9D%B4%EB%93%9C-tip/)
- [엘라스틱서치 Cluster update settings API 에서 사용 불가능 한 경우](https://bistros.tistory.com/167)