# 8. 검색과 검사: `grep`, `find`, `wc`

원격 서버에서는 많은 파일 중 필요한 내용을 빠르게 찾는 능력이 중요합니다.

연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice
server$ mkdir -p search-practice/logs
server$ cd search-practice
```

## 샘플 파일 만들기

```bash
server$ printf "Linux is useful.\nThe terminal can search text quickly.\nPractice makes commands less scary.\n" > notes.txt
server$ printf "INFO started\nERROR missing file\nINFO retrying\nERROR network timeout\nINFO stopped\n" > logs/app.log
```

## 파일 안에서 검색: `grep`

```bash
server$ grep "terminal" notes.txt
```

대소문자 무시:

```bash
server$ grep -i "linux" notes.txt
```

폴더 안을 재귀적으로 검색:

```bash
server$ grep -R "ERROR" .
```

줄 번호 표시:

```bash
server$ grep -n "ERROR" logs/app.log
```

## 개수 세기: `wc`

```bash
server$ wc notes.txt
```

보통 줄 수, 단어 수, 바이트 수가 나옵니다.

줄 수만 세기:

```bash
server$ wc -l notes.txt
```

검색 결과 줄 수 세기:

```bash
server$ grep "ERROR" logs/app.log | wc -l
```

## 파일 이름으로 찾기: `find`

현재 폴더 아래에서 `.txt` 파일 찾기:

```bash
server$ find . -name "*.txt"
```

`.log` 파일 찾기:

```bash
server$ find . -name "*.log"
```

뜻:

- `find`: 파일을 찾는 명령어
- `.`: 현재 폴더에서 시작
- `-name "*.txt"`: 이름이 `.txt`로 끝나는 파일

## 명령어 위치 확인: `which`

```bash
server$ which ls
server$ which grep
```

실행되는 프로그램이 어디에 있는지 보여줍니다.

## 실습

```bash
server$ find . -name "*.log"
server$ grep -R "INFO" .
server$ grep "ERROR" logs/app.log | wc -l
```

## 체크포인트

1. `grep -i`는 무엇을 하나요?
2. `grep -R`은 무엇을 하나요?
3. `find . -name "*.txt"`에서 `.`은 무엇을 의미하나요?
