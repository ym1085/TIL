# 01. Elasticsearch 재색인?

> 기존 검색엔진을 운영하는 과정 중에 동의어 관련된 작업을 수행하기 위해 핵심 메타 템플릿을 수정해야 하는 경우가 발생하였다.  
> 하여 STG 환경에서 기존에 생성이 되어있는 2300만건 정도의 데이터를 Logstash + DB 프로시저를 사용하여 색인하는 방식 대신  
> reindex 명령어를 사용하여 데이터를 복사하는 과정을 적어보았다 😀

상용 서비스의 경우 현재 alias를 사용하고 있다. i-node에 신규 인덱스를 생성해서 인덱싱을 수행하고 후에 해당 인덱스의  
python 로직에서 routing.allocation.require.boxtype option을 index -> live로 변경한다.  
이 때 프라이머리 샤드의 인덱스가 sharding 되어 replica로 분배가 된다.

## 01-1. reindex?

- Elasticsearch에서는 보기보다 reindex를 수행해야 하는 경우가 존재함
    - 인덱스의 mapping, settings, 샤드 을 수정해야 하는 경우
        - 한번 생성이 된 mapping, settings는 변경이 너무 힘들다 😶
    - ES를 최신 버전으로 마이그레이션 해야하는 경우
    - index의 이름 변경이 필요할 때 → 이 경우 주로 alias 활용하지 않는 경우
    - 새로운 index명에 색인을 하는 경우도 존재하겠지만 데이터가 큰 경우 쉽지는 않음
- reindx
    - reindx란 말 그대로 인덱싱을 새로 한다는 의미
    - **reindex는 복사가 아니다**. 즉, reindex를 하려는 index의 mapping, settings 정보가 똑같이 복사되는 것은 아니다.
    - 즉, 데이터만 넣기 때문에 default mapping으로 인덱스가 생성이 될거고 mapping, settings의 경우 수정을 해주어야 한다
    - reindex의 경우 데이터가 많은 상용 환경에서는 작업 비용이 크기에 매핑 정보를 애초에 잘 설정해주는 것이 좋다

## 01-2. 템플릿 수정 예시

> 아래 예시는 타 블로그의 글에서 사용된 예시를 사용하였습니다

```json
// 변경 전의 wedul_mapping 템플릿
PUT wedul_mapping
{
  "mappings": {
    "_doc": {
      "dynamic": "false",
      "properties": {
        "id": {
          "type": "integer"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}
```

- 위 템플릿에서 name 필드의 keyword 복합 필드를 제거하고 age 라는 Integer 타입의 필드를 매핑하고자 한다

```json
// wedul_mapping_dump 라는 임시 템플릿을 생성한다
PUT wedul_mapping_dump
{
  "mappings": {
    "_doc": {
      "dynamic": "false",
      "properties": {
        "id": {
          "type": "integer"
        },
        "name": {
          "type": "text"
        },
        "age": {
          "type": "integer"
        }
      }
    }
  }
}
```

- name은 단일 text 타입 필드로, age는 Integer 타입의 필드로 선언한다

## 01-3. _reindex 수행

```json
// local 에서 가져오기
POST _reindex
{
	"source": {
		"index": "가져올 인덱스명"
	},
	"dest": {
		"index": "저장할 인덱스명"
	}
}
```

```json
// remote 에서 가져오기
// 아래 명령어는 실제로 해보지는 않았다
POST _reindex
{
    "source": {
        "remote": {
            "host": "http://remotehost:9200",
            "username": "user",
            "password": "pass"
        },
        "index": "old_index"
    },
    "dest": {
        "index": "new_index"
    }
}
```

```json
POST _reindex?wait_for_completion=false&slices=auto
{
  "source": {
    "index": "song-meta.2023-06-15",
    "size": 10000
  },
  "dest": {
    "index": "test-index"
  }
}
```

- wait_for_completion=false: **_reindex 작업**을 **비동기적**으로 수행
- slice=auto: **_reindex 작업**을 **병렬**로 실행하여 성능 향상을 위해 사용
- source: 복사를 수행할 대상 인덱스
- size: 인덱스에서 가져올 문서의 최대 수를 지정한다, 10,000 지정 시 한 번에 1만개씩만 가져와서 문서를 처리함
- desc: 색인될 대상 인덱스를 정의
- index: 재색인된 데이터가 저장될 새로운 인덱스 이름

# 99. 참고 자료

- [ElasticSearch 에서 reindex 을 활용하는 방법](https://findstar.pe.kr/2018/07/07/elasticsearch-reindex/)
- [Elasticsearch에서 reindex를 이용해서 매핑정보 변경하기](https://wedul.site/611)
- [Elasticsearch에서 Reindex 살펴보기](https://yookeun.github.io/elasticsearch/2018/12/28/elastic-reindex/)