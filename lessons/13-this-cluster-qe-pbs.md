# 13. 누리온(NURION)에서 QE 실행하기: 아주 짧은 PBS/scratch 안내

이 장은 워크숍에서 접속한 KISTI 슈퍼컴퓨터 5호기 누리온(NURION)을 기준으로 합니다.
터미널 초보자가 “어디에서 파일을 만들고, 어디에서 job을 제출하고, 어디에서 결과를 찾는지”만 먼저 익히는 것이 목표입니다.

`server$`는 누리온에 접속한 뒤 입력하는 명령이라는 뜻입니다. `server$` 글자는 입력하지 않습니다.

## 1. 누리온을 아주 간단히 이해하기

누리온은 내 노트북이 아니라 많은 계산 노드가 모여 있는 큰 리눅스 서버입니다.

```text
내 노트북
  |
  | ssh
  v
로그인 노드 login01       가벼운 작업: 파일 보기, 편집, qsub
  |
  | qsub
  v
계산 노드                무거운 작업: pw.x, xspectra.x 계산
```

중요한 규칙:

- 로그인 노드에서 큰 QE 계산을 직접 실행하지 않습니다.
- 계산은 PBS script를 만들어 `qsub`로 제출합니다.
- job은 `/scratch/$USER` 아래에서 제출합니다.

## 2. 접속 후 가장 먼저 확인할 것

```bash
server$ hostname
server$ whoami
server$ pwd
server$ echo $HOME
```

이 워크숍 계정에서 확인된 예:

```text
hostname  -> login01
HOME      -> /home01/a2114a01
```

`pwd`는 지금 내가 있는 폴더를 보여 줍니다.
초보자는 명령어를 실행하기 전에 자주 `pwd`를 입력하는 습관을 들이면 좋습니다.

## 3. home과 scratch

누리온에는 중요한 폴더가 두 개 있습니다.

```text
/home01/$USER      home: 오래 보관할 파일
/scratch/$USER     scratch: 계산을 실행할 파일
```

이 계정에서는:

```text
/home01/a2114a01
/scratch/a2114a01
```

역할:

| 위치 | 언제 사용하나요? |
|---|---|
| `/home01/$USER` | 입력 파일, PBS script, 중요한 결과를 보관 |
| `/scratch/$USER` | 실제 계산 실행, 큰 output/tmp 파일 생성 |

이 클러스터에서는 `/home01`에서 `qsub`를 하면 실패할 수 있습니다.

```text
qsub: ERROR: You can't submit job in home01 directory, please try in scratch directory
```

따라서 기억할 문장:

```text
home에서 준비하고, scratch로 복사하고, scratch에서 qsub 합니다.
계산이 끝나면 중요한 파일을 다시 home으로 복사합니다.
```

## 4. scratch는 영구 보관 장소가 아닙니다

공식 누리온 문서에 따르면 scratch 파일은 일정 기간 접근하지 않으면 삭제 대상이 될 수 있습니다.
삭제 대상 파일에는 `ToBeDelete_` 같은 접두사가 붙을 수 있고, 이후 실제 삭제될 수 있습니다.

초보자용 결론:

```text
/scratch에만 중요한 결과를 두지 마세요.
계산이 끝나면 /home01 아래로 복사하세요.
```

## 5. 파일을 home에서 scratch로 복사하기

예제로 `qe_test`라는 계산 폴더를 사용하겠습니다.

### 5.1 home에 원본 폴더 만들기

```bash
server$ mkdir -p ~/qe_projects/qe_test
server$ cd ~/qe_projects/qe_test
server$ pwd
```

여기에 입력 파일과 PBS script를 둡니다.

```text
scf.in
run_qe.pbs
pseudo/
```

### 5.2 scratch에 실행 폴더 만들기

```bash
server$ mkdir -p /scratch/$USER/qe_projects/qe_test
```

### 5.3 home에서 scratch로 복사하기

```bash
server$ cp -r ~/qe_projects/qe_test/* /scratch/$USER/qe_projects/qe_test/
```

뜻:

- `cp`: copy, 복사
- `-r`: 폴더 안까지 복사
- `*`: 현재 폴더 안의 여러 파일이라는 뜻

복사가 잘 되었는지 확인합니다.

```bash
server$ ls -lh /scratch/$USER/qe_projects/qe_test
```

파일 이름을 바꾸고 싶을 때는 `mv`를 씁니다.

```bash
server$ mv old_name.in new_name.in
```

`mv`는 move의 줄임말이지만, 같은 폴더 안에서 쓰면 “이름 바꾸기”가 됩니다.

## 6. scratch에서 job 제출하기

```bash
server$ cd /scratch/$USER/qe_projects/qe_test
server$ pwd
server$ qsub run_qe.pbs
```

`pwd` 결과가 반드시 `/scratch`로 시작해야 합니다.

job 상태 확인:

```bash
server$ qstat -u $USER
```

job 취소:

```bash
server$ qdel JOBID
```

`JOBID`는 `qsub` 후 나오는 번호입니다. 예: `22365267.pbs`

## 7. 계산 결과를 home으로 복사하기

계산이 끝났으면 중요한 파일을 home에 보관합니다.

```bash
server$ mkdir -p ~/qe_projects/qe_test/results
server$ cp -r /scratch/$USER/qe_projects/qe_test/* ~/qe_projects/qe_test/results/
```

복사 후 확인:

