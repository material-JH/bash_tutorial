# 2. SSH로 원격 리눅스 서버 접속하기

이 장에서는 내 컴퓨터에서 원격 리눅스 서버에 접속하고, 안전한 연습 폴더를 만듭니다.

## SSH란?

SSH는 Secure Shell의 약자입니다. 네트워크를 통해 다른 컴퓨터, 보통 리눅스 서버에 안전하게 접속하기 위한 도구입니다.

쉽게 말하면:

```text
내 노트북의 터미널  ──ssh──>  원격 리눅스 서버의 터미널
```

## 접속에 필요한 정보

보통 아래 정보가 필요합니다.

| 항목 | 예시 |
|---|---|
| 사용자명 | `student01` |
| 서버 주소 | `linux.example.edu` 또는 `123.45.67.89` |
| 비밀번호 | 서버 계정 비밀번호 |
| 포트 | 보통 `22` |
| SSH key | 사용하는 경우 `~/.ssh/id_ed25519` 같은 파일 |

서버 주소와 사용자명은 서버 관리자에게 받아야 합니다.

## 기본 접속 명령

내 컴퓨터 터미널에서 실행합니다.

```bash
local$ ssh student01@linux.example.edu
```

형식은 다음과 같습니다.

```bash
ssh 사용자명@서버주소
```

예:

```bash
local$ ssh jinho@123.45.67.89
```

## 포트 번호가 다를 때

기본 SSH 포트는 22입니다. 서버 관리자가 2222 같은 다른 포트를 알려줬다면 `-p` 옵션을 씁니다.

```bash
local$ ssh -p 2222 student01@linux.example.edu
```

## 처음 접속할 때 나오는 질문

처음 접속하면 이런 메시지가 나올 수 있습니다.

```text
The authenticity of host 'linux.example.edu' can't be established.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

서버 주소가 정확하고 서버 관리자가 알려준 서버가 맞다면:

```text
yes
```

를 입력합니다.

주의: 공용 Wi-Fi나 낯선 네트워크에서 처음 접속할 때는 서버 주소를 다시 확인하는 습관이 좋습니다.

## 비밀번호 입력

비밀번호를 입력할 때 화면에 아무 글자도 보이지 않을 수 있습니다.

정상입니다. 보안 때문에 `*`도 표시하지 않는 경우가 많습니다. 비밀번호를 입력하고 Enter를 누르세요.

## 접속 성공 확인

접속 후 아래 명령어를 실행합니다.

```bash
server$ whoami
server$ hostname
server$ pwd
```

- `whoami`: 현재 사용자명
- `hostname`: 접속한 서버 이름
- `pwd`: 현재 위치

## 접속 종료

원격 서버에서 빠져나오려면:

```bash
server$ exit
```

그러면 다시 내 컴퓨터 터미널로 돌아옵니다.

## SSH key를 쓰는 경우

서버가 비밀번호 대신 key 파일을 요구할 수 있습니다.

예:

```bash
local$ ssh -i ~/.ssh/my_server_key student01@linux.example.edu
```

key 파일 권한 문제로 접속이 거부되면 보통 이렇게 고칩니다.

```bash
local$ chmod 600 ~/.ssh/my_server_key
```

Windows PowerShell에서는 권한 처리 방식이 다를 수 있으므로, 처음에는 WSL 또는 서버 관리자 안내를 따르는 것이 좋습니다.

## 안전한 연습 폴더 만들기

이제 원격 서버에 접속한 상태라고 가정합니다.

서버에서 다음 명령어를 실행하세요.

```bash
server$ mkdir -p ~/linux-practice
server$ cd ~/linux-practice
server$ pwd
```

출력 경로가 `linux-practice`로 끝나면 성공입니다.

예:

```text
/home/student01/linux-practice
```

앞으로 위험할 수 있는 실습은 이 폴더 안에서만 합니다.

## 길을 잃었을 때

내가 어디에 있는지 모르겠다면:

```bash
server$ pwd
```

연습 폴더로 돌아가려면:

```bash
server$ cd ~/linux-practice
```

## 로컬 컴퓨터와 원격 서버 구분하기

매우 중요합니다.

```bash
local$ pwd
```

이 명령은 내 컴퓨터의 현재 위치를 보여줍니다.

```bash
server$ pwd
```

이 명령은 원격 서버의 현재 위치를 보여줍니다.

SSH 접속 후에는 서버 파일을 보고 있는 것입니다. 내 Windows 바탕화면이나 macOS Desktop을 보고 있는 것이 아닙니다.

## 체크포인트

1. SSH 접속 명령어의 기본 형식은 무엇인가요?
2. 서버 접속을 종료하려면 어떤 명령어를 쓰나요?
3. 왜 `~/linux-practice` 같은 연습 폴더를 만들어야 하나요?
