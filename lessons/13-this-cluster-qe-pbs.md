# 13. 누리온(NURION)에서 QE 실행하기: PBS, scratch, 파일 관리

이 장은 워크숍에서 실제로 접속한 KISTI 슈퍼컴퓨터 5호기 누리온(NURION) 환경을 기준으로 작성했습니다.
터미널을 처음 쓰는 사람도 그대로 따라 할 수 있도록, 명령어를 입력하는 위치와 이유를 함께 설명합니다.

공식 문서 참고:

- 누리온 지침서: https://docs-ksc.gitbook.io/nurion-user-guide/readme
- 사용자 환경: https://docs-ksc.gitbook.io/nurion-user-guide/undefined/user-experience
- PBS 작업 실행: https://docs-ksc.gitbook.io/nurion-user-guide/undefined/running-jobs-through-scheduler-pbs
- 시스템 개요 및 구성: https://docs-ksc.gitbook.io/nurion-user-guide/undefined/nurion-system-overview-and-configuration

이 장에서 `server$`는 누리온에 SSH로 접속한 뒤, 로그인 노드에서 입력하는 명령이라는 뜻입니다.
`server$` 글자는 입력하지 않습니다.

## 1. 누리온은 어떤 컴퓨터인가?

누리온은 개인 PC 한 대가 아니라, 많은 계산 노드가 네트워크와 병렬 파일시스템으로 연결된 초고성능 컴퓨팅(HPC) 클러스터입니다.
공식 지침서에 따르면 누리온은 리눅스 기반 초병렬 클러스터이며, KNL(Intel Xeon Phi 7250) 계산 노드와 SKL(Intel Xeon Gold 6148) 계산 노드로 구성되어 있습니다.

초보자는 다음 그림처럼 이해하면 됩니다.

```text
내 노트북
   |
   | ssh
   v
로그인 노드 login01
   |
   | qsub로 작업 제출
   v
계산 노드들: KNL node, SKL node
   |
   v
/scratch/$USER 에 계산 결과 저장
```

중요한 구분:

- 로그인 노드: 접속, 파일 편집, `qsub`, `qstat` 같은 가벼운 작업을 하는 곳
- 계산 노드: 실제 무거운 계산이 돌아가는 곳
- home(`/home01/$USER`): 오래 보관할 파일을 두는 곳
- scratch(`/scratch/$USER`): 계산을 실행하고 큰 출력 파일을 쓰는 곳

무거운 QE 계산을 로그인 노드에서 직접 실행하지 마세요.
로그인 노드에서는 입력 파일 작성, 모듈 확인, job 제출만 합니다.

## 2. 현재 내가 누리온에 있는지 확인

접속 후 아래 명령어를 입력해 봅니다.

```bash
server$ hostname
server$ whoami
server$ pwd
server$ echo $HOME
```

이 워크숍 계정에서 확인된 예시는 다음과 같습니다.

```text
hostname  -> login01
HOME      -> /home01/a2114a01
```

`pwd`는 현재 위치를 보여 줍니다.
처음에는 보통 home 아래에 있습니다.

```bash
server$ pwd
/home01/a2114a01
```

## 3. 로그인과 파일 전송: 공식 지침서 기준

공식 누리온 사용자 환경 문서에 따르면 로그인 주소는 다음과 같습니다.

```bash
local$ ssh -l 사용자ID nurion.ksc.re.kr
```

예:

```bash
local$ ssh -l x123abc nurion.ksc.re.kr
```

`local$`는 내 노트북 터미널이라는 뜻입니다.
누리온에 접속한 뒤에는 프롬프트가 서버 쪽으로 바뀝니다.

파일 전송은 Datamover 노드 사용을 권장합니다.
공식 문서의 파일 전송 주소:

```bash
local$ sftp 사용자ID@nurion-dm.ksc.re.kr
```

또는 FTP/SFTP 클라이언트(예: WinSCP)를 사용할 수 있습니다.
공식 문서에서는 `wget`, `git`, 큰 파일 전송, 압축/해제 같은 작업은 로그인 노드보다 Datamover 노드 사용을 권장합니다.
로그인 노드에는 CPU limit이 있어 긴 전송이나 압축 작업이 중간에 끊길 수 있습니다.

## 4. 스케줄러는 PBS입니다

