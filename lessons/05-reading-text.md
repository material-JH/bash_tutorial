# 5. 텍스트 파일 읽기: `cat`, `less`, `head`, `tail`

리눅스 서버에서는 설정 파일, 로그 파일, 결과 파일을 텍스트로 읽는 일이 많습니다.

연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice
```

## 샘플 파일 만들기

```bash
server$ mkdir -p text
server$ printf "line 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\nline 8\nline 9\nline 10\nline 11\nline 12\n" > text/sample.txt
```

## 전체 출력: `cat`

```bash
server$ cat text/sample.txt
```

`cat`은 짧은 파일을 빠르게 볼 때 좋습니다. 긴 파일에는 적합하지 않습니다.

## 페이지 단위로 읽기: `less`

```bash
server$ less text/sample.txt
```

`less` 안에서 자주 쓰는 키:

| 키 | 동작 |
|---|---|
| Space | 다음 페이지 |
| `b` | 이전 페이지 |
| `/word` | word 검색 |
| `n` | 다음 검색 결과 |
| `q` | 종료 |

나가고 싶으면 `q`를 누르세요.

## 앞부분 보기: `head`

```bash
server$ head text/sample.txt
server$ head -n 3 text/sample.txt
```

`head -n 3`은 앞의 3줄만 보여줍니다.

## 뒷부분 보기: `tail`

```bash
server$ tail text/sample.txt
server$ tail -n 3 text/sample.txt
```

`tail`은 로그 파일을 볼 때 자주 씁니다. 로그는 보통 새 내용이 파일 끝에 추가되기 때문입니다.

## 계속 지켜보기: `tail -f`

```bash
server$ tail -f text/sample.txt
```

이 명령은 새 줄이 추가될 때까지 기다립니다. 멈추려면:

```text
Ctrl + C
```

## 실습

```bash
server$ echo "line 13" >> text/sample.txt
server$ tail -n 5 text/sample.txt
```

## 체크포인트

1. 긴 파일은 `cat`과 `less` 중 무엇으로 보는 것이 좋나요?
2. `less`에서 나가려면 어떤 키를 누르나요?
3. `tail -n 5 file.txt`는 무엇을 보여주나요?
