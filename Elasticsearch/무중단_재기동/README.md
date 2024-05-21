# 빠른선곡 이슈

GET _cat/thread_pool?v&s=rejected:desc

### 샤드 할당 기능 중지

```json
PUT /_cluster/settings
{
    "persistent" : {
        "cluster.routing.allocation.enable" : "none"
    }
}
```

### node 재시작 후에 샤드 데이터를 다시 색인할 필요가 없음을 sync_id로 빠르게 확인하기 때문에 복구 시간이 단축됨

```json
POST _flush/synced
```

### 변경 된 클러스터 셋팅 확인

```json
GET _cluster/settings
```

### 클러스터 health 확인

```json
GET _cluster/health
```

### 샤드 할당 기능 활성화

### 01. 첫번째 방법

```json
PUT _cluster/settings
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
```

### 샤드 할당 기능 활성화 후에 클러스터 상태 확인 진행

```json
GET _cluster/settings
GET _cluster/health
```

<https://mondayus.tistory.com/54>
