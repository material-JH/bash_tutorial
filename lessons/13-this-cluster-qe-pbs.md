# 13. 이 클러스터에서 QE 실행하기: PBS, scratch, 파일 관리

이 장은 현재 접속한 클러스터에서 Quantum ESPRESSO(QE)를 실행할 때 필요한 실제 명령을 정리합니다.
일반적인 리눅스 명령 설명이 아니라, 이 머신 전용 메모입니다.

핵심 요약:

- 스케줄러는 Slurm이 아니라 PBS/OpenPBS입니다.
- 작업 제출은 `qsub`로 합니다.
- `/home01` 아래에서는 job submit이 막혀 있습니다.
- 실제 계산은 `/scratch/$USER` 아래에서 제출하고 실행합니다.
- 중요한 입력 파일과 결과 파일은 계산 후 home으로 복사해 보관합니다.
- QE module을 사용할 때 `#PBS -A qe`가 필요합니다.

## 1. 스케줄러 확인

이 클러스터에서 확인된 PBS 명령:

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
server$ pbsnodes -aSj          # node 상태 요약
```

Slurm 명령인 `sbatch`, `squeue`, `srun`이 아니라 PBS 명령을 사용합니다.

## 2. home과 scratch의 역할

Home directory:

```bash
/home01/$USER
```

Scratch directory:

```bash
/scratch/$USER
```

이 클러스터에서는 `/home01`에서 `qsub`를 하면 다음과 같은 오류가 날 수 있습니다.

```text
qsub: ERROR: You can't submit job in home01 directory, please try in scratch directory
```

따라서 다음처럼 생각하면 됩니다.

```text
/home01/$USER      오래 보관할 입력 파일, 스크립트, 최종 결과
/scratch/$USER     실제 계산 실행 위치, 큰 임시 파일, job output
```

## 3. 추천 작업 흐름

### 3.1 home에 프로젝트 원본 만들기

```bash
server$ mkdir -p ~/qe_projects/test1
server$ cd ~/qe_projects/test1
```

home에는 다음 파일을 보관합니다.

```text
*.in
*.pbs
pseudo/
README.md
분석 스크립트
중요한 최종 결과
```

### 3.2 scratch로 복사

```bash
server$ mkdir -p /scratch/$USER/qe_projects
server$ rsync -av ~/qe_projects/test1/ /scratch/$USER/qe_projects/test1/
```

### 3.3 scratch에서 제출

```bash
server$ cd /scratch/$USER/qe_projects/test1
server$ qsub run_qe.pbs
```

### 3.4 job 확인

```bash
server$ qstat -u $USER
server$ qstat -f JOBID
```

`qstat -f JOBID`에서 자주 보는 항목:

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

### 3.5 계산 후 home으로 복사

scratch는 며칠 뒤 정리될 수 있으므로 중요한 파일은 home으로 복사합니다.

작은 테스트 계산이면 전체 복사:

```bash
server$ mkdir -p ~/qe_projects/test1/results
server$ rsync -av /scratch/$USER/qe_projects/test1/ ~/qe_projects/test1/results/
```

큰 QE 계산에서는 `tmp/`가 매우 클 수 있습니다. restart 파일이 필요 없으면 제외합니다.

```bash
server$ rsync -av --exclude='tmp/' /scratch/$USER/qe_projects/test1/ ~/qe_projects/test1/results/
```

restart, charge density, wavefunction이 필요하면 `tmp/`를 제외하지 마세요.

## 4. queue 요약

확인된 주요 queue:

| Queue | 최대 walltime | 용도/메모 |
|---|---:|---|
| `normal` | 48:00:00 | 기본 queue |
| `flat` | 48:00:00 | 일반 queue |
| `norm_skl` | 48:00:00 | Skylake queue |
| `long` | 120:00:00 | 긴 계산 |
| `debug` | 12:00:00 | 짧은 테스트, 최대 2 nodes로 확인됨 |
| `commercial` | 48:00:00 | application queue |
| `eduf` | 48:00:00 | education queue |

현재 queue 상태는 항상 다시 확인하세요.

```bash
server$ qstat -q
```

## 5. walltime 설정

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

요청한 walltime을 넘으면 PBS가 job을 종료할 수 있습니다.
너무 길게 잡으면 queue 대기 시간이 늘어날 수 있으므로 적절히 잡습니다.

## 6. QE module load

확인된 QE version:

```text
qe/6.1
qe/6.4.1
qe/6.6
qe/7.2
qe/7.3.1
qe/7.5
```

QE 7.5를 권장합니다.

### 6.1 debug/KNL node에서 테스트

`debug` queue에서 실제 launch test가 성공한 조합:

```bash
module purge
module load craype-mic-knl
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

