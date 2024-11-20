# 프로메테우스 지표 rate, increase 차이 간략히 정리

시간당 데이터 처리량을 추출하기 위해서는 `rate`, `increase`가 사용이 된다.  

## rate

```shell
rate(http_server_requests_seconds_count[1m]) 1
```

> rate() 연산은 '지정한 시간 범위 내에' 메트릭이 '변화한 정도'를 보기 위한 연산  

rate()는 range vector의 처음 - 끝 샘플을 사용하여 `'초당 평균 증가율[변화율]'`을 계산한다.  
t1과 t2 사이의 `'초당 평균 증가율[변화율]'`은 아래와 같은 계산 수식을 사용한다.

예를 들어 1분 동안의 rate를 계산한다고 가정하자. 데이터는 15초마다 수집중이고, 값은 [10, 20, 50, 80]이다.  
rate는 첫 샘플인 10과 마지막 샘플인 80을 통해 계산한다. 

> (sample(t2) - sample(t1) / (t2 - t1))  
> (80 - 10) / (60초 - 0초 -> 시간 경과량)

- `범위 시간당 초당 호출량` or `초당 평균 증가율[변화율]`
- rate는 특정 범위 내의 초당 호출량을 판단
- 1분동안 60번 호출이되면 `1 노출`됨~

## increase

```shell
increase(http_server_requests_seconds_count[1m])
```

- `범위 시간당 증가율`
- increase는 특정 범위 내의 총 변화량을 판단
- 1분동안 60번 호출이되면 `60 노출`됨

## 99. 참고 자료

- [프로메테우스 지표 rate와 increase의 차이점](https://blog.voidmainvoid.net/449)
- [Prometheus rate() 연산의 실행 원리](https://velog.io/@skynet/Prometheus-rate-%EC%97%B0%EC%82%B0%EC%9D%98-%EC%8B%A4%ED%96%89-%EC%9B%90%EB%A6%AC)
