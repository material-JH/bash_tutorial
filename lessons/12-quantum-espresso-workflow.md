# 12. Quantum ESPRESSO 작업 흐름

이 장은 리눅스 명령어를 Quantum ESPRESSO(QE) 사용 상황에 맞춰 정리합니다.

목표:

- QE 입력 파일을 `vim`으로 읽고 수정합니다.
- `pw.x` 같은 실행 파일을 찾습니다.
- stdout, stderr 리다이렉션을 이해합니다.
- 출력 파일에서 에너지, 수렴, 정상 종료 여부를 찾습니다.
- 바이너리 파일과 텍스트 파일을 구분합니다.

## 1. 예제 폴더로 이동

```bash
server$ cd ~/linux-practice/examples/qe
server$ ls -la
```

구조를 봅니다.

```bash
server$ tree .
```

`tree`가 없으면:

```bash
server$ find . -maxdepth 3 -print
```

## 2. 입력 파일 읽기: `vim`

```bash
server$ vim si.scf.in
```

확인할 부분:

```text
&CONTROL
  calculation = 'scf'
  prefix = 'si'
  outdir = './tmp'
  pseudo_dir = './pseudo'
/
```

vim에서 검색:

```text
/ecutwfc
/K_POINTS
/pseudo_dir
```

종료:

```text
:q
```

수정 후 저장 종료:

```text
:wq
```

## 3. 실행 파일 확인: `command -v`

실제 QE가 설치된 서버에서는 먼저 실행 파일을 찾습니다.

```bash
server$ command -v pw.x
server$ command -v ph.x
server$ command -v pp.x
server$ command -v mpirun
```

출력이 없으면 현재 환경에서 명령을 찾지 못한 것입니다.

HPC 서버에서는 module을 써야 할 수 있습니다.

```bash
server$ module avail quantum
server$ module avail qe
server$ module load quantum-espresso
server$ module list
server$ command -v pw.x
```

module 이름은 서버마다 다릅니다.

## 4. 실행 파일 종류 확인

```bash
server$ file fake-pw.x
```

실제 `pw.x`도 확인할 수 있습니다.

```bash
server$ file $(command -v pw.x)
```

출력이 `ELF ... executable`처럼 나오면 컴파일된 리눅스 실행 파일입니다.

## 5. QE 실행 기본형

직렬 실행:

```bash
server$ pw.x -in si.scf.in > si.scf.out 2> si.scf.err
```

의미:

- `pw.x`: QE의 plane-wave self-consistent calculation 실행 파일
- `-in si.scf.in`: 입력 파일 지정
- `> si.scf.out`: 일반 출력(stdout)을 파일로 저장
- `2> si.scf.err`: 오류 출력(stderr)을 파일로 저장

MPI 병렬 실행:

```bash
server$ mpirun -np 4 pw.x -in si.scf.in > si.scf.out 2>&1
```

의미:

- `mpirun -np 4`: MPI process 4개로 실행
- `2>&1`: stderr도 stdout과 같은 파일(`si.scf.out`)에 저장

서버에 따라 `mpirun` 대신 `srun`, `ibrun`, `mpiexec`를 쓸 수 있습니다.

## 6. 예제 실행 파일로 연습

실제 QE를 실행하지 않고 리다이렉션만 연습합니다.

```bash
server$ ./fake-pw.x -in si.scf.in > fake.out 2> fake.err
server$ ls -l fake.out fake.err
server$ more fake.out
server$ wc -c fake.err
```

정상 실행이면 `fake.err`는 비어 있을 수 있습니다. `wc -c fake.err`가 `0`을 보이면 stderr로 나온 메시지가 없다는 뜻입니다.

일부러 입력 파일을 틀리게 주면 stderr를 확인할 수 있습니다.

```bash
server$ ./fake-pw.x -in no-file.in > bad.out 2> bad.err
server$ cat bad.err
```

## 7. 출력 파일 읽기

전체를 페이지 단위로 보기:

```bash
server$ more si.scf.out
```

처음 부분:

```bash
server$ head -n 40 si.scf.out
```

마지막 부분:

```bash
server$ tail -n 40 si.scf.out
```

계산 중 계속 보기:

```bash
server$ tail -f si.scf.out
```

멈추려면 `Ctrl + C`.

## 8. 중요한 줄 검색

총 에너지:

```bash
server$ grep -n "total energy" si.scf.out
```

수렴 확인:

```bash
server$ grep -n "convergence has been achieved" si.scf.out
```

정상 종료 확인:

```bash
server$ grep -n "JOB DONE" si.scf.out
```

오류나 경고:

```bash
server$ grep -ni "error" si.scf.out
server$ grep -ni "warning" si.scf.out
```

`-n`은 줄 번호, `-i`는 대소문자 무시입니다.

## 9. 여러 계산 결과 한 번에 검사

현재 폴더 아래의 모든 `.out` 파일에서 정상 종료를 찾습니다.

```bash
server$ find . -name "*.out" -exec grep -H "JOB DONE" {} \;
```

모든 `.out` 파일에서 total energy 줄을 찾습니다.

```bash
server$ find . -name "*.out" -exec grep -H "total energy" {} \;
```

결과가 길면:

```bash
server$ find . -name "*.out" -exec grep -H "total energy" {} \; | more
```

## 10. 입력 파일 백업

계산 조건을 바꾸기 전에는 입력 파일을 복사해 두세요.

```bash
server$ cp si.scf.in si.scf.in.bak
server$ vim si.scf.in
```

또는 계산별 폴더를 만들 수 있습니다.

```bash
server$ mkdir -p test-ecut40 test-ecut60
server$ cp si.scf.in test-ecut40/
server$ cp si.scf.in test-ecut60/
```

## 11. 바이너리 파일 다루기

QE는 사람이 읽는 텍스트 파일뿐 아니라 바이너리 파일도 만들 수 있습니다.

예제 바이너리 파일:

```bash
server$ cd ~/linux-practice/examples/binary
server$ file fake-wfc.dat
server$ hexdump -C fake-wfc.dat | more
server$ strings fake-wfc.dat
```

주의:

- 바이너리 파일을 `vim`으로 편집하지 마세요.
- wavefunction, charge-density, restart 관련 파일은 직접 읽는 파일이 아닐 수 있습니다.
- 후처리는 QE의 `pp.x`, `projwfc.x`, `bands.x`, `dos.x` 같은 도구를 사용합니다.

## 12. 자주 쓰는 QE 점검 명령 모음

```bash
server$ pwd
server$ ls -lh
server$ tree .
server$ command -v pw.x
server$ command -v mpirun
server$ vim si.scf.in
server$ pw.x -in si.scf.in > si.scf.out 2> si.scf.err
server$ tail -n 40 si.scf.out
server$ grep -n "total energy" si.scf.out
server$ grep -n "JOB DONE" si.scf.out
server$ cat si.scf.err
```

## 체크포인트

1. `pw.x -in si.scf.in > si.scf.out 2> si.scf.err`에서 `2>`는 무엇을 의미하나요?
2. `command -v pw.x` 출력이 없으면 무엇을 확인해야 하나요?
3. QE 출력 파일에서 정상 종료를 확인하려면 어떤 문자열을 검색하나요?
4. 바이너리 파일을 텍스트 파일처럼 편집하면 왜 위험한가요?
