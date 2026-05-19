# 8. Searching and inspecting files

Searching is one of the most useful command-line skills.

Start in the practice folder:

```bash
cd ~/linux-practice
mkdir -p search-practice/logs
cd search-practice
```

## Create sample files

```bash
cat > notes.txt <<'EOF'
Linux is useful.
The terminal can search text quickly.
Practice makes commands less scary.
EOF

cat > logs/app.log <<'EOF'
INFO started
ERROR missing file
INFO retrying
ERROR network timeout
INFO stopped
EOF
```

If the `cat > file <<'EOF'` syntax feels strange, read it as: "write the following lines into this file until EOF".

## Search inside files with `grep`

```bash
grep "terminal" notes.txt
```

Search case-insensitively:

```bash
grep -i "linux" notes.txt
```

Search recursively inside a folder:

```bash
grep -R "ERROR" .
```

Show line numbers:

```bash
grep -n "ERROR" logs/app.log
```

## Count with `wc`

```bash
wc notes.txt
```

Output has lines, words, and bytes.

Count only lines:

```bash
wc -l notes.txt
```

Count matching lines:

```bash
grep "ERROR" logs/app.log | wc -l
```

## Find files by name with `find`

```bash
find . -name "*.txt"
find . -name "*.log"
```

Meaning:

- `find` searches for files.
- `.` means start in the current directory.
- `-name "*.txt"` means names ending in `.txt`.

## Inspect command locations with `which`

```bash
which ls
which grep
```

This shows where the executable program lives.

## Try it

1. Find all `.log` files.
2. Search for `INFO` in the current folder recursively.
3. Count how many `ERROR` lines are in `logs/app.log`.

Commands:

```bash
find . -name "*.log"
grep -R "INFO" .
grep "ERROR" logs/app.log | wc -l
```

## Checkpoint

1. What does `grep -i` do?
2. What does `grep -R` do?
3. What does `find . -name "*.txt"` mean?
