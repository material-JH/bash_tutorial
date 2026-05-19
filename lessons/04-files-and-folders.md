# 4. 파일과 폴더 만들기, `vim`으로 편집하기

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
server$ tree projects
```

`tree`가 없으면:

```bash
server$ find projects -maxdepth 3 -print
```

## 빈 파일 만들기: `touch`

```bash
server$ touch notes/todo.txt
server$ ls notes
```

`touch`는 파일이 없으면 빈 파일을 만들고, 파일이 있으면 수정 시간을 갱신합니다.

## 짧은 내용 쓰기: `echo`

```bash
server$ echo "우유 사기" > notes/todo.txt
server$ cat notes/todo.txt
```

한 줄을 추가하려면:

```bash
server$ echo "vim 연습하기" >> notes/todo.txt
server$ cat notes/todo.txt
```

중요:

- `>`는 기존 내용을 지우고 새로 씁니다.
- `>>`는 기존 내용 뒤에 추가합니다.

## `vim`으로 파일 읽고 편집하기

서버에서 입력 파일을 수정할 때는 `vim`이 매우 흔합니다.

```bash
server$ vim notes/todo.txt
```

vim 기본 흐름:

1. 처음 열리면 명령 모드입니다.
2. `i`를 누르면 입력 모드가 됩니다.
3. 글자를 수정합니다.
4. `Esc`를 누르면 다시 명령 모드로 돌아옵니다.
5. `:wq`를 입력하고 Enter를 누르면 저장 후 종료합니다.

자주 쓰는 vim 명령:

| 키 | 의미 |
|---|---|
| `i` | 입력 모드 시작 |
| `Esc` | 명령 모드로 돌아가기 |
| `:w` | 저장 |
| `:q` | 종료 |
| `:wq` | 저장 후 종료 |
| `:q!` | 저장하지 않고 강제 종료 |
| `/word` | word 검색 |
| `n` | 다음 검색 결과 |
| `gg` | 파일 맨 위 |
| `G` | 파일 맨 아래 |

## Quantum ESPRESSO 입력 파일 열기

예제 입력 파일을 복사한 뒤 vim으로 열어 봅니다.

```bash
server$ mkdir -p qe-practice
server$ cp ~/linux-practice/examples/qe/si.scf.in qe-practice/
server$ cd qe-practice
server$ vim si.scf.in
```

확인할 부분:

- `calculation = 'scf'`
- `prefix = 'si'`
- `outdir = './tmp'`
- `pseudo_dir = './pseudo'`
- `ecutwfc = 40`
- `K_POINTS automatic`

처음에는 값을 바꾸지 말고 파일 구조를 읽는 연습만 해도 충분합니다.

## 파일 이름 규칙

처음에는 공백 없는 이름을 권장합니다.

좋은 예:

```text
si.scf.in
si.scf.out
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
si.scf.in
Si.scf.in
SI.SCF.IN
```

이 세 파일은 서로 다른 파일일 수 있습니다.

## 체크포인트

1. `mkdir -p`의 장점은 무엇인가요?
2. `>`와 `>>`의 차이는 무엇인가요?
3. vim에서 저장 후 종료하려면 무엇을 입력하나요?
4. Quantum ESPRESSO 입력 파일은 보통 어떤 확장자를 쓰나요?
