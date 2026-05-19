# 7. 와일드카드, 파이프, 리다이렉션

셸의 힘은 여러 파일을 한 번에 다루고, 명령어끼리 연결할 수 있다는 데 있습니다.

예제 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice/examples
```

## 와일드카드 `*`

`*`는 “아무 글자나 0개 이상”을 뜻합니다.

`.txt`로 끝나는 파일:

```bash
server$ ls text/*.txt
```

`.out`으로 끝나는 파일:

```bash
server$ ls qe/*.out
```

`.in`으로 끝나는 Quantum ESPRESSO 입력 파일:

```bash
server$ ls qe/*.in
```

## 삭제 전에 반드시 미리 보기

좋은 습관:

```bash
server$ ls qe/*.out
```

목록이 맞는지 확인한 뒤에만 삭제 명령을 생각하세요.

```bash
server$ rm qe/*.out
```

초보자는 와일드카드와 `rm`을 함께 쓸 때 특히 조심해야 합니다.

## 리다이렉션: stdout 저장

명령어의 일반 출력(stdout)을 파일로 저장합니다.

```bash
server$ grep "total energy" text/qe-output-snippet.out > energy-lines.txt
server$ cat energy-lines.txt
```

기존 파일 뒤에 추가하려면:

```bash
server$ grep "JOB DONE" text/qe-output-snippet.out >> energy-lines.txt
server$ cat energy-lines.txt
```

정리:

- `>`: 덮어쓰기
- `>>`: 추가하기

## stderr 저장: `2>`

오류 출력(stderr)은 일반 출력(stdout)과 다른 통로입니다.

예제 실행 파일을 일부러 잘못 실행해 봅니다.

```bash
server$ cd ~/linux-practice/examples/qe
server$ ./fake-pw.x > run.out 2> run.err
server$ cat run.out
server$ cat run.err
```

`fake-pw.x`에 입력 파일을 주지 않았기 때문에 오류 메시지가 `run.err`에 저장됩니다.

## stdout과 stderr를 한 파일에 저장: `2>&1`

성공한 명령은 stderr가 비어 있을 수 있습니다. 오류가 한 파일에 합쳐지는 것을 보려면 일부러 없는 입력 파일을 지정해 봅니다.

```bash
server$ ./fake-pw.x -in no-file.in > run.log 2>&1
server$ more run.log
```

의미:

- `> run.log`: stdout을 `run.log`로 저장
- `2>&1`: stderr도 stdout과 같은 곳으로 보냄
- 위 예제에서는 입력 파일이 없어서 오류 메시지도 `run.log`에 저장됨

실제 Quantum ESPRESSO에서도 stdout과 stderr를 한 로그 파일에 모을 때 자주 쓰는 형태입니다.

```bash
server$ pw.x -in si.scf.in > si.scf.out 2> si.scf.err
server$ mpirun -np 4 pw.x -in si.scf.in > si.scf.out 2>&1
```

## 파이프 `|`

파이프는 앞 명령어의 출력을 뒤 명령어의 입력으로 보냅니다.

```bash
server$ grep "ERROR" ../text/app.log | wc -l
```

뜻:

1. `grep`이 `ERROR`가 들어간 줄만 출력합니다.
2. `|`가 그 출력을 다음 명령으로 넘깁니다.
3. `wc -l`이 줄 수를 셉니다.

## `tee`: 화면에도 보고 파일에도 저장

```bash
server$ grep "total energy" si.scf.out | tee energy.txt
```

`tee`는 결과를 화면에 보여 주면서 동시에 파일에도 저장합니다.

## 실습

```bash
server$ cd ~/linux-practice/examples/qe
server$ ./fake-pw.x -in si.scf.in > fake.out 2> fake.err
server$ grep "total energy" fake.out
server$ grep "JOB DONE" fake.out
server$ tail -n 5 fake.out
```

## 체크포인트

1. `*.in`은 어떤 파일을 의미하나요?
2. `>`와 `>>`의 차이는 무엇인가요?
3. `2>`는 무엇을 저장하나요?
4. `2>&1`은 왜 Quantum ESPRESSO 실행에서 자주 쓰이나요?
