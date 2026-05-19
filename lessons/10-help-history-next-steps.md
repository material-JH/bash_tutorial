# 10. 도움말, 기록, 자동완성, 단축키

명령어를 모두 외울 필요는 없습니다. 대신 도움말을 찾는 방법을 알아야 합니다.

## 짧은 도움말: `--help`

```bash
server$ ls --help
server$ cp --help
```

출력이 너무 길면 `more`로 넘겨서 봅니다.

```bash
server$ ls --help | more
```

나가려면 `q`를 누릅니다.

## 매뉴얼: `man`

```bash
server$ man ls
```

`man` 안에서 자주 쓰는 키:

| 키 | 동작 |
|---|---|
| Space | 다음 페이지 |
| `b` | 이전 페이지 |
| `/word` | word 검색 |
| `n` | 다음 검색 결과 |
| `q` | 종료 |

## 명령어 기록: `history`

```bash
server$ history
```

이전 명령을 다시 불러오려면 위쪽 화살표를 누릅니다.

기록 검색:

```text
Ctrl + R
```

## 자동완성: Tab

명령어나 경로를 조금 입력한 뒤 Tab을 누르면 자동완성이 됩니다.

예:

```bash
server$ cd ~/linux-pr<Tab>
```

아래처럼 완성될 수 있습니다.

```bash
server$ cd ~/linux-practice
```

자동완성은 오타를 줄이고 긴 경로 입력을 편하게 합니다.

## 자주 쓰는 단축키

| 단축키 | 의미 |
|---|---|
| `Ctrl + C` | 실행 중인 명령 중지 |
| `Ctrl + L` | 화면 정리 |
| `Ctrl + A` | 줄 맨 앞으로 이동 |
| `Ctrl + E` | 줄 맨 뒤로 이동 |
| `Ctrl + U` | 커서 앞부분 삭제 |
| `Ctrl + K` | 커서 뒷부분 삭제 |
| `Ctrl + R` | 명령 기록 검색 |

## 에러 읽는 법

예:

```bash
server$ cd no-such-folder
```

출력:

```text
bash: cd: no-such-folder: No such file or directory
```

천천히 읽으면 다음을 알 수 있습니다.

- 실패한 명령어: `cd`
- 사용하려던 대상: `no-such-folder`
- 실패 이유: 그런 파일이나 폴더가 없음

Quantum ESPRESSO 실행 에러도 같은 방식으로 읽습니다.

```bash
server$ ./fake-pw.x > run.out 2> run.err
server$ cat run.err
```

에러 메시지에서 확인할 것:

- 어떤 명령이 실패했는가?
- 어떤 입력 파일을 찾지 못했는가?
- stdout(`.out`)과 stderr(`.err`) 중 어디에 메시지가 있는가?

## 원격 서버 작업에서 자주 확인할 것

```bash
server$ whoami
server$ hostname
server$ pwd
server$ command -v pw.x
server$ command -v mpirun
```

특히 여러 서버를 쓰는 사람은 `hostname`으로 내가 어느 서버에 있는지 자주 확인하세요.

## 다음에 배울 만한 명령어

| 주제 | 명령어 |
|---|---|
| 파일 다운로드 | `curl`, `wget` |
| 압축 | `tar`, `zip`, `unzip` |
| 프로세스 확인 | `ps`, `top`, `kill` |
| 디스크 사용량 | `df`, `du` |
| 파일 전송 | `scp`, `rsync`, `sftp` |
| 원격 접속 | `ssh` |
| 환경 모듈 | `module avail`, `module load`, `module list` |
| 작업 스케줄러 | `sbatch`, `squeue`, `scancel` |
| 버전 관리 | `git` |
| 텍스트 처리 | `sort`, `uniq`, `cut`, `sed`, `awk` |

## 체크포인트

1. `more`나 `man`에서 나가려면 어떤 키를 누르나요?
2. 실행 중인 명령을 멈추려면 어떤 단축키를 쓰나요?
3. `command -v pw.x`는 무엇을 확인하나요?
4. Tab 자동완성은 왜 유용한가요?
