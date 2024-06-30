# 01. Elastciearch 클러터에서 특정 Node 제외 시키기

> 상용 클러스터 상에서 18대로 운영중인 데이터 노드의 개수를 12대로 줄여야 하는 작업이 필요했다.  
> 하여 해당 노드가 구동되고 있는 서버 상에서 kill -9 {PID}를 통해 프로세를 중지하여도 되지만,  
> 이렇게 되면 클러스터 상태가 Yellow가 되는 것은 물론이며 데이터 손실을 가지고 올 수 있다고 한다.  
> 하여 이번 시간에는 클러스터의 Green 상태를 유지하면서 특정 노드를 클러스터 상에서 제외시키는 방법에 대해 알아보자.

## 01-1. 클러스터 상에서 노드 제외

```shell
# 특정 IP를 가진 노드들을 샤드 재배치 대상에서 제외
PUT /_cluster/settings
{
  "transient": {
    "cluster.routing.allocation.exclude._ip": "172.21.50.xxx, 172.21.60.xxx, 172.21.70.xxx
  }
} 
```

위 명령어를 수행하면 `해당 IP를 가진 노드`에 `샤드가 할당되지 않게 된다`.  
위 설정이 적용되면 클러스터는 현재 할당된 샤드를 확인하고, 해당 IP를 가진 노드에 할당된 샤드를  
다른 노드로 재배치하기 시작한다. 이는 클러스터의 데이터 균형을 맞추기 위한 자동화된 과정이다.

```shell
# 현재 상용 데이터 노드의 개수는 18대다. 여기서 12대로 데이터 노드를 축소할것이다.
# 위 명령어를 치면 아래와 같은 그림으로 샤드 분배가 발생한다.
elastic-data-01
elastic-data-02
elastic-data-03
elastic-data-04
elastic-data-05
elastic-data-06
elastic-data-07
elastic-data-08
elastic-data-09
elastic-data-10
elastic-data-11
elastic-data-12
elastic-data-13 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
elastic-data-14 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
elastic-data-15 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
elastic-data-16 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
elastic-data-17 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
elastic-data-18 --> exclude --> shard 분배 --> 해당 node의 shard 개수 0개가 되어야 함
```

위 작업이 완료되면 제외가 되어야 하는 노드의 shard 개수가 0개가 되어야 한다.  
또한 필자는 13 - 18번 노드를 제외시키는 작업을 했기 때문에 해당 노드들의 shard 개수가 0이 될 것이다.  
다음으로 샤드 분배가 완료 되었으면 데이터 노드가 구동중인 서버에 접근하여 해당 프로세스를 `kill` 해야 한다.  
이어서 진행 해보자.

## 01-2. AWS 상의 EC2 서버(13 - 18번 서버) 접속

```shell
# 클러스터 상태 체크를 통해 unussigned 된 shard가 없는지 확인 먼저 진행
GET _cluster/health

# 위 명령어를 통해 나온 결과
{
  "cluster_name" : "xxx-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 20,
  "number_of_data_nodes" : 12,
  "active_primary_shards" : 89,
  "active_shards" : 184,
  "relocating_shards" : 0, # relocating shards도 0개인지 확인
  "initializing_shards" : 0,
  "unassigned_shards" : 0, # unassigned shards이 0개인지 확인
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```

우선 위에서 말했다시피 제외하고자 하는 노드 서버에 접속을 진행한다. 후에 해당 서버에 구동되고 있는 data node의 프로세스를 `kill` 한다.  
여기서 주의할 부분은 `반드시 제외하고자 하는 노드의 shard 개수가 0`개가 되었는지 확인하고 진행해야 한다.

> 이제 13번 서버부터 18번서버에 순차적으로 접근하여 작업을 진행해보자.  
> 13 ~ 18 번 데이터 노드에는 shard 개수가 0이라는 것을 가정하고 진행한다.

```shell
# AWS EC2 인스턴스 접속, 13 ~ 18번 순차적으로 접근 한다
- elastic-data-13 (첫번째 작업)
- elastic-data-14 (두번쨰 작업)
- elastic-data-15 (세번째 작업)
- elastic-data-16 (네번째 작업)
- elastic-data-17 (다섯번째 작업)
- elastic-data-18 (여섯번째 작업)
```

```shell
# 데이터 노드 프로세스 확인
ps -ef | grep elastic
```

```shell
# 해당 데이터 노드 프로세스 종료
kill -9 {pid}
```

```shell
# 샤드 분배 확인
GET /_cat/shards?v&pretty
```

> 위 작업을 13 - 18번 서버에서 순차적으로 진행한다. 후에 서버 상에 구동되어 있는 데이터 노드의 프로세스를 모두 kill(종료) 하였다면 이전 클러스터 설정으로 적용되어 있는 부분은 NULL로 셋팅해야 한다. 아래 명령어를 살펴보자.

```shell
# 클러스터 설정 초기화
# 해당 옵션을 통해 특정 노드 IP에 샤드 분배를 활성화 할 수 있도록 롤백 한다
PUT /_cluster/settings
{
  "transient": {
    "cluster.routing.allocation.exclude._ip": null
  }
}
```

위 명령어를 통해 이전 설정 값을 null로 셋팅한다. 이렇게 되면 데이터 노드 축소 작업은 모두 완료 되는 것이다. 위와 같은 프로세스로 진행하게 되면 클러스터의 상태를 Green로 유지하는 것은 물론이며 데이터 노드를 종료하므로써 발생하는 데이터 손실(유실)을 막을 수 있다.

## 99. 참고 자료

- [[Elasticsearch] 스케일 아웃](https://kkyunstory.tistory.com/114)
- [[ElasticSearch] 클러스터에서 node 제외하기](https://velog.io/@anjinwoong/ElasticSearch-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0%EC%97%90%EC%84%9C-node-%EC%A0%9C%EC%99%B8%ED%95%98%EA%B8%B0)