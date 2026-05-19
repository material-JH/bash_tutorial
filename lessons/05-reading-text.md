# 5. 텍스트 파일 읽기: `cat`, `more`, `vim`, `head`, `tail`

리눅스 서버에서는 입력 파일, 출력 파일, 로그 파일을 텍스트로 읽는 일이 많습니다.

이 장에서는 저장소에 포함된 예제 파일을 사용합니다. 파일을 `printf`로 만들지 않습니다.

```bash
server$ cd ~/linux-practice/examples
```

## 짧은 파일 전체 출력: `cat`

```bash
server$ cat text/sample.txt
```

`cat`은 짧은 파일을 빠르게 볼 때 좋습니다. 매우 긴 Quantum ESPRESSO 출력 파일에는 불편할 수 있습니다.

## 긴 파일 페이지 단위로 보기: `more`

```bash
server$ more text/sample.txt
```

`more` 안에서 자주 쓰는 키:

| 키 | 동작 |
|---|---|
| Space | 다음 페이지 |
| Enter | 다음 줄 |
| `q` | 종료 |

나가고 싶으면 `q`를 누르세요.

## 읽고 검색하기: `vim`

`vim`은 편집기이지만 파일을 읽고 검색할 때도 유용합니다.

```bash
server$ vim text/qe-output-snippet.out
```

vim에서:

| 키 | 동작 |
|---|---|
| `/total energy` | `total energy` 검색 |
| `n` | 다음 검색 결과 |
| `G` | 파일 맨 아래로 이동 |
| `gg` | 파일 맨 위로 이동 |
| `:q` | 종료 |

실수로 입력 모드에 들어갔다면 `Esc`를 누른 뒤 `:q`로 나가면 됩니다.

## 앞부분 보기: `head`

```bash
server$ head text/sample.txt
server$ head -n 3 text/sample.txt
```

`head -n 3`은 앞의 3줄만 보여줍니다.

Quantum ESPRESSO 출력 파일의 시작 부분을 볼 때:

```bash
server$ head -n 30 text/qe-output-snippet.out
```

## 뒷부분 보기: `tail`

```bash
server$ tail text/sample.txt
server$ tail -n 5 text/sample.txt
```

Quantum ESPRESSO 출력 파일은 마지막 부분에 수렴 여부나 종료 메시지가 있는 경우가 많습니다.

```bash
server$ tail -n 30 text/qe-output-snippet.out
```

## 계속 지켜보기: `tail -f`

계산이 실행 중일 때 출력 파일이 계속 커질 수 있습니다.

```bash
server$ tail -f text/app.log
```

멈추려면:

```text
Ctrl + C
```

실제 Quantum ESPRESSO 계산 중에는 예를 들어:

```bash
server$ tail -f si.scf.out
```

처럼 사용할 수 있습니다.

## 바이너리 파일은 텍스트처럼 읽지 않기

일부 계산 파일은 사람이 읽는 텍스트가 아닙니다.

```bash
server$ cd ~/linux-practice/examples/binary
server$ file fake-wfc.dat
server$ hexdump -C fake-wfc.dat | more
server$ strings fake-wfc.dat
```

`file`은 파일 종류를 알려 줍니다. `hexdump -C`는 바이너리 내용을 16진수로 보여 줍니다. `strings`는 바이너리 안에서 읽을 수 있는 문자열만 뽑아 봅니다.

Quantum ESPRESSO의 wavefunction 파일, charge-density 관련 파일은 텍스트가 아닐 수 있으므로 `vim`이나 `more`로 무작정 열지 않는 것이 좋습니다.

## 체크포인트

1. 짧은 파일을 바로 출력할 때는 어떤 명령어가 편한가요?
2. 페이지 단위로 읽을 때 이 튜토리얼에서는 어떤 명령어를 쓰나요?
3. vim에서 검색은 어떻게 하나요?
4. 바이너리 파일인지 확인하는 명령어는 무엇인가요?
