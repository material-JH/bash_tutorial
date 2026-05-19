# 3. 위치와 이동: `pwd`, `ls`, `cd`

이번 장부터는 원격 서버에 SSH로 접속한 상태라고 가정합니다.

먼저 연습 폴더로 이동하세요.

```bash
server$ cd ~/linux-practice
```

## 현재 위치 보기: `pwd`

```bash
server$ pwd
```

예:

```text
/home/student01/linux-practice
```

`pwd`는 print working directory의 약자입니다. 현재 작업 중인 폴더를 보여줍니다.

## 파일 목록 보기: `ls`

```bash
server$ ls
```

아무것도 출력되지 않으면 현재 폴더가 비어 있다는 뜻입니다.

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

## 이동 연습용 폴더 만들기

```bash
server$ mkdir -p animals/cats animals/dogs plants/trees
```

확인:

```bash
server$ ls
server$ ls animals
```

## 폴더 이동: `cd`

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

다시 연습 폴더로 돌아옵니다.

```bash
server$ cd ~/linux-practice
```

## 절대 경로와 상대 경로

절대 경로는 루트(`/`) 또는 홈(`~`)에서 시작하는 전체 주소입니다.

```bash
server$ cd ~/linux-practice/animals/dogs
```

상대 경로는 현재 위치를 기준으로 이동합니다.

```bash
server$ cd animals/dogs
```

현재 위치가 `~/linux-practice`라면 두 명령은 같은 곳으로 갑니다.

## 특수 기호

| 기호 | 의미 |
|---|---|
| `.` | 현재 폴더 |
| `..` | 부모 폴더 |
| `~` | 내 홈 폴더 |
| `/` | 리눅스 파일 시스템의 최상위 |

## 실습

`~/linux-practice`에서 시작하세요.

```bash
server$ cd ~/linux-practice
server$ cd animals/dogs
server$ pwd
server$ cd ../../plants/trees
server$ pwd
server$ cd ../..
server$ pwd
```

각 단계에서 내가 어디에 있는지 말로 설명해 보세요.

## 체크포인트

1. `pwd`는 무엇을 보여주나요?
2. `cd ..`는 어디로 이동하나요?
3. `cd animals`와 `cd /animals`는 왜 다를 수 있나요?
