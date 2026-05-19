# 11. 최종 실습 프로젝트

목표: 원격 리눅스 서버에 SSH로 접속해서 예제 파일을 복사하고, 읽고, 검색하고, 백업하고, 간단한 실행 파일까지 실행합니다.

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

## 1단계: 예제 파일 준비

```bash
server$ git clone https://github.com/material-JH/bash_tutorial.git ~/bash_tutorial
server$ mkdir -p ~/linux-practice
server$ cp -r ~/bash_tutorial/examples ~/linux-practice/
server$ cd ~/linux-practice/examples
server$ tree .
```

`tree`가 없으면:

```bash
server$ find . -maxdepth 3 -print
```

## 2단계: 파일 읽기

```bash
server$ cat text/sample.txt
server$ more text/qe-output-snippet.out
server$ vim qe/si.scf.in
```

vim에서 `:q`로 나옵니다.

## 3단계: 검색

```bash
server$ grep "total energy" qe/si.scf.out
server$ grep -n "JOB DONE" qe/si.scf.out
server$ grep -R "ERROR" .
```

## 4단계: 찾기와 `find -exec`

```bash
server$ find . -name "*.in"
server$ find . -name "*.out"
server$ find . -name "*.out" -exec grep -H "JOB DONE" {} \;
```

## 5단계: 명령어 출력 저장

```bash
server$ mkdir -p ~/linux-practice/final-project/logs
server$ cd ~/linux-practice/examples/qe
server$ grep "total energy" si.scf.out > ~/linux-practice/final-project/logs/energy.txt
server$ grep "JOB DONE" si.scf.out >> ~/linux-practice/final-project/logs/energy.txt
server$ more ~/linux-practice/final-project/logs/energy.txt
```

## 6단계: 백업 만들기

```bash
server$ mkdir -p ~/linux-practice/final-project/backup
server$ cp -r ~/linux-practice/examples/qe ~/linux-practice/final-project/backup/qe-backup
server$ find ~/linux-practice/final-project/backup -name "*.in"
```

## 7단계: 파일 이름 바꾸기

```bash
server$ cd ~/linux-practice/final-project/backup/qe-backup
server$ cp si.scf.in si.scf.test.in
server$ mv si.scf.test.in si.scf.renamed.in
server$ ls -l *.in
```

## 8단계: 실행 파일과 리다이렉션

예제 실행 파일로 Quantum ESPRESSO 실행 형식을 연습합니다.

```bash
server$ cd ~/linux-practice/examples/qe
server$ command -v bash
server$ file fake-pw.x
server$ ./fake-pw.x -in si.scf.in > fake.out 2> fake.err
server$ tail -n 10 fake.out
server$ cat fake.err
```

실제 Quantum ESPRESSO 서버에서는 보통 다음과 비슷합니다.

```bash
server$ command -v pw.x
server$ pw.x -in si.scf.in > si.scf.out 2> si.scf.err
```

MPI를 쓰면:

```bash
server$ command -v mpirun
server$ mpirun -np 4 pw.x -in si.scf.in > si.scf.out 2>&1
```

## 9단계: 바이너리 파일 확인

```bash
server$ cd ~/linux-practice/examples/binary
server$ file fake-wfc.dat
server$ hexdump -C fake-wfc.dat | more
server$ strings fake-wfc.dat
```

## 10단계: 안전하게 정리

삭제 전 확인:

```bash
server$ ls ~/linux-practice/final-project/backup
```

백업 복사본만 삭제:

```bash
server$ rm -r ~/linux-practice/final-project/backup/qe-backup
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
tree
cd
mkdir -p
cp -r
mv
rm -r
cat
more
vim
grep
find
find -exec
wc -l
command -v
file
chmod +x
./fake-pw.x
pw.x -in input.in > output.out 2> error.err
```

아직 헷갈리는 명령어가 있다면 해당 lesson으로 돌아가서 다시 실습하세요.
