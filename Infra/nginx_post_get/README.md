# Nginx 서비스 중단 페이지 반환 POST/GET 허용

> Nginx의 서비스 중단 페이지 반환 시 대응 방안 기재

## nginx.conf

```shell
location / {
     default_type application/json; # 기본 반환 타입 지정
     root /etc/nginx;  # '/' -> '/etc/nginx' 경로 포워딩
     try_files /<서비스 중단 페이지 경로> =404; # <서비스 중단 페이지 경로> 파일이 있으면 반환, 없으면 404 응답

     # GET과 POST 외 요청은 거부
     limit_except GET POST {
          deny all;
     }

     # 405 에러 발생 시 200 OK로 응답하고 <서비스 중단 페이지 경로> 반환
     error_page 405 =200 /<서비스 중단 페이지 경로>;
}
```

Nginx는 기본적으로 정적 페이지를 반환할 때 `POST` 요청 처리는 허용하지 않는다.  
하지만 현재 서비스의 대다수 요청의 경우 POST로 요청을 보내고 있으며, APP(IOS/AOS) 서비스팀과 따로 얘기를 하지 않고,  
Nginx 자체에서 GET/POST에 따른 서비스 중단 페이지를 반환해야 한다.

위와 같이 Nginx HTTP Method 제한을 위해 `limit_except` 옵션을 사용하여 GET, POST만 허용하고 나머지는 `deny` 시킨다.  
또한 error_page 405 =200 /<서비스 중단 페이지 경로>; 를 통해 405 에러 발생 시,  
200 OK로 응답하고 <서비스 중단 페이지 경로> 반환하도록 설정한다.

## 99. 참고 자료

- [[Nginx] nginx 정적 페이지 POST 활성화 방법](https://12bme.tistory.com/569)
