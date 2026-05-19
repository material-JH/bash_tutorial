# 3. 위치와 이동: `pwd`, `ls`, `cd`, `tree`

이번 장부터는 원격 서버에 SSH로 접속한 상태라고 가정합니다.

먼저 연습 폴더와 예제 파일을 준비합니다.

```bash
server$ mkdir -p ~/linux-practice
server$ cp -r ~/bash_tutorial/examples ~/linux-practice/
server$ cd ~/linux-practice/examples
```

## 현재 위치 보기: `pwd`

```bash
server$ pwd
```

예:

```text
/home/student01/linux-practice/examples
```

`pwd`는 print working directory의 약자입니다. 현재 작업 중인 폴더를 보여줍니다.

## 파일 목록 보기: `ls`

```bash
server$ ls
```

자세히 보려면:

```bash
server$ ls -l
```

숨김 파일까지 보려면:

```bash
server$ ls -a
```

둘을 합치면:

```bash
server$ ls -la
```

## 폴더 구조 보기: `tree`

`tree`는 폴더 구조를 나무 모양으로 보여 줍니다.

```bash
server$ tree .
```

`tree`가 있는지 먼저 확인하려면:

```bash
server$ command -v tree
```

출력이 없으면 설치되어 있지 않은 것입니다. 공용 서버에서 `sudo apt install tree` 같은 명령을 마음대로 실행하지 말고 관리자에게 요청하세요.

`tree`가 없을 때는 `find`로 비슷하게 볼 수 있습니다.

```bash
server$ find . -maxdepth 3 -print
```

## 폴더 이동: `cd`

예제 폴더 안에서 이동해 봅니다.

```bash
server$ cd navigation
server$ pwd
server$ ls
```

`animals` 폴더로 이동합니다.

```bash
server$ cd animals
server$ pwd
server$ ls
```

`cats` 폴더로 이동합니다.

```bash
server$ cd cats
server$ pwd
server$ ls
```

한 단계 위로 이동합니다.

```bash
server$ cd ..
server$ pwd
```

홈 폴더로 이동합니다.

```bash
server$ cd ~
server$ pwd
```

다시 예제 폴더로 돌아옵니다.

```bash
server$ cd ~/linux-practice/examples
```

## 절대 경로와 상대 경로

절대 경로는 루트(`/`) 또는 홈(`~`)에서 시작하는 전체 주소입니다.

```bash
server$ cd ~/linux-practice/examples/navigation/animals/dogs
```

상대 경로는 현재 위치를 기준으로 이동합니다.

```bash
server$ cd navigation/animals/dogs
```

현재 위치가 `~/linux-practice/examples`라면 두 명령은 같은 곳으로 갑니다.

## 특수 기호

| 기호 | 의미 |
|---|---|
| `.` | 현재 폴더 |
| `..` | 부모 폴더 |
| `~` | 내 홈 폴더 |
| `/` | 리눅스 파일 시스템의 최상위 |

## 실습

`~/linux-practice/examples`에서 시작하세요.

```bash
server$ cd ~/linux-practice/examples
server$ cd navigation/animals/dogs
server$ pwd
server$ cd ../../plants/trees
server$ pwd
server$ cd ../../..
server$ pwd
```

각 단계에서 내가 어디에 있는지 말로 설명해 보세요.

## 체크포인트

1. `pwd`는 무엇을 보여주나요?
2. `tree .`는 어떤 상황에서 유용한가요?
3. `cd ..`는 어디로 이동하나요?
4. `cd navigation`과 `cd /navigation`은 왜 다를 수 있나요?
