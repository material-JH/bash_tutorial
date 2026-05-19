# 4. Files and folders: `mkdir`, `touch`, editors

Start in the practice folder:

```bash
cd ~/linux-practice
```

## Make directories with `mkdir`

Create one folder:

```bash
mkdir notes
```

Create nested folders:

```bash
mkdir -p projects/demo
```

List the result:

```bash
ls
ls projects
```

## Create empty files with `touch`

```bash
touch notes/todo.txt
ls notes
```

`touch` creates an empty file if it does not exist. If it already exists, `touch` updates its timestamp.

## Add text with redirection

You can write simple text into a file:

```bash
echo "buy milk" > notes/todo.txt
```

Read it:

```bash
cat notes/todo.txt
```

Append another line:

```bash
echo "learn ls and cd" >> notes/todo.txt
cat notes/todo.txt
```

Important:

- `>` replaces the file content.
- `>>` appends to the file.

## Edit files

Beginner-friendly editors vary by system.

Common choices:

```bash
nano notes/todo.txt
```

If you use Visual Studio Code and it is installed:

```bash
code notes/todo.txt
```

In WSL, `explorer.exe .` opens the current Linux folder in Windows Explorer:

```bash
explorer.exe .
```

On macOS, this opens the current folder in Finder:

```bash
open .
```

On many Linux desktops:

```bash
xdg-open .
```

## File names with spaces

Avoid spaces in command-line practice if you can. Prefer:

```text
my-notes.txt
project_report.txt
```

If a file has spaces, quote it:

```bash
touch "my notes.txt"
ls "my notes.txt"
```

## Case matters

Linux is case-sensitive:

```text
Report.txt
report.txt
REPORT.txt
```

These can be three different files.

## Try it

Create a small folder and file:

```bash
mkdir -p journal/2026
echo "Today I used the terminal." > journal/2026/day1.txt
cat journal/2026/day1.txt
```

## Checkpoint

1. What is the difference between `>` and `>>`?
2. Why should beginners avoid spaces in filenames?
3. Are `notes.txt` and `Notes.txt` the same file on Linux?
