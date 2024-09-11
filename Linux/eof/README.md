# cat <<EOF 와 사용법

## EOF 사용

```shell
cat <<EOF > 파일명
> HHH
> AAA
> BBB
EOF
```

- Bash 쉘에서 [HEREDOC(히어닥)](https://zetawiki.com/wiki/%ED%9E%88%EC%96%B4%EB%8B%A5_HEREDOC) 구문의 전형적인 형식
- EOF 명령어는 End Of file의 뜻을 가진다
- 직접 입력한 텍스트를 파일에 저장할 때 사용
- 마지막에는 EOF 키워드를 통해 파일 끝을 내고 저장
- EOF는 End Of File, EOT는 End Of Text

## EOT 사용

```shell
cat > file2.txt <<ZZZ
> hello
> wolrd
> ZZZ
```

- 여기서는 ZZZ라는 구분자가 나올때까지 입력된 내용을 file2.txt에 쓰겠다는 의미

## 99. 참고 자료

- [[Linux] 히어닥 HEREDOC](https://zetawiki.com/wiki/%ED%9E%88%EC%96%B4%EB%8B%A5_HEREDOC)
- [[LINUX] cat <<EOF 와 사용법](https://shonm.tistory.com/666)