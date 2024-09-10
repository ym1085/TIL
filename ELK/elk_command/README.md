# Elasticsearch 자주 사용하는 명령어 정리

## 특정 일자 기준 CPU 평균 혹은 최대값 확인

```json
GET .monitoring-es-*/_search
{
  "query": {
    "bool": {
      "filter": [
        {
          "range": {
            "timestamp": {
              "gte": "now-7d/d",
              "lte": "now/d"
            }
          }
        },
        {
          "term": {
            "type": "node_stats"
          }
        },
        {
          "term": {
            "source_node.name": "노드명"
          }
        }
      ]
    }
  },
  "aggs": {
    "max_cpu": {
      "max": {
        "field": "node_stats.process.cpu.percent"
      }
    }
  },
  "_source": false,
  "size": 0
}
```