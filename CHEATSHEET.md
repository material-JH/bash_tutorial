# 리눅스 명령어 치트시트

처음부터 외우려고 하지 말고, 필요할 때 찾아보세요.

## 로컬과 원격 서버 구분

| 표시 | 의미 |
|---|---|
| `local$` | 내 Windows/macOS/Linux 컴퓨터에서 실행 |
| `server$` | SSH 접속 후 원격 리눅스 서버에서 실행 |

`local$`, `server$`는 설명용 표시입니다. 실제로 입력하지 않습니다.

## SSH 접속

| 작업 | 명령어 |
|---|---|
| 기본 접속 | `ssh username@server-address` |
| 포트가 다를 때 | `ssh -p 2222 username@server-address` |
| SSH key로 접속 | `ssh -i ~/.ssh/my_key username@server-address` |
| 접속 종료 | `exit` |
| 현재 사용자 확인 | `whoami` |
| 서버 이름 확인 | `hostname` |

## 명령어 구조

```bash
command [options] [arguments]
```

예:

```bash
ls -l Documents
```

- `ls`: 명령어
- `-l`: 옵션
- `Documents`: 대상 또는 인자

## 이동

| 작업 | 명령어 |
|---|---|
| 현재 위치 보기 | `pwd` |
| 파일 목록 보기 | `ls` |
| 자세히 보기 | `ls -l` |
| 숨김 파일 포함 | `ls -a` |
| 자세히 + 숨김 파일 | `ls -la` |
| 폴더 안으로 이동 | `cd folder-name` |
| 한 단계 위로 이동 | `cd ..` |
| 홈 폴더로 이동 | `cd ~` 또는 `cd` |
| 직전 폴더로 이동 | `cd -` |

## 경로 기호

| 기호 | 의미 |
|---|---|
| `/` | 리눅스 파일 시스템의 최상위 위치 |
| `~` | 내 홈 디렉터리 |
| `.` | 현재 디렉터리 |
| `..` | 부모 디렉터리 |

## 파일과 폴더

| 작업 | 명령어 |
|---|---|
| 폴더 만들기 | `mkdir notes` |
| 중첩 폴더 만들기 | `mkdir -p projects/demo` |
| 빈 파일 만들기 | `touch file.txt` |
| 파일 복사 | `cp old.txt new.txt` |
| 폴더 복사 | `cp -r folder copy-folder` |
| 이동 또는 이름 변경 | `mv old-name new-name` |
| 파일 삭제 | `rm file.txt` |
| 빈 폴더 삭제 | `rmdir folder` |
| 폴더와 내용 삭제 | `rm -r folder` |

## 텍스트 읽기

| 작업 | 명령어 |
|---|---|
| 파일 전체 출력 | `cat file.txt` |
| 긴 파일 페이지 단위로 읽기 | `less file.txt` |
| 앞 10줄 보기 | `head file.txt` |
| 뒤 10줄 보기 | `tail file.txt` |
| 뒤 5줄 보기 | `tail -n 5 file.txt` |
| 계속 추가되는 로그 보기 | `tail -f app.log` |

`less`나 `man`에서 나가려면 `q`를 누릅니다.

## 검색과 개수 세기

| 작업 | 명령어 |
|---|---|
| 파일 안에서 검색 | `grep "word" file.txt` |
| 대소문자 무시 검색 | `grep -i "word" file.txt` |
| 폴더 안을 재귀 검색 | `grep -R "word" folder/` |
| 줄 번호 표시 | `grep -n "word" file.txt` |
| 파일 찾기 | `find . -name "*.txt"` |
| 줄/단어/바이트 수 | `wc file.txt` |
| 줄 수만 보기 | `wc -l file.txt` |

## 파이프와 리다이렉션

| 작업 | 명령어 |
|---|---|
| 출력 저장, 기존 내용 덮어쓰기 | `command > file.txt` |
| 출력 저장, 뒤에 추가 | `command >> file.txt` |
| 앞 명령 결과를 다음 명령으로 전달 | `command1 | command2` |
| error가 들어간 줄 수 세기 | `grep "ERROR" app.log | wc -l` |

## 권한

| 작업 | 명령어 |
|---|---|
| 권한 보기 | `ls -l` |
| 스크립트 실행 가능하게 만들기 | `chmod +x script.sh` |
| 현재 폴더의 스크립트 실행 | `./script.sh` |
| 관리자 권한으로 실행 | `sudo command` |

## 도움말과 단축키

| 작업 | 명령어/키 |
|---|---|
| 짧은 도움말 | `command --help` |
| 매뉴얼 | `man command` |
| 명령어 위치 확인 | `which command` |
| 이전 명령 기록 | `history` |
| 자동완성 | `Tab` |
| 이전 명령 불러오기 | `Up Arrow` |
| 실행 중인 명령 중지 | `Ctrl + C` |
| 화면 정리 | `Ctrl + L` |
| 명령 기록 검색 | `Ctrl + R` |

## 조심해야 할 명령어

뜻을 모르면 실행하지 마세요.

```bash
rm -r something
rm -rf something
sudo command
chmod -R ...
chown -R ...
```

삭제 전에 먼저 확인하세요.

```bash
ls *.txt
rm *.txt
```
