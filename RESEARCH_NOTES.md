# 튜토리얼 설계 조사 메모

이 튜토리얼을 만들기 전에 초보자용 리눅스/터미널 튜토리얼들이 어떤 순서와 방식으로 설명하는지 조사했습니다.

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

GUI 사용자는 “폴더를 연다”는 개념에 익숙합니다. 그래서 `pwd`, `ls`, `cd`를 먼저 배우면 명령어가 훨씬 덜 무섭습니다.

### 3. 안전한 연습 폴더를 만든다

초보자는 실수로 실제 파일을 지울 수 있습니다. 그래서 대부분의 튜토리얼은 별도 연습 폴더를 만들고 그 안에서만 실습하게 합니다.

이 튜토리얼은 원격 서버 안에 다음 폴더를 사용합니다.

```bash
~/linux-practice
```

### 4. 작은 명령어를 연결해서 점진적으로 확장한다

좋은 순서는 대략 다음과 같습니다.

1. 터미널과 셸 이해
2. 원격 서버 SSH 접속
3. 현재 위치 확인
4. 폴더 이동
5. 파일/폴더 생성
6. 파일 읽기
7. 복사/이동/삭제
8. 검색
9. 파이프와 리다이렉션
10. 권한과 `sudo`
11. 도움말과 단축키

### 5. 설명과 실습을 함께 제공한다

명령어는 읽기만 하면 익숙해지지 않습니다. 직접 입력하고 결과를 확인해야 합니다. 그래서 각 lesson에는 짧은 실습과 체크포인트를 넣었습니다.

## 이 튜토리얼의 설계 방향

- 언어: 한국어
- 대상: Windows/macOS 사용 경험은 있지만 터미널은 처음인 사람
- 실제 상황: 로컬 컴퓨터에서 SSH로 원격 리눅스 서버에 접속해서 작업
- 톤: 겁주지 않되 위험한 명령어는 명확히 경고
- 범위: 모든 리눅스 명령어가 아니라 “서버에서 길을 잃지 않고 기본 작업을 할 수 있는 수준”
- 구성: 순서대로 읽는 lesson + 빠르게 찾는 cheat sheet
