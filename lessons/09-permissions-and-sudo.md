# 9. 권한, 실행 파일, `sudo`

리눅스 서버에서는 파일마다 읽기, 쓰기, 실행 권한이 있습니다.

연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice
server$ mkdir -p permissions-practice
server$ cd permissions-practice
```

## 권한 보기: `ls -l`

```bash
server$ echo "hello" > hello.txt
server$ ls -l hello.txt
```

예:

```text
-rw-r--r-- 1 student01 student01 6 May 19 10:00 hello.txt
```

앞의 `-rw-r--r--` 부분이 권한입니다.

대략 이렇게 읽습니다.

```text
-  rw-  r--  r--
|  |    |    |
|  |    |    다른 사용자
|  |    그룹
|  소유자
파일 종류
```

글자의 의미:

| 글자 | 의미 |
|---|---|
| `r` | read, 읽기 |
| `w` | write, 쓰기 |
| `x` | execute, 실행 |

## 작은 스크립트 만들기

```bash
server$ printf '#!/usr/bin/env bash\necho "Hello from a script"\n' > hello.sh
server$ ls -l hello.sh
```

실행해 봅니다.

```bash
server$ ./hello.sh
```

`Permission denied`가 나올 수 있습니다. 아직 실행 권한이 없기 때문입니다.

실행 권한 추가:

```bash
server$ chmod +x hello.sh
server$ ls -l hello.sh
server$ ./hello.sh
```

## 왜 `./hello.sh`라고 쓰나요?

현재 폴더의 파일을 실행하려면 `./`를 붙이는 경우가 많습니다.

```bash
server$ ./hello.sh
```

뜻은 “현재 폴더에 있는 `hello.sh`를 실행하라”입니다.

## `sudo`란?

`sudo`는 관리자 권한으로 명령어를 실행합니다.

예:

```bash
server$ sudo apt update
```

하지만 원격 공용 서버에서는 일반 사용자가 `sudo` 권한이 없을 수 있습니다. 연구실/회사/HPC 서버에서는 무단으로 `sudo`를 사용하려고 하지 마세요.

중요:

- `sudo`는 시스템 파일을 바꿀 수 있습니다.
- 비밀번호를 요구할 수 있습니다.
- 비밀번호 입력 중 화면에 아무것도 안 보일 수 있습니다.
- 명령이 실패했다고 무조건 `sudo`를 붙이면 안 됩니다.

## 실습

```bash
server$ ls -l hello.sh
server$ chmod -x hello.sh
server$ ls -l hello.sh
server$ chmod +x hello.sh
server$ ls -l hello.sh
server$ ./hello.sh
```

권한 문자열에서 `x`가 생겼다가 없어지는 것을 관찰하세요.

## 체크포인트

1. 권한에서 `x`는 무엇을 의미하나요?
2. `chmod +x hello.sh`는 무엇을 하나요?
3. 원격 공용 서버에서 `sudo`를 조심해야 하는 이유는 무엇인가요?
