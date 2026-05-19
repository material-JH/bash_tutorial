# 6. 복사, 이동, 이름 변경, 삭제

이번 장에는 삭제 명령이 포함되어 있습니다. 반드시 연습 폴더 안에서만 실행하세요.

```bash
server$ cd ~/linux-practice
server$ pwd
```

출력 경로가 `linux-practice`로 끝나는지 확인한 뒤 진행하세요.

## 샘플 파일 만들기

```bash
server$ mkdir -p file-practice
server$ cd file-practice
server$ echo "alpha" > a.txt
server$ echo "beta" > b.txt
server$ mkdir folder1 folder2
server$ ls
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
server$ ls
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
server$ rm a.txt
server$ ls
```

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
server$ echo "temporary" > maybe-delete.txt
server$ rm -i maybe-delete.txt
```

`y`는 yes, `n`은 no입니다.

## 실습

```bash
server$ echo "practice" > practice.txt
server$ cp practice.txt backup.txt
server$ mv practice.txt final.txt
server$ ls
server$ rm -i backup.txt
```

## 체크포인트

1. 파일 이름을 바꾸는 명령어는 무엇인가요?
2. 폴더 복사에는 왜 `cp -r`이 필요한가요?
3. `rm -r` 실행 전에 무엇을 확인해야 하나요?
