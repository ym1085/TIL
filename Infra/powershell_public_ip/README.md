# Powershell 사내 공인 IP 주소 확인

```shell
(Invoke-WebRequest ifconfig.me/ip).Content.Trim()
```

- 위 명령어를 통해 내 공인 IP 확인 가능
- naver.com 에서 내 IP 입력을 통해 확인 가능

## 99. 참고 자료

- [윈도우 10 공인 주소 궁금하다면?](https://forbes.tistory.com/592)
