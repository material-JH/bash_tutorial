# 튜토리얼 설계 조사 메모

이 튜토리얼을 만들기 전에 초보자용 리눅스/터미널 튜토리얼들이 어떤 순서와 방식으로 설명하는지 조사했습니다. 이후 독자 상황을 Quantum ESPRESSO를 사용하는 원격 리눅스 서버 사용자로 맞추어 다시 구성했습니다.

## 참고한 자료

- Ubuntu: The Linux command line for beginners
  - https://ubuntu.com/tutorials/command-line-for-beginners
- LinuxCommand.org: Learning the shell
  - https://linuxcommand.org/lc3_learning_the_shell.php
- Software Carpentry: The Unix Shell
  - https://swcarpentry.github.io/shell-novice/
- MIT Missing Semester: Course Overview + The Shell
  - https://missing.csail.mit.edu/2020/course-shell/
- freeCodeCamp: The Linux Command Handbook
  - https://www.freecodecamp.org/news/the-linux-commands-handbook/
- DigitalOcean: 50+ Essential Linux Commands
  - https://www.digitalocean.com/community/tutorials/linux-commands

## 공통적으로 좋은 튜토리얼의 특징

### 1. 먼저 큰 그림을 설명한다

초보자는 `터미널`, `셸`, `명령어`, `프롬프트`를 혼동하기 쉽습니다. 좋은 튜토리얼은 명령어 목록부터 나열하지 않고, 사용자가 지금 보고 있는 화면이 무엇인지 먼저 설명합니다.

### 2. 파일 위치 개념을 먼저 가르친다

GUI 사용자는 “폴더를 연다”는 개념에 익숙합니다. 그래서 `pwd`, `ls`, `cd`, `tree`를 먼저 배우면 명령어가 훨씬 자연스럽습니다.

### 3. 안전한 연습 폴더를 만든다

초보자는 실수로 실제 파일을 지울 수 있습니다. 그래서 별도 연습 폴더를 만들고 그 안에서만 실습하게 합니다.

이 튜토리얼은 원격 서버 안에 다음 폴더를 사용합니다.

```bash
~/linux-practice
```

### 4. 예제 파일을 제공한다

파일 내용을 매번 명령어로 생성하면 초보자에게는 본질이 흐려질 수 있습니다. 이 저장소는 `examples/` 폴더에 텍스트, 로그, 스크립트, Quantum ESPRESSO 형태의 입력/출력 파일, 바이너리 샘플을 제공합니다.

### 5. 실제 사용 맥락에 맞춘다

일반적인 리눅스 튜토리얼은 명령어 자체에 집중합니다. 이 튜토리얼은 다음 상황을 추가로 반영합니다.

- SSH로 원격 서버 접속
- `vim`으로 입력 파일 읽기/수정
- `more`, `head`, `tail`로 출력 파일 확인
- `command -v`로 실행 파일 확인
- `pw.x` 실행과 stdout/stderr 리다이렉션
- `grep`, `find -exec`로 여러 계산 결과 검사
- 바이너리 파일과 텍스트 파일 구분

## 이 튜토리얼의 설계 방향

- 언어: 한국어
- 대상: Windows/macOS 사용 경험은 있지만 터미널은 처음인 사람
- 실제 상황: 로컬 컴퓨터에서 SSH로 원격 리눅스 서버에 접속해서 Quantum ESPRESSO 사용
- 선호 도구: `vim` 편집, `more` 페이지 보기
- 톤: 겁주지 않되 위험한 명령어는 명확히 경고
- 범위: 모든 리눅스 명령어가 아니라 “서버에서 QE 작업을 시작할 수 있는 기본기”
- 구성: 순서대로 읽는 lesson + 빠르게 찾는 cheat sheet + 복사해서 쓰는 example files