누리온은 Slurm이 아니라 PBS 계열 스케줄러를 사용합니다.
이 머신에서 확인된 명령 위치는 다음과 같습니다.

```bash
server$ command -v qsub
/opt/pbs/bin/qsub

server$ command -v qstat
/opt/pbs/bin/qstat

server$ command -v qdel
/opt/pbs/bin/qdel
```

자주 쓰는 명령:

```bash
server$ qsub run_qe.pbs        # job 제출
server$ qstat -u $USER         # 내 job 목록 보기
server$ qstat -f JOBID         # job 상세 정보 보기
server$ qdel JOBID             # job 취소
server$ qstat -q               # queue 목록 보기
```

누리온에는 보조 확인 명령도 있습니다.

```bash
server$ showq                  # queue 전체 상황 보기
server$ pbs_status             # queue별 유휴 자원 보기
server$ pbs_queue_check        # 내가 사용할 수 있는 queue 확인
```

`JOBID`는 `qsub`를 했을 때 나오는 번호입니다.
예를 들어 `22365267.pbs`가 job id라면 다음처럼 봅니다.

```bash
server$ qstat -f 22365267.pbs
```

## 5. home과 scratch를 구분해야 합니다

공식 지침서에 따르면 누리온 사용자는 두 개의 주요 파일시스템을 받습니다.

```text
/home01/$USER     home directory
/scratch/$USER    scratch directory
```

이 워크숍 계정에서는 다음처럼 보입니다.

```text
/home01/a2114a01
/scratch/a2114a01
```

역할은 다릅니다.

| 위치 | 용도 | 초보자용 설명 |
|---|---|---|
| `/home01/$USER` | 장기 보관 | 입력 파일, PBS script, 정리한 결과, 노트 보관 |
| `/scratch/$USER` | 계산 실행 | `qsub`를 실행하고 QE output/tmp 파일을 쓰는 곳 |

이 클러스터에서는 `/home01` 아래에서 job을 제출하면 오류가 날 수 있습니다.

```text
qsub: ERROR: You can't submit job in home01 directory, please try in scratch directory
```

따라서 원칙은 간단합니다.

```text
home에서 준비하고,
scratch로 복사하고,
scratch에서 qsub 하고,
끝나면 home으로 다시 복사합니다.
```

## 6. scratch 파일은 자동 삭제될 수 있습니다

공식 사용자 환경 문서에는 scratch 파일 삭제 정책이 설명되어 있습니다.
핵심은 다음과 같습니다.

- 파일 삭제 정책은 atime(access time, 마지막 접근 시간)을 기준으로 적용됩니다.
- 15일 동안 접근하지 않은 파일은 삭제 대상이 될 수 있습니다.
- 삭제 대상 파일에는 먼저 `ToBeDelete_` 접두사가 붙을 수 있습니다.
- 일정 기간 후에는 실제 삭제되며, 삭제 후 복구는 기본적으로 불가능합니다.

초보자에게 가장 중요한 결론:

```text
/scratch는 영구 보관 장소가 아닙니다.
계산이 끝나면 중요한 파일을 /home01 아래로 복사하세요.
```

파일의 접근 시간을 확인하는 명령:

```bash
server$ stat filename
server$ ls -lu filename
```

현재 용량 사용량은 다음처럼 확인합니다.

```bash
server$ lfs quota -h /home01
server$ lfs quota -h /scratch
```

## 7. 추천 작업 흐름: 처음부터 끝까지

예를 들어 `si_test`라는 QE 계산을 한다고 가정합니다.

### 7.1 home에 원본 폴더 만들기

```bash
server$ mkdir -p ~/qe_projects/si_test
server$ cd ~/qe_projects/si_test
```

여기에 오래 보관할 파일을 둡니다.

```text
scf.in
run_qe.pbs
pseudo/
README.md
```

### 7.2 scratch로 복사

```bash
server$ mkdir -p /scratch/$USER/qe_projects
server$ rsync -av ~/qe_projects/si_test/ /scratch/$USER/qe_projects/si_test/
```

명령의 뜻:

- `mkdir -p`: 폴더가 없으면 만듭니다.
- `rsync -av A/ B/`: A 폴더 안의 내용을 B 폴더로 복사합니다.
- 마지막 `/`가 중요합니다. `si_test/` 안의 내용을 복사한다는 뜻입니다.

### 7.3 scratch로 이동해서 제출

