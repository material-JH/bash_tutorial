# 리눅스 명령어 입문 튜토리얼

Windows나 macOS에는 익숙하지만 터미널은 낯선 초보자를 위한 한국어 튜토리얼입니다.

이 튜토리얼의 기본 상황은 다음과 같습니다.

1. 내 컴퓨터에서 터미널을 연다.
2. `ssh`로 원격 리눅스 서버에 접속한다.
3. 서버 안에서 리눅스 명령어를 연습한다.

프로그래밍 경험은 필요하지 않습니다.

## 대상 독자

- 평소에는 Windows 탐색기나 macOS Finder로 파일을 관리하는 사람
- 리눅스 서버 계정은 받았지만 접속과 명령어 사용이 낯선 사람
- 연구실 서버, 회사 서버, 클라우드 VM, HPC 로그인 노드 등에 `ssh`로 접속해야 하는 사람
- `cd`, `ls`, `rm`, `grep`, `sudo` 같은 명령어가 무엇인지 천천히 배우고 싶은 사람

## 튜토리얼을 마치면 할 수 있는 것

- Windows/macOS/Linux에서 터미널을 열 수 있습니다.
- `ssh 사용자명@서버주소`로 원격 리눅스 서버에 접속할 수 있습니다.
- 로컬 컴퓨터와 원격 서버를 구분할 수 있습니다.
- `pwd`, `ls`, `cd`로 폴더를 이동할 수 있습니다.
- `mkdir`, `touch`, `echo`로 파일과 폴더를 만들 수 있습니다.
- `cat`, `less`, `head`, `tail`로 텍스트 파일을 읽을 수 있습니다.
- `cp`, `mv`, `rm`으로 복사, 이동, 이름 변경, 삭제를 할 수 있습니다.
- `grep`, `find`, `wc`로 파일을 검색하고 검사할 수 있습니다.
- 파이프(`|`)와 리다이렉션(`>`, `>>`)의 기본 개념을 이해할 수 있습니다.
- 권한, 실행 파일, `sudo`의 기본 의미를 이해할 수 있습니다.
- 도움말, 명령 기록, 자동완성, 자주 쓰는 단축키를 사용할 수 있습니다.

## 준비물

원격 서버에 접속하려면 보통 아래 정보가 필요합니다.

- 서버 주소: 예) `linux.example.edu`, `123.45.67.89`
- 사용자명: 예) `jinho`, `student01`
- 인증 방법: 비밀번호 또는 SSH key
- 포트 번호: 보통 `22`, 다르면 예) `2222`
- 필요하면 VPN 접속 여부

서버 정보가 없다면 서버 관리자, 연구실 담당자, 클라우드 콘솔에서 확인하세요.

## Windows에서 터미널 열기

권장 방법은 두 가지입니다.

### 방법 A: Windows Terminal 또는 PowerShell

Windows 10/11에는 보통 OpenSSH 클라이언트가 포함되어 있습니다.

1. 시작 메뉴에서 `Windows Terminal` 또는 `PowerShell`을 엽니다.
2. 아래 명령으로 SSH가 있는지 확인합니다.

```powershell
ssh -V
```

### 방법 B: WSL Ubuntu

리눅스 환경과 비슷하게 연습하고 싶다면 WSL을 권장합니다.

PowerShell을 관리자 권한으로 열고:

```powershell
wsl --install
```

설치 후 `Ubuntu`를 실행합니다.

## macOS에서 터미널 열기

1. Finder를 엽니다.
2. Applications -> Utilities -> Terminal을 실행합니다.
3. 아래 명령으로 SSH가 있는지 확인합니다.

```bash
ssh -V
```

macOS에는 기본적으로 SSH가 들어 있습니다.

## Linux에서 터미널 열기

배포판마다 다르지만 보통 다음 중 하나입니다.

- Ubuntu/GNOME: `Ctrl` + `Alt` + `T`
- KDE: Konsole 검색
- 앱 메뉴에서 Terminal 검색

## 명령 예제를 읽는 법

문서에서 이런 예제를 보면:

```bash
server$ pwd
```

실제로 입력하는 것은 `pwd`뿐입니다. 앞의 `server$`는 “원격 서버에서 입력한다”는 표시입니다.

이 튜토리얼에서는 상황을 구분하기 위해 다음 표기를 씁니다.

```text
local$   내 컴퓨터 터미널에서 실행
server$  SSH로 접속한 원격 리눅스 서버에서 실행
```

`local$`이나 `server$` 자체는 입력하지 마세요.

## 목차

1. [터미널, 셸, 명령어란 무엇인가](lessons/01-what-is-the-terminal.md)
2. [SSH로 원격 리눅스 서버 접속하기](lessons/02-safe-practice-folder.md)
3. [위치와 이동: `pwd`, `ls`, `cd`](lessons/03-navigation.md)
4. [파일과 폴더 만들기: `mkdir`, `touch`, `echo`](lessons/04-files-and-folders.md)
5. [텍스트 파일 읽기: `cat`, `less`, `head`, `tail`](lessons/05-reading-text.md)
6. [복사, 이동, 이름 변경, 삭제](lessons/06-copy-move-delete.md)
7. [와일드카드, 파이프, 리다이렉션](lessons/07-wildcards-pipes-redirection.md)
8. [검색과 검사: `grep`, `find`, `wc`](lessons/08-searching-and-inspecting.md)
9. [권한, 실행 파일, `sudo`](lessons/09-permissions-and-sudo.md)
10. [도움말, 기록, 자동완성, 단축키](lessons/10-help-history-next-steps.md)
11. [최종 실습 프로젝트](lessons/11-final-practice-project.md)

추가 자료:

- [치트시트](CHEATSHEET.md)
- [튜토리얼 설계 조사 메모](RESEARCH_NOTES.md)

## 가장 중요한 안전 규칙

1. 처음에는 반드시 `~/linux-practice` 폴더 안에서 연습하세요.
2. `rm`은 삭제 명령입니다. 특히 `rm -r`, `rm -rf`는 조심하세요.
3. 원격 서버에서는 내 실수가 다른 사용자나 공동 연구 데이터에 영향을 줄 수 있습니다.
4. `sudo`는 관리자 권한 실행입니다. 허가 없이 사용하지 마세요.
5. 인터넷에서 복사한 명령어는 의미를 이해한 뒤 실행하세요.

## 빠른 시작

서버 정보가 다음과 같다고 가정해 봅시다.

- 사용자명: `student01`
- 서버 주소: `linux.example.edu`

내 컴퓨터에서:

```bash
local$ ssh student01@linux.example.edu
```

접속 후 원격 서버에서:

```bash
server$ mkdir -p ~/linux-practice
server$ cd ~/linux-practice
server$ pwd
server$ ls
```

이제 안전한 연습 폴더 안에 있습니다.
