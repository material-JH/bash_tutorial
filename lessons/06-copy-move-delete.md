# 6. 복사, 이동, 이름 변경, 삭제

이번 장에는 삭제 명령이 포함되어 있습니다. 반드시 연습 폴더 안에서만 실행하세요.

```bash
server$ cd ~/linux-practice
server$ pwd
```

출력 경로가 `linux-practice`로 끝나는지 확인한 뒤 진행하세요.

## 예제 파일 준비

이 장에서는 저장소에 들어 있는 예제 파일을 복사해서 씁니다.

```bash
server$ rm -rf file-practice
server$ cp -r ~/linux-practice/examples/files file-practice
server$ cd file-practice
server$ tree .
```

`tree`가 없으면:

```bash
server$ find . -maxdepth 3 -print
```

처음 구조는 대략 다음과 같습니다.

```text
.
├── a.txt
├── b.txt
├── folder1
│   └── note.txt
└── folder2
```

## 복사: `cp`

파일 복사:

```bash
server$ cp a.txt a-copy.txt
server$ ls
server$ cat a-copy.txt
```

파일을 폴더 안으로 복사:

```bash
server$ cp b.txt folder1/
server$ ls folder1
```

폴더 복사:

```bash
server$ cp -r folder1 folder1-copy
server$ tree .
```

`-r`은 recursive의 약자로, 폴더 안의 내용까지 함께 복사한다는 뜻입니다.

## 이동과 이름 변경: `mv`

파일 이름 변경:

```bash
server$ mv a-copy.txt renamed.txt
server$ ls
```

파일 이동:

```bash
server$ mv renamed.txt folder2/
server$ ls folder2
```

`mv`는 move의 약자입니다. 이름 변경도 “새 이름으로 이동”하는 것으로 생각하면 됩니다.

## 삭제: `rm`, `rmdir`

파일 삭제:

```bash
server$ cp a.txt delete-me.txt
server$ ls delete-me.txt
server$ rm delete-me.txt
server$ ls delete-me.txt
```

마지막 `ls`는 “파일이 없다”는 에러를 보여줄 수 있습니다. 삭제되었기 때문입니다.

빈 폴더 삭제:

```bash
server$ mkdir empty-folder
server$ rmdir empty-folder
```

내용이 있는 폴더 삭제:

```bash
server$ rm -r folder1-copy
```

## `rm`은 조심해야 합니다

리눅스 서버에서 `rm`으로 삭제한 파일은 보통 휴지통으로 가지 않습니다.

안전 습관:

1. 삭제 전 `pwd`로 위치 확인
2. 삭제 전 `ls`로 대상 확인
3. 처음에는 `rm -i` 사용
4. `rm -rf`는 의미를 정확히 알 때만 사용

확인하며 삭제:

```bash
server$ cp b.txt maybe-delete.txt
server$ rm -i maybe-delete.txt
```

`y`는 yes, `n`은 no입니다.

## Quantum ESPRESSO 파일 정리 예

계산 폴더에서는 입력 파일(`*.in`)은 남기고, 테스트 출력 파일(`*.out`, `*.err`)만 지우고 싶을 때가 있습니다.

먼저 반드시 확인합니다.

```bash
server$ cd ~/linux-practice/examples/qe
server$ ls *.out *.err
```

그 다음에만 삭제를 생각합니다.

```bash
server$ rm *.out *.err
```

하지만 이 예제 폴더의 원본 파일을 지우기 싫다면, 먼저 복사본에서 연습하세요.

```bash
server$ cp -r ~/linux-practice/examples/qe ~/linux-practice/qe-delete-practice
server$ cd ~/linux-practice/qe-delete-practice
server$ ls *.out *.err
server$ rm -i *.err
```

## 실습

```bash
server$ cd ~/linux-practice
server$ rm -rf file-practice-repeat
server$ cp -r ~/linux-practice/examples/files file-practice-repeat
server$ cd file-practice-repeat
server$ cp a.txt backup.txt
server$ mv backup.txt final.txt
server$ ls
server$ rm -i final.txt
```

## 체크포인트

1. 파일 이름을 바꾸는 명령어는 무엇인가요?
2. 폴더 복사에는 왜 `cp -r`이 필요한가요?
3. `rm -r` 실행 전에 무엇을 확인해야 하나요?
4. 계산 폴더에서 `rm *.out`을 실행하기 전에 왜 `ls *.out`을 먼저 해야 하나요?