```bash
server$ cd /scratch/$USER/qe_projects/si_test
server$ pwd
server$ qsub run_qe.pbs
```

`pwd` 결과가 `/scratch`로 시작하는지 꼭 확인하세요.

### 7.4 job 상태 확인

```bash
server$ qstat -u $USER
```

상태 문자 예:

```text
Q  대기 중
R  실행 중
E  종료 처리 중 또는 오류 상태
H  hold 상태
```

상세 확인:

```bash
server$ qstat -f JOBID
```

자주 보는 항목:

```text
job_state
queue
exec_host
resources_used.walltime
resources_used.cput
resources_used.mem
resources_used.ncpus
Resource_List.walltime
Resource_List.select
```

### 7.5 계산 후 home으로 결과 복사

작은 테스트 계산이면 전체 복사해도 됩니다.

```bash
server$ mkdir -p ~/qe_projects/si_test/results
server$ rsync -av /scratch/$USER/qe_projects/si_test/ ~/qe_projects/si_test/results/
```

큰 QE 계산에서는 `tmp/`가 매우 클 수 있습니다.
restart 파일이 필요 없으면 `tmp/`를 제외합니다.

```bash
server$ rsync -av --exclude='tmp/' /scratch/$USER/qe_projects/si_test/ ~/qe_projects/si_test/results/
```

restart, charge density, wavefunction이 필요하면 `tmp/`를 제외하지 마세요.

## 8. queue 요약

공식 문서와 현재 머신 확인 결과를 바탕으로, 초보자가 먼저 알면 좋은 queue는 다음과 같습니다.

| Queue | 노드 종류 | 최대 walltime | 용도 |
|---|---|---:|---|
| `debug` | KNL | 12:00:00 | 짧은 테스트, 디버깅 |
| `normal` | KNL | 48:00:00 | 일반 KNL 계산 |
| `long` | KNL | 120:00:00 | 긴 KNL 계산 |
| `flat` | KNL | 48:00:00 | KNL flat memory mode |
| `norm_skl` | SKL | 48:00:00 | 일반 SKL 계산 |
| `commercial` | SKL | 48:00:00 | 상용 SW용 queue |

현재 queue 상태는 변할 수 있으므로 직접 확인합니다.

```bash
server$ qstat -q
server$ pbs_queue_check
```

공식 문서 기준:

- `debug`와 `commercial` queue는 공유 노드 정책이 적용될 수 있습니다.
- 그 외 일반 queue는 보통 배타적 노드 할당 정책입니다.
- KNL은 노드당 최대 68 thread/core, SKL은 노드당 최대 40 thread/core 사용으로 이해하면 됩니다.

## 9. walltime 설정

PBS script에서 walltime을 지정합니다.

```bash
#PBS -l walltime=HH:MM:SS
```

예:

```bash
#PBS -l walltime=00:10:00   # 10분
#PBS -l walltime=01:00:00   # 1시간
#PBS -l walltime=12:00:00   # 12시간
#PBS -l walltime=48:00:00   # 2일
#PBS -l walltime=120:00:00  # 5일, long queue용
```

요청한 walltime을 넘으면 job이 종료될 수 있습니다.
너무 짧으면 계산이 중간에 죽고, 너무 길면 queue에서 오래 기다릴 수 있습니다.

## 10. SRU time 사용량 확인

누리온 공식 문서에 따르면 계정의 계약 정보, 배치 작업 사용 상세내역, 총 SRU time 사용량은 `isam` 명령으로 확인할 수 있습니다.

```bash
server$ isam
```

이 머신에서 `isam` 명령은 다음 위치에 있습니다.

```bash
server$ command -v isam
/usr/local/bin/isam
```

초보자 메모:

- SRU time은 슈퍼컴퓨터 자원 사용량을 세는 단위라고 생각하면 됩니다.
- 계산 노드를 오래, 많이 쓸수록 사용량이 증가합니다.
- 워크숍이나 과제 계정에서는 남은 사용량을 가끔 확인하는 습관이 좋습니다.

## 11. module이란?

HPC에서는 프로그램을 바로 실행하지 않고 `module load`로 환경을 먼저 설정하는 경우가 많습니다.
`module load`는 PATH, 라이브러리 경로 등을 맞춰 주는 명령입니다.

자주 쓰는 module 명령:

