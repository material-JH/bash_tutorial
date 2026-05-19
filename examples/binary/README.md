# 바이너리 파일 예제

`fake-wfc.dat`는 텍스트 파일이 아니라 바이너리 파일 확인 연습용 샘플입니다.

텍스트 파일처럼 `more`나 `vim`으로 읽으려고 하지 말고 다음 명령어를 사용하세요.

```bash
server$ file fake-wfc.dat
server$ hexdump -C fake-wfc.dat | more
server$ strings fake-wfc.dat
```

Quantum ESPRESSO의 wavefunction, charge-density 같은 일부 파일도 사람이 직접 읽는 텍스트가 아닐 수 있습니다.
