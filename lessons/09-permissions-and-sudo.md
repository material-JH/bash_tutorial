# 9. 권한, 실행 파일, `sudo`

리눅스 서버에서는 파일마다 읽기, 쓰기, 실행 권한이 있습니다.

연습 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice/examples
```

## 권한 보기: `ls -l`

```bash
server$ ls -l scripts/hello.sh
server$ ls -l qe/fake-pw.x
```

예:

```text
-rwxr-xr-x 1 student01 student01 90 May 19 10:00 hello.sh
```

앞의 `-rwxr-xr-x` 부분이 권한입니다.

대략 이렇게 읽습니다.

```text
-  rwx  r-x  r-x
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

## 스크립트 실행

```bash
server$ ./scripts/hello.sh
```

현재 폴더의 실행 파일은 보통 `./`를 붙여 실행합니다.

## 실행 권한 추가/제거

복사본으로 연습합니다.

```bash
server$ cp scripts/hello.sh ~/linux-practice/hello-copy.sh
server$ cd ~/linux-practice
server$ ls -l hello-copy.sh
server$ chmod -x hello-copy.sh
server$ ls -l hello-copy.sh
server$ ./hello-copy.sh
```

실행 권한이 없으면 `Permission denied`가 나올 수 있습니다.

다시 실행 권한을 줍니다.

```bash
server$ chmod +x hello-copy.sh
server$ ls -l hello-copy.sh
server$ ./hello-copy.sh
```

## 바이너리 실행 파일과 스크립트

Quantum ESPRESSO의 `pw.x`는 보통 컴파일된 실행 파일입니다. 예제의 `fake-pw.x`는 셸 스크립트이지만 실행 방식은 비슷하게 연습할 수 있습니다.

```bash
server$ cd ~/linux-practice/examples/qe
server$ file fake-pw.x
server$ ./fake-pw.x -in si.scf.in > fake.out 2> fake.err
server$ tail -n 5 fake.out
```

실제 서버에서는:

```bash
server$ command -v pw.x
server$ pw.x -in si.scf.in > si.scf.out 2> si.scf.err
```

처럼 실행합니다.

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
- `tree`, `vim`, `pw.x`가 없으면 먼저 module, conda, 서버 문서를 확인하거나 관리자에게 문의하세요.

## 체크포인트

1. 권한에서 `x`는 무엇을 의미하나요?
2. `chmod +x hello-copy.sh`는 무엇을 하나요?
3. 현재 폴더의 실행 파일 앞에 `./`를 붙이는 이유는 무엇인가요?
4. 원격 공용 서버에서 `sudo`를 조심해야 하는 이유는 무엇인가요?