```bash
server$ module avail           # 사용 가능한 module 보기
server$ module avail qe        # QE 관련 module 보기
server$ module list            # 현재 loaded module 보기
server$ module purge           # loaded module 모두 제거
server$ module load qe/7.5     # qe/7.5 module load
server$ module show qe/7.5     # module이 무엇을 설정하는지 보기
```

이 머신에서 확인된 QE module:

```text
qe/6.1
qe/6.4.1
qe/6.6
qe/7.2(default)
qe/7.3.1
qe/7.5
```

## 12. QE module load: KNL과 SKL을 구분하세요

누리온에는 KNL 노드와 SKL 노드가 있습니다.
어떤 queue를 쓰는지에 따라 architecture module을 다르게 load해야 합니다.

### 12.1 debug/KNL queue 테스트용

`debug` queue에서 실제로 launch test가 성공한 조합:

```bash
module purge
module load craype-mic-knl
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

### 12.2 SKL queue용

`norm_skl` 같은 SKL queue에서는 다음 조합을 사용합니다.

```bash
module purge
module load craype-x86-skylake
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

주의:

- `debug` queue에서 `craype-x86-skylake`로 실행하면 AVX512 관련 오류가 날 수 있습니다.
- `debug` 테스트는 `craype-mic-knl`을 사용하세요.
- `norm_skl` 같은 SKL queue에서는 `craype-x86-skylake`를 사용하세요.

QE module은 다음 안내를 출력합니다.

```text
Please add PBS option w.r.t. 'qe/7.5', as follows:

'#PBS -A qe'
```

따라서 QE job script에는 반드시 다음 줄을 넣습니다.

```bash
#PBS -A qe
```

공식 PBS 문서에서도 Quantum ESPRESSO의 Application PBS 옵션 이름은 `qe`입니다.

## 13. PBS script의 기본 구조

PBS script는 “계산을 어떻게 실행할지 적어 둔 파일”입니다.
예를 들어 `run_qe.pbs`라는 파일을 만들고 `qsub run_qe.pbs`로 제출합니다.

기본 구조:

```bash
#!/bin/bash -l
#PBS -N job_name
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

mpirun -np 2 pw.x -in scf.in > scf.out 2>&1
```

각 줄의 뜻:

| 줄 | 뜻 |
|---|---|
| `#PBS -N job_name` | job 이름 |
| `#PBS -A qe` | 사용 application 이름: QE |
| `#PBS -q debug` | 사용할 queue |
| `#PBS -l select=...` | 사용할 node/core/MPI process 수 |
| `#PBS -l walltime=...` | 최대 실행 시간 |
| `#PBS -j oe` | stdout과 stderr를 한 파일로 합침 |
| `cd "$PBS_O_WORKDIR"` | qsub를 실행한 폴더로 이동 |
| `module load ...` | QE 실행 환경 설정 |
| `mpirun ... pw.x ...` | QE 실행 |

## 14. pw.x와 xspectra.x launch test script

아래 script는 실제 물리 계산용이 아니라, `pw.x`와 `xspectra.x`가 PBS + MPI 환경에서 시작되는지 확인하는 용도입니다.
입력 파일이 dummy이면 프로그램이 중간에 오류로 멈추는 것이 정상입니다.

```bash
#!/bin/bash -l
#PBS -N qe_launch_test
#PBS -A qe
#PBS -q debug
#PBS -l select=1:ncpus=2:mpiprocs=2
#PBS -l walltime=00:05:00
#PBS -j oe

cd "$PBS_O_WORKDIR"

if ! type module >/dev/null 2>&1; then
  source /etc/profile.d/modules.sh 2>/dev/null || true
fi

module purge
module load craype-mic-knl
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5

mkdir -p tmp pseudo

NP=$(wc -l < "$PBS_NODEFILE")

echo "date: $(date)"
echo "host: $(hostname)"
echo "workdir: $(pwd)"
echo "PBS_JOBID: $PBS_JOBID"
echo "PBS_QUEUE: $PBS_QUEUE"
echo "NP: $NP"
echo "nodes:"
sort -u "$PBS_NODEFILE"

module list 2>&1
which mpirun
which pw.x
which xspectra.x

mpirun -np "$NP" pw.x -in pw_dummy.in > pw_dummy.out 2>&1
mpirun -np "$NP" xspectra.x -in xspectra_dummy.in > xspectra_dummy.out 2>&1
```

