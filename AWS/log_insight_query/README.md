
# 01. AWS Log Insights에서 주로 사용하는 쿼리

> AWS Log Insight에서 사용한 쿼리 기재, 로그의 경우 cloudwatch에 저장되는 nginx 기반 추출

```shell
# status가 200이 아닌 로그 추출
fields status, @timestamp, @message, @logStream, @log
| filter status != "200"
| sort @timestamp desc
| limit 1000
```

```shell
# client_addr별 집계 쿼리
fields @timestamp, client_addr
| stats count() as count by client_addr
```

```shell
# 특정 URL 포함 여부에 따른 쿼리
fields @timestamp, @message, @logStream, @log
| filter @message like '/v2/'
| sort @timestamp desc
| limit 10000
```

```shell
# request_time 별 집계
fields @timestamp, client_addr
| filter request_uri like '/url'
| stats count() as count by request_time
| sort request_time desc
```

```shell
fields @timestamp, status, request_time, upstream_time, client_addr, @message
| filter status != 200 and status != 499
| filter 
    request_uri not like '/url/v1' and 
    request_uri not like '/url/v2' and 
    request_uri not like '/url/v3' and
    request_uri not like '/url/v4'
| sort @timestamp desc
```

```bash
# 특정 컨테이너의 메모리 확인을 위한 쿼리
stats max(MemoryUtilized) as mem, max(MemoryReserved) as memreserved by bin (2m) as period, TaskId, ContainerName
| sort period desc
| filter ContainerName like "xxxxx"
| filter TaskId = “0bbxxxxxxxxxxxxxxxxxxxxxxxx”
| sort @timestamp
```

```shell
# container별 cpu, mem 확인
fields @timestamp, @message
| filter Type="Container"
| filter @logStream like /FargateTelemetry/
| stats max(CpuReserved) as MaxCpuReserved, 
        max(MemoryReserved) as MaxMemoryReserved,
        avg(CpuUtilized) as AvgCpuUtilized, 
        ceil(avg(MemoryUtilized)) as AvgMemUtilized 
        by ContainerName, bin(1h) as TimePeriod
| sort TimePeriod desc, ContainerName asc
| limit 1000
```

```shell
# 특정 URL로 들어오는 요청에 대해서 1분 별 카운트 확인
fields @timestamp, request_uri, request_body
| filter request_uri like "/url/v1"
| stats count(*) by bin(1m)
| sort bin desc
| limit 1000
```

```shell
# body 파싱
fields request_body
| filter status == "499"
| parse @message "*request_body\":\"*" as pre_request_body, request_body
| sort @request_body desc
| limit 10
```

```shell
# 파싱해서 통계 추출
fields @timestamp
| filter domain like 'lb'
| parse request_body '"query":"*"' as query
| parse query_string 'q=*' as query_str
| stats count() as total_searches by coalesce(query, query_str) as search_keyword
| sort total_searches desc
| limit 10000
```

```shell
# user_id별 검색 카운트
fields @timestamp, @message
| filter domain like 'lb'
| parse request_body '"query":"*"' as search_query
| parse request_body '"user_id":*,' as user_id
| parse query_string 'q=*' as query_str
| stats count() as search_count by coalesce(search_query, query_str), user_id
| sort search_count desc
| limit 10000
```

```shell
# user_id별 검색 카운트 + 부가 필드까지 확인
fields @timestamp, @message
| filter domain like 'lb'
| filter http_user_agent not like 'PostmanRuntime'
| parse request_body '"query":"*"' as search_query
| parse request_body '"user_id":*,' as user_id
| parse query_string 'q=*' as query_str
| filter user_id != "" and user_id != " " and ispresent(user_id) and user_id != 0 # user_id 값이 공백인 경우 제외
| stats count() as search_count by coalesce(search_query, query_str), user_id, request_uri, http_user_agent
| sort search_count desc
| limit 10000
```

# 99. 참고 자료

- [클라우드 워치를 통한 프로세스 모니터링](https://tech.cloudmt.co.kr/2022/07/13/cloudwatch-process-monitoring/)
- [Sample queries - Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-examples.html)
