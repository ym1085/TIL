# 01. EC2 스토리지 재부팅 없이 늘리기

> ES의 데이터 노드의 DISK 용량을 늘리는 작업이 필요했다.  
> 또한 서비스 상태인 EC2의 DISK를 증설하는 것이기에 무중단으로 진행이 필요하였다.

## AWS EBS Console에서 볼륨 수정

1. AWS EC2 Console 접근
2. 스토리지 선택 후 볼륨 클릭
3. 해당 볼륨 선택 후 편집 클릭
4. EBS 수정할 용량 지정

## EC2 서버 접속 후 파티션 크기 조정

위에서 EBS의 볼륨 용량을 증설하였다고 가정하며, 현재 500GB -> 600GB로 증설한 상태다.  
이제 파티션 크기 조절이 필요한다. 아래 명령어를 통해 우선 `블록 장치를 확인`한다.

```shell
# 아래 부분은 예시일 뿐입니다
lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1 259:0    0  600G  0 disk 
└─nvme0n1p1
        259:1    0  500G  0 part /
....중략
```

아직은 파티션을 늘리지 않았기에, 500G인 부분 확인 가능.  
이제 다음 명령어를 통해 파티션을 늘려야 한다.

```shell
sudo growpart /dev/xvda 1
```

- growpart: 특정 파티션의 크기 증가를 위해 사용
- /dev/xvda: 대상 디스크 의미, EC2 인스턴스의 블록 디바이스 이름 중 하나
- 1: 첫번째 파티션 의미, `/dev/xvda1 파티션의 크기`를 증가 시킨다는 의미

```shell
lsblk
```

- 다시 치면 파티션 크기가 변경 된 것을 확인 가능

## EC2 인스턴스의 파일 시스템 조정

```shell
df -h
```

- 현재 dir 공간 확인

```shell
sudo resize2fs /dev/xvda1
```

- resize2fs: ext2, ext3, ext4 파일 시스템 크기 조정 유틸리티
- /dev/xvda1: 조정 대상 파티션

```shell
df -h
```

- 볼륨 사이즈 변경 된 부분 확인 가능

## 99. 참고 자료

- [[AWS] EC2의 스토리지 용량 재부팅 없이 늘리기](https://livenow14.tistory.com/49)
- [[AWS] Resize EBS volume without rebooting in AWS](https://www.fizerkhan.com/blog/posts/resize-ebs-volume-without-rebooting-in-aws)
- [[AWS] EBS 볼륨 크기 조정 후 파일 시스템 확장](https://docs.aws.amazon.com/ko_kr/ebs/latest/userguide/recognize-expanded-volume-linux.html?icmpid=docs_ec2_console)