### 6.2 Skylake queue에서 실행

`norm_skl` 같은 Skylake queue에서는 다음 조합을 사용합니다.

```bash
module purge
module load craype-x86-skylake
module load intel/oneapi_21.2
module load impi/oneapi_21.2
module load qe/7.5
```

주의:

- `debug` queue에서 `craype-x86-skylake`로 실행했을 때 AVX512 관련 오류가 났습니다.
- `debug` 테스트는 `craype-mic-knl`로 실행하세요.
- Skylake queue에서는 `craype-x86-skylake`를 사용하세요.

QE module을 load하면 다음 안내가 나옵니다.

```text
Please add PBS option w.r.t. 'qe/7.5', as follows:

'#PBS -A qe'
```

따라서 QE PBS script에는 다음 줄을 넣습니다.

```bash
#PBS -A qe
```

## 7. pw.x와 xspectra.x launch test PBS script

아래는 `debug` queue에서 `pw.x`와 `xspectra.x`가 MPI로 실행되는지 확인하는 최소 script입니다.
입력은 dummy라서 계산 성공이 목적이 아닙니다. 프로그램이 PBS + MPI 환경에서 시작되는지 확인하는 용도입니다.

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

## 8. PBS output 파일

기본적으로 PBS는 다음 이름의 output file을 만듭니다.

```text
JOBNAME.oJOBID
JOBNAME.eJOBID
```

PBS script에 다음 줄이 있으면 stdout과 stderr를 하나로 합칩니다.

```bash
#PBS -j oe
```

특정 output 파일명을 지정할 수도 있습니다.

```bash
#PBS -o /scratch/$USER/qe_launch_test/qe_launch_test.out
```

하지만 여러 job이 같은 파일에 쓰면 헷갈릴 수 있습니다. 실제 계산에서는 job id를 파일명에 넣는 방식이 안전합니다.

```bash
mpirun -np "$NP" pw.x -in scf.in > scf.${PBS_JOBID}.out 2>&1
```

## 9. 이 머신에서 확인된 launch 결과

`scratch`에서 dummy input으로 실행했을 때 다음이 확인되었습니다.

```text
Program PWSCF v.7.5 starts
Parallel version (MPI), running on 2 processors

Program XSpectra v.7.5 starts
Parallel version (MPI), running on 2 processors
```

`pw.x`는 fake pseudopotential 때문에 다음 오류에서 멈췄습니다.

```text
Error in routine readpp:
file ./pseudo/H.fake.UPF not found
```

`xspectra.x`도 dummy input이라 input 관련 오류에서 멈췄습니다.

이것은 정상입니다. 목적은 실제 물리 계산이 아니라 launch 방법 확인이었습니다.

## 10. 빠른 체크리스트

계산 전:

```bash
server$ cd /scratch/$USER/my_qe_run
server$ pwd              # /scratch 아래인지 확인
server$ ls               # input, pbs script 확인
server$ qstat -q         # queue 상태 확인
```

PBS script 확인:

```bash
#PBS -A qe
#PBS -q debug            # 테스트면 debug
#PBS -l select=1:ncpus=2:mpiprocs=2
#PBS -l walltime=00:05:00
```

실제 계산 예:

```bash
#PBS -q normal
#PBS -l select=1:ncpus=40:mpiprocs=40
#PBS -l walltime=24:00:00
```

계산 후:

```bash
server$ rsync -av --exclude='tmp/' /scratch/$USER/my_qe_run/ ~/qe_projects/my_qe_run/results/
```

restart 파일까지 필요하면:

```bash
server$ rsync -av /scratch/$USER/my_qe_run/ ~/qe_projects/my_qe_run/results_with_restart/
```
