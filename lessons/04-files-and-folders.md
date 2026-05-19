# 4. 파일과 폴더 만들기: `mkdir`, `touch`, `echo`

원격 서버의 연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice
```

## 폴더 만들기: `mkdir`

하나의 폴더를 만듭니다.

```bash
server$ mkdir notes
```

중첩 폴더를 한 번에 만듭니다.

```bash
server$ mkdir -p projects/demo
```

확인:

```bash
server$ ls
server$ ls projects
```

## 빈 파일 만들기: `touch`

```bash
server$ touch notes/todo.txt
server$ ls notes
```

`touch`는 파일이 없으면 빈 파일을 만들고, 파일이 있으면 수정 시간을 갱신합니다.

## 파일에 한 줄 쓰기: `echo`

```bash
server$ echo "우유 사기" > notes/todo.txt
server$ cat notes/todo.txt
```

한 줄을 추가하려면:

```bash
server$ echo "ls와 cd 연습하기" >> notes/todo.txt
server$ cat notes/todo.txt
```

중요:

- `>`는 기존 내용을 지우고 새로 씁니다.
- `>>`는 기존 내용 뒤에 추가합니다.

## 여러 줄 쓰기: `printf`

```bash
server$ printf "첫 번째 줄\n두 번째 줄\n세 번째 줄\n" > notes/memo.txt
server$ cat notes/memo.txt
```

`\n`은 줄바꿈을 뜻합니다.

## 편집기 사용

서버에 따라 사용할 수 있는 편집기가 다릅니다.

가장 흔한 초보자용 편집기:

```bash
server$ nano notes/todo.txt
```

`nano`에서 저장하고 나가기:

1. `Ctrl + O`: 저장
2. Enter: 파일 이름 확인
3. `Ctrl + X`: 종료

`vim`만 있는 서버도 있지만, 완전 초보자에게는 조금 어렵습니다. 처음에는 `nano`가 있는지 확인하세요.

```bash
server$ which nano
```

## 파일 이름 규칙

처음에는 공백 없는 이름을 권장합니다.

좋은 예:

```text
my-notes.txt
project_report.txt
```

공백이 있는 이름은 따옴표가 필요합니다.

```bash
server$ touch "my notes.txt"
server$ ls "my notes.txt"
```

## 대소문자 구분

리눅스는 대소문자를 구분합니다.

```text
report.txt
Report.txt
REPORT.txt
```

이 세 파일은 서로 다른 파일일 수 있습니다.

## 실습

```bash
server$ cd ~/linux-practice
server$ mkdir -p journal/2026
server$ echo "오늘 SSH로 리눅스 서버에 접속했다." > journal/2026/day1.txt
server$ cat journal/2026/day1.txt
```

## 체크포인트

1. `mkdir -p`의 장점은 무엇인가요?
2. `>`와 `>>`의 차이는 무엇인가요?
3. 리눅스에서 `memo.txt`와 `Memo.txt`는 같은 파일인가요?
