# 7. 와일드카드, 파이프, 리다이렉션

셸의 힘은 여러 파일을 한 번에 다루고, 명령어끼리 연결할 수 있다는 데 있습니다.

연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice
server$ mkdir -p shell-power
server$ cd shell-power
```

## 샘플 파일 만들기

```bash
server$ echo "apple" > fruit.txt
server$ echo "carrot" > vegetable.txt
server$ echo "banana" > yellow-fruit.txt
server$ echo "notes" > notes.md
server$ ls
```

## 와일드카드 `*`

`*`는 “아무 글자나 0개 이상”을 뜻합니다.

`.txt`로 끝나는 파일:

```bash
server$ ls *.txt
```

이름에 `fruit`가 들어가는 파일:

```bash
server$ ls *fruit*
```

## 삭제 전에 반드시 미리 보기

좋은 습관:

```bash
server$ ls *.txt
```

목록이 맞는지 확인한 뒤에만:

```bash
server$ rm *.txt
```

초보자는 와일드카드와 `rm`을 함께 쓸 때 특히 조심해야 합니다.

## 리다이렉션

리다이렉션은 명령어 출력을 파일로 보내는 기능입니다.

파일 내용을 새로 씁니다.

```bash
server$ echo "first line" > output.txt
server$ cat output.txt
```

파일 뒤에 추가합니다.

```bash
server$ echo "second line" >> output.txt
server$ cat output.txt
```

정리:

- `>`: 덮어쓰기
- `>>`: 추가하기

## 파이프 `|`

파이프는 앞 명령어의 출력을 뒤 명령어의 입력으로 보냅니다.

```bash
server$ ls | wc -l
```

뜻:

1. `ls`가 파일 목록을 출력합니다.
2. `|`가 그 출력을 다음 명령으로 넘깁니다.
3. `wc -l`이 줄 수를 셉니다.

## 로그 검색 예시

```bash
server$ printf "ERROR disk\nINFO start\nERROR network\nINFO stop\n" > app.log
server$ grep "ERROR" app.log
server$ grep "ERROR" app.log | wc -l
```

마지막 명령은 `ERROR`가 들어간 줄 수를 셉니다.

## 실습

```bash
server$ ls -la > listing.txt
server$ cat listing.txt
server$ wc -l listing.txt
```

## 체크포인트

1. `*.txt`는 어떤 파일을 의미하나요?
2. `>`와 `>>`의 차이는 무엇인가요?
3. `grep "ERROR" app.log | wc -l`에서 먼저 실행되는 명령어는 무엇인가요?