```bash
server$ ls -lh ~/qe_projects/qe_test/results
```

큰 계산에서는 `tmp/` 폴더가 매우 클 수 있습니다.
처음에는 담당자에게 “tmp도 복사해야 하나요?”라고 확인하는 것이 좋습니다.
restart 계산이 필요하면 `tmp/`가 필요할 수 있습니다.

## 8. PBS 기본 명령

누리온은 PBS scheduler를 사용합니다.

```bash
server$ qsub run_qe.pbs        # job 제출
server$ qstat -u $USER         # 내 job 보기
server$ qstat -f JOBID         # job 자세히 보기
server$ qdel JOBID             # job 취소
server$ qstat -q               # queue 목록 보기
```

누리온에서 추가로 유용한 명령:

```bash
server$ showq
server$ pbs_status
server$ pbs_queue_check
```

SRU time 사용량은 다음 명령으로 확인합니다.

```bash
server$ isam
```

SRU time은 슈퍼컴퓨터 사용량을 나타내는 단위라고 생각하면 됩니다.

## 9. queue는 처음에 이것만 기억하기

| Queue | 언제 쓰나요? |
|---|---|
| `debug` | 짧은 테스트 |
| `normal` | 일반 KNL 계산 |
| `long` | 오래 걸리는 KNL 계산 |
| `norm_skl` | SKL 계산 |

현재 사용할 수 있는 queue는 계정과 시스템 상태에 따라 달라질 수 있습니다.

```bash
server$ qstat -q
server$ pbs_queue_check
```

## 10. QE module load

이 머신에서 확인된 QE module:

```text
qe/6.1
qe/6.4.1
qe/6.6
qe/7.2(default)
qe/7.3.1
qe/7.5
```

짧은 테스트는 `debug` queue에서 했고, 이때는 KNL용 module을 사용했습니다.

```bash
module purge
module load craype-mic-knl
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

SKL queue, 예를 들어 `norm_skl`을 쓸 때는 architecture module을 바꿉니다.

```bash
module purge
module load craype-x86-skylake
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

초보자용 구분:

```text
debug 테스트  -> craype-mic-knl
norm_skl 계산 -> craype-x86-skylake
```

QE job script에는 아래 줄이 필요합니다.

```bash
#PBS -A qe
```

## 11. 가장 작은 PBS 예제

아래는 `debug` queue에서 QE 실행 방법만 확인하는 script입니다.
진짜 계산용이 아니라 launch test용입니다.

파일 이름 예:

```text
run_qe_test.pbs
```

내용:

```bash
#!/bin/bash -l
#PBS -N qe_test
#PBS -A qe
#PBS -q debug
#PBS -l select=1:ncpus=2:mpiprocs=2
#PBS -l walltime=00:05:00
#PBS -j oe

cd "$PBS_O_WORKDIR"

module purge
module load craype-mic-knl
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5

NP=$(wc -l < "$PBS_NODEFILE")

echo "host: $(hostname)"
echo "workdir: $(pwd)"
echo "PBS_JOBID: $PBS_JOBID"
echo "NP: $NP"

which mpirun
which pw.x
which xspectra.x

mpirun -np "$NP" pw.x -in pw_dummy.in > pw_dummy.out 2>&1
mpirun -np "$NP" xspectra.x -in xspectra_dummy.in > xspectra_dummy.out 2>&1
```

제출:

```bash
server$ cd /scratch/$USER/qe_launch_test
server$ qsub run_qe_test.pbs
```

## 12. output 파일 찾기

PBS는 보통 이런 이름의 파일을 만듭니다.

```text
JOBNAME.oJOBID
```

예:

```text
qe_test.o22365267
```

확인:

```bash
server$ ls -lh
server$ tail -n 80 qe_test.o22365267
```

QE 계산 자체의 output은 script에서 정한 이름으로 생깁니다.

```text
pw_dummy.out
xspectra_dummy.out
```

확인:

```bash
server$ tail -n 80 pw_dummy.out
server$ tail -n 80 xspectra_dummy.out
```

## 13. 초보자 체크리스트

제출 전:

```bash
server$ pwd
server$ ls
```

확인할 것:

- 지금 위치가 `/scratch` 아래인가요?
- `.pbs` 파일이 있나요?
- QE input 파일이 있나요?
- 필요한 pseudo 파일이 있나요?

제출:

```bash
server$ qsub run_qe.pbs
```

상태 확인:

```bash
server$ qstat -u $USER
```

끝난 후:

```bash
server$ cp -r /scratch/$USER/qe_projects/qe_test/* ~/qe_projects/qe_test/results/
```

## 14. 자주 하는 실수

1. `/home01`에서 `qsub` 실행

해결:

```bash
server$ cd /scratch/$USER/내_계산_폴더
server$ qsub run_qe.pbs
```

2. `server$`까지 복사해서 입력

해결: `server$`는 설명용입니다. 그 뒤 명령어만 입력합니다.

3. 계산 결과를 scratch에만 둠

해결:

```bash
server$ cp -r /scratch/$USER/내_계산_폴더/* ~/저장할_폴더/
```

4. `#PBS -A qe`를 빼먹음

해결: QE PBS script에 아래 줄을 넣습니다.

```bash
#PBS -A qe
```

5. 로그인 노드에서 직접 큰 계산 실행

해결: `pw.x`를 직접 오래 실행하지 말고 PBS script로 제출합니다.
