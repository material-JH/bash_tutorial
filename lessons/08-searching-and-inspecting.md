# 8. 검색과 검사: `grep`, `find`, `find -exec`, `command`

원격 서버에서는 많은 파일 중 필요한 입력, 출력, 로그 파일을 빠르게 찾는 능력이 중요합니다.

예제 폴더에서 시작합니다.

```bash
server$ cd ~/linux-practice/examples
```

## 파일 안에서 검색: `grep`

```bash
server$ grep "terminal" text/sample.txt
```

대소문자 무시:

```bash
server$ grep -i "linux" text/sample.txt
```

폴더 안을 재귀적으로 검색:

```bash
server$ grep -R "ERROR" .
```

줄 번호 표시:

```bash
server$ grep -n "total energy" qe/si.scf.out
```

파일 이름도 함께 표시:

```bash
server$ grep -H "JOB DONE" qe/*.out
```

## 개수 세기: `wc`

```bash
server$ wc text/sample.txt
server$ wc -l text/sample.txt
server$ grep "ERROR" text/app.log | wc -l
```

## 파일 이름으로 찾기: `find`

현재 폴더 아래에서 Quantum ESPRESSO 입력 파일 찾기:

```bash
server$ find . -name "*.in"
```

출력 파일 찾기:

```bash
server$ find . -name "*.out"
```

최근 수정된 파일을 자세히 보기:

```bash
server$ find . -name "*.out" -ls
```

## 찾은 파일마다 명령 실행: `find -exec`

`.out` 파일마다 `grep`을 실행해서 정상 종료 여부를 확인합니다.

```bash
server$ find . -name "*.out" -exec grep -H "JOB DONE" {} \;
```

구조:

- `find . -name "*.out"`: 현재 폴더 아래에서 `.out` 파일 찾기
- `-exec ... \;`: 찾은 파일마다 명령 실행
- `{}`: find가 찾은 파일 이름이 들어가는 자리
- `grep -H`: 파일 이름과 함께 매칭 줄 출력

여러 출력 파일에서 총 에너지 줄을 찾기:

```bash
server$ find . -name "*.out" -exec grep -H "total energy" {} \;
```

찾은 파일들의 마지막 5줄을 보기:

```bash
server$ find . -name "*.out" -exec tail -n 5 {} \;
```

파일이 많으면 결과가 길어질 수 있으므로 `more`와 함께 볼 수 있습니다.

```bash
server$ find . -name "*.out" -exec grep -H "total energy" {} \; | more
```

## 명령어와 실행 파일 확인: `command`

`command -v`는 셸이 어떤 실행 파일을 사용할지 알려 줍니다.

```bash
server$ command -v vim
server$ command -v tree
server$ command -v pw.x
server$ command -v mpirun
```

출력이 없으면 그 명령어를 현재 환경에서 찾지 못한 것입니다.

서버에서 Quantum ESPRESSO는 보통 module로 로드해야 할 수 있습니다.

```bash
server$ module avail quantum
server$ module load quantum-espresso
server$ command -v pw.x
```

서버마다 module 이름은 다릅니다. 예를 들어 `qe`, `quantum-espresso/7.3`, `espresso` 등일 수 있습니다.

## `type`과 `file`

`type`은 명령어가 alias인지, 함수인지, 파일인지 알려 줍니다.

```bash
server$ type cd
server$ type pw.x
```

`file`은 파일 종류를 알려 줍니다.

```bash
server$ file qe/si.scf.in
server$ file qe/fake-pw.x
server$ file binary/fake-wfc.dat
```

## 실습

```bash
server$ cd ~/linux-practice/examples
server$ find . -name "*.in"
server$ find . -name "*.out" -exec grep -H "JOB DONE" {} \;
server$ command -v vim
server$ command -v pw.x
server$ file binary/fake-wfc.dat
```

## 체크포인트

1. `grep -n`은 무엇을 추가로 보여주나요?
2. `find . -name "*.in"`에서 `.`은 무엇을 의미하나요?
3. `find -exec`에서 `{}`는 무엇인가요?
4. `command -v pw.x`의 출력이 없으면 무엇을 의심해야 하나요?
