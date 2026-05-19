# 9. Permissions, executables, and `sudo`

Linux has permissions that control who can read, write, or run files.

Start in the practice folder:

```bash
cd ~/linux-practice
mkdir -p permissions-practice
cd permissions-practice
```

## View permissions with `ls -l`

```bash
echo "hello" > hello.txt
ls -l hello.txt
```

Example output:

```text
-rw-r--r-- 1 ava ava 6 May 19 10:00 hello.txt
```

The first part is permissions:

```text
-rw-r--r--
```

Read it as:

- First character: file type (`-` file, `d` directory).
- Next three: owner permissions.
- Next three: group permissions.
- Last three: everyone else.

Letters:

| Letter | Meaning |
|---|---|
| `r` | read |
| `w` | write |
| `x` | execute/run |

## Create a tiny script

```bash
cat > hello.sh <<'EOF'
#!/usr/bin/env bash
echo "Hello from a script"
EOF
```

Try to run it:

```bash
./hello.sh
```

You may get "Permission denied" because it is not executable yet.

Make it executable:

```bash
chmod +x hello.sh
```

Run it again:

```bash
./hello.sh
```

## Why `./hello.sh`?

The current folder is not automatically searched for commands. `./hello.sh` means "run `hello.sh` from this folder".

## What is `sudo`?

`sudo` means "run this command as administrator/root".

Example:

```bash
sudo apt update
```

On Ubuntu/Debian, this asks the package manager to refresh software lists.

Important safety notes:

- `sudo` can change system files.
- It may ask for your password.
- When typing your password, the terminal may show nothing. That is normal.
- Do not use `sudo` just because a command failed. First understand why it failed.

## Try it

```bash
ls -l hello.sh
chmod -x hello.sh
ls -l hello.sh
chmod +x hello.sh
ls -l hello.sh
./hello.sh
```

Watch how the permission letters change.

## Checkpoint

1. What does `x` mean in file permissions?
2. Why might `./hello.sh` fail before `chmod +x hello.sh`?
3. Why should you be careful with `sudo`?