제출:

```bash
server$ cd /scratch/$USER/qe_launch_test
server$ qsub pbs_script/run_qe_launch_test_knl.pbs
```

확인:

```bash
server$ qstat -u $USER
server$ ls -lh
server$ ls -lh output
```

이 머신에서 dummy input으로 확인한 launch 결과:

```text
Program PWSCF v.7.5 starts
Parallel version (MPI), running on 2 processors

Program XSpectra v.7.5 starts
Parallel version (MPI), running on 2 processors
```

`pw.x`는 fake pseudopotential 때문에 아래 오류에서 멈췄습니다.

```text
Error in routine readpp:
file ./pseudo/H.fake.UPF not found
```

이것은 launch test에서는 괜찮습니다.
프로그램이 PBS + MPI 안에서 시작되었다는 것이 중요합니다.

## 15. PBS output 파일 이해

기본적으로 PBS는 다음 이름의 output file을 만듭니다.

```text
JOBNAME.oJOBID
JOBNAME.eJOBID
```

예:

```text
qe_launch_test.o22365267
```

PBS script에 다음 줄이 있으면 stdout과 stderr를 하나로 합칩니다.

```bash
#PBS -j oe
```

특정 output 파일명을 지정할 수도 있습니다.

```bash
#PBS -o /scratch/$USER/qe_launch_test/qe_launch_test.out
```

하지만 여러 job이 같은 파일 이름에 쓰면 헷갈릴 수 있습니다.
실제 계산에서는 job id를 파일명에 넣는 방식이 안전합니다.

```bash
mpirun -np "$NP" pw.x -in scf.in > scf.${PBS_JOBID}.out 2>&1
```

공식 PBS 문서에 따르면 PBS output은 작업 완료 후 제출 디렉터리로 복사됩니다.
실행 중 output을 확인해야 하는 특별한 경우에는 공식 문서의 `#PBS -W sandbox=PRIVATE` 옵션도 참고하세요.

## 16. 초보자용 빠른 체크리스트

### 제출 전

```bash
server$ cd /scratch/$USER/my_qe_run
server$ pwd
server$ ls
server$ qstat -q
```

확인할 것:

- `pwd` 결과가 `/scratch`로 시작하나요?
- `.in` 파일이 있나요?
- `.pbs` 파일이 있나요?
- `pseudo/` 폴더가 필요한 계산이면 pseudo 파일이 있나요?

### PBS script 안에 있어야 할 것

QE 계산이면:

```bash
#PBS -A qe
```

짧은 KNL 테스트면:

```bash
#PBS -q debug
#PBS -l select=1:ncpus=2:mpiprocs=2
#PBS -l walltime=00:05:00
module load craype-mic-knl
```

SKL queue 계산이면:

```bash
#PBS -q norm_skl
#PBS -l select=1:ncpus=40:mpiprocs=40
#PBS -l walltime=24:00:00
module load craype-x86-skylake
```

### 제출

```bash
server$ qsub run_qe.pbs
```

### 확인

```bash
server$ qstat -u $USER
```

### 끝난 후 home으로 복사

```bash
server$ rsync -av --exclude='tmp/' /scratch/$USER/my_qe_run/ ~/qe_projects/my_qe_run/results/
```

restart 파일이 필요하면:

```bash
server$ rsync -av /scratch/$USER/my_qe_run/ ~/qe_projects/my_qe_run/results_with_restart/
```

## 17. 자주 하는 실수

1. `/home01`에서 `qsub` 실행

```text
해결: /scratch/$USER/... 로 이동한 뒤 qsub 합니다.
```

2. `server$`까지 복사해서 입력

```text
해결: server$는 설명용 prompt입니다. 그 뒤의 명령어만 입력합니다.
```

3. `debug` queue에서 SKL module 사용

```text
해결: debug 테스트는 craype-mic-knl을 사용합니다.
```

4. scratch에 결과를 오래 방치

```text
해결: 계산이 끝나면 rsync로 home에 복사합니다.
```

5. `#PBS -A qe` 누락

```text
해결: QE 계산 script에는 #PBS -A qe를 넣습니다.
```

6. 로그인 노드에서 직접 큰 QE 계산 실행

```text
해결: 로그인 노드는 qsub 제출용입니다. 실제 계산은 PBS job으로 실행합니다.
```
