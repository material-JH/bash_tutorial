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

## 예제 파일 준비

```bash
server$ git clone https://github.com/material-JH/bash_tutorial.git ~/bash_tutorial
server$ mkdir -p ~/linux-practice
server$ cp -r ~/bash_tutorial/examples ~/linux-practice/
server$ cd ~/linux-practice/examples
```

## 이동과 구조 보기

| 작업 | 명령어 |
|---|---|
| 현재 위치 보기 | `pwd` |
| 파일 목록 보기 | `ls` |
| 자세히 보기 | `ls -l` |
| 숨김 파일 포함 | `ls -a` |
| 자세히 + 숨김 파일 | `ls -la` |
| 폴더 이동 | `cd folder-name` |
| 한 단계 위로 이동 | `cd ..` |
| 홈 폴더로 이동 | `cd ~` 또는 `cd` |
| 직전 폴더로 이동 | `cd -` |
| 폴더 구조를 나무처럼 보기 | `tree .` |
| `tree`가 없을 때 대체 | `find . -maxdepth 3 -print` |

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

## 텍스트 읽기와 편집

| 작업 | 명령어 |
|---|---|
| 파일 전체 출력 | `cat file.txt` |
| 긴 파일 페이지 단위로 읽기 | `more file.txt` |
| vim으로 읽기/편집 | `vim file.txt` |
| 앞 10줄 보기 | `head file.txt` |
| 뒤 10줄 보기 | `tail file.txt` |
| 뒤 30줄 보기 | `tail -n 30 file.txt` |
| 계속 추가되는 로그 보기 | `tail -f app.log` |

`more`에서 나가려면 `q`를 누릅니다.

vim 기본키:

| 키 | 의미 |
|---|---|
| `i` | 입력 모드 |
| `Esc` | 명령 모드 |
| `:w` | 저장 |
| `:q` | 종료 |
| `:wq` | 저장 후 종료 |
| `:q!` | 저장하지 않고 종료 |
| `/word` | 검색 |
| `n` | 다음 검색 결과 |

## 검색과 검사

| 작업 | 명령어 |
|---|---|
| 파일 안에서 검색 | `grep "word" file.txt` |
| 대소문자 무시 검색 | `grep -i "word" file.txt` |
| 폴더 안을 재귀 검색 | `grep -R "word" folder/` |
| 줄 번호 표시 | `grep -n "word" file.txt` |
| 파일 찾기 | `find . -name "*.in"` |
| 찾은 파일마다 명령 실행 | `find . -name "*.out" -exec grep -H "JOB DONE" {} \;` |
| 줄/단어/바이트 수 | `wc file.txt` |
| 줄 수만 보기 | `wc -l file.txt` |

## 명령어와 실행 파일 확인

| 작업 | 명령어 |
|---|---|
| 명령어 위치 확인 | `command -v pw.x` |
| 명령어 종류 확인 | `type pw.x` |
| 파일 종류 확인 | `file ./fake-pw.x` |
| 실행 권한 보기 | `ls -l ./fake-pw.x` |
| 실행 권한 추가 | `chmod +x script.sh` |
| 현재 폴더의 실행 파일 실행 | `./script.sh` |

## 파이프와 리다이렉션

| 작업 | 명령어 |
|---|---|
| stdout 저장, 기존 내용 덮어쓰기 | `command > file.out` |
| stdout 뒤에 추가 | `command >> file.out` |
| stderr 저장 | `command 2> file.err` |
| stdout과 stderr를 한 파일에 저장 | `command > file.log 2>&1` |
| 출력도 보고 파일에도 저장 | `command | tee file.out` |
| 앞 명령 결과를 다음 명령으로 전달 | `command1 | command2` |
| ERROR 줄 수 세기 | `grep "ERROR" app.log | wc -l` |

## Quantum ESPRESSO 자주 쓰는 명령

| 작업 | 명령어 |
|---|---|
| `pw.x` 위치 확인 | `command -v pw.x` |
| MPI 실행기 확인 | `command -v mpirun` |
| 모듈 목록 보기 | `module avail quantum` |
| 모듈 로드 예시 | `module load quantum-espresso` |
| SCF 입력 파일 읽기 | `vim si.scf.in` |
| 출력 파일 페이지 단위 읽기 | `more si.scf.out` |
| 마지막 부분 보기 | `tail -n 40 si.scf.out` |
| 에너지 줄 검색 | `grep -n "total energy" si.scf.out` |
| 정상 종료 확인 | `grep -n "JOB DONE" si.scf.out` |
| 직렬 실행 | `pw.x -in si.scf.in > si.scf.out 2> si.scf.err` |
| MPI 실행 | `mpirun -np 4 pw.x -in si.scf.in > si.scf.out 2>&1` |
| 바이너리 파일 확인 | `file fake-wfc.dat` |
| 바이너리 일부 보기 | `hexdump -C fake-wfc.dat | more` |

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
ls *.out
rm *.out
```
