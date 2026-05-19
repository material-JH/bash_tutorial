# 11. 최종 실습 프로젝트

목표: 원격 리눅스 서버에 SSH로 접속해서 작은 노트 프로젝트를 만들고, 검색하고, 백업하고, 간단한 스크립트까지 실행합니다.

## 0단계: 서버 접속

내 컴퓨터에서:

```bash
local$ ssh student01@linux.example.edu
```

자신의 사용자명과 서버 주소로 바꿔서 실행하세요.

서버에서 확인:

```bash
server$ whoami
server$ hostname
server$ pwd
```

## 1단계: 프로젝트 폴더 만들기

```bash
server$ cd ~/linux-practice
server$ mkdir -p final-project
server$ cd final-project
server$ mkdir -p notes logs backup
server$ ls -la
```

## 2단계: 노트 파일 만들기

```bash
server$ echo "리눅스 명령어 노트" > notes/summary.txt
server$ echo "pwd는 현재 위치를 보여준다" >> notes/summary.txt
server$ echo "ls는 파일 목록을 보여준다" >> notes/summary.txt
server$ echo "cd는 폴더를 이동한다" >> notes/summary.txt

server$ printf "TODO\ngrep 연습\npipe 연습\npermission 복습\n" > notes/todo.txt
```

## 3단계: 파일 읽기

```bash
server$ cat notes/summary.txt
server$ less notes/todo.txt
```

`less`에서 나가려면 `q`를 누릅니다.

## 4단계: 검색

```bash
server$ grep "연습" notes/todo.txt
server$ grep -R "위치" notes/
```

## 5단계: 줄 수 세기

```bash
server$ wc -l notes/summary.txt
server$ wc -l notes/todo.txt
```

## 6단계: 명령어 출력 저장

```bash
server$ ls -la notes > logs/notes-listing.txt
server$ cat logs/notes-listing.txt
```

현재 위치를 뒤에 추가합니다.

```bash
server$ pwd >> logs/notes-listing.txt
server$ cat logs/notes-listing.txt
```

## 7단계: 백업 만들기

```bash
server$ cp -r notes backup/notes-backup
server$ find backup -name "*.txt"
```

## 8단계: 파일 이름 바꾸기

```bash
server$ mv notes/todo.txt notes/tasks.txt
server$ ls notes
```

## 9단계: 작은 스크립트 만들기

```bash
server$ printf '#!/usr/bin/env bash\necho "Project location:"\npwd\necho\necho "Text files:"\nfind . -name "*.txt"\necho\necho "Lines containing 연습:"\ngrep -R "연습" .\n' > show-project.sh
server$ chmod +x show-project.sh
server$ ./show-project.sh
```

## 10단계: 안전하게 정리

삭제 전 확인:

```bash
server$ ls backup
```

백업 복사본만 삭제:

```bash
server$ rm -r backup/notes-backup
```

## 11단계: 접속 종료

```bash
server$ exit
```

내 컴퓨터 터미널로 돌아왔는지 확인합니다.

## 최종 자기 점검

아래 명령어를 설명할 수 있으면 입문 단계를 잘 마친 것입니다.

```bash
ssh
exit
whoami
hostname
pwd
ls -la
cd
mkdir -p
echo
printf
cat
less
grep
wc -l
cp -r
mv
find
chmod +x
rm -r
```

아직 헷갈리는 명령어가 있다면 해당 lesson으로 돌아가서 다시 실습하세요.
