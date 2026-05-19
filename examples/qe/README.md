# Quantum ESPRESSO 예제

이 폴더는 실제 계산 결과가 아니라 리눅스 명령어 실습용 예제입니다.

포함 파일:

- `si.scf.in`: Quantum ESPRESSO `pw.x` 입력 파일 형태의 텍스트 파일
- `si.scf.out`: 출력 파일 예제
- `si.scf.err`: stderr 리다이렉션 예제
- `fake-pw.x`: `pw.x` 실행과 리다이렉션을 연습하기 위한 작은 셸 스크립트
- `pseudo/`: 실제 계산에서 pseudopotential을 두는 위치 설명

실제 서버에서는 보통 다음을 먼저 확인합니다.

```bash
server$ command -v pw.x
server$ command -v mpirun
server$ module avail quantum
server$ module load quantum-espresso
```
