# 5. Reading text: `cat`, `less`, `head`, `tail`

The terminal is excellent for reading text files, logs, configuration files, and command output.

Start in the practice folder:

```bash
cd ~/linux-practice
```

## Create a sample file

Run:

```bash
mkdir -p text
printf "line 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\nline 8\nline 9\nline 10\nline 11\nline 12\n" > text/sample.txt
```

## Print a whole file: `cat`

```bash
cat text/sample.txt
```

`cat` is useful for small files. It is not comfortable for huge files because everything scrolls by.

## Page through a file: `less`

```bash
less text/sample.txt
```

Inside `less`:

| Key | Action |
|---|---|
| Space | next page |
| `b` | previous page |
| `/word` | search for word |
| `n` | next search match |
| `q` | quit |

If you get stuck in `less`, press `q`.

## Show the beginning: `head`

```bash
head text/sample.txt
head -n 3 text/sample.txt
```

`head -n 3` shows the first 3 lines.

## Show the end: `tail`

```bash
tail text/sample.txt
tail -n 3 text/sample.txt
```

`tail` is common for log files, because new messages are often added at the end.

## Follow a growing file: `tail -f`

This is useful for logs.

Run:

```bash
tail -f text/sample.txt
```

It waits for new lines. Stop it with:

```text
Ctrl + C
```

## Try it

```bash
echo "line 13" >> text/sample.txt
tail -n 5 text/sample.txt
```

## Checkpoint

1. Which command is better for a very long file: `cat` or `less`?
2. How do you quit `less`?
3. What does `tail -n 5 file.txt` show?
