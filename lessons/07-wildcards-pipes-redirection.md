# 7. Wildcards, pipes, and redirection

This lesson shows why the shell is powerful: it can match many files and connect commands.

Start in the practice folder:

```bash
cd ~/linux-practice
mkdir -p shell-power
cd shell-power
```

## Create sample files

```bash
echo "apple" > fruit.txt
echo "carrot" > vegetable.txt
echo "banana" > yellow-fruit.txt
echo "notes" > notes.md
ls
```

## Wildcards

A wildcard is a pattern that matches filenames.

### `*` matches any text

```bash
ls *.txt
```

This lists files ending in `.txt`.

```bash
ls *fruit*
```

This lists files with `fruit` anywhere in the name.

### Preview before destructive commands

Good:

```bash
ls *.txt
```

Then, only if the list is correct:

```bash
rm *.txt
```

Do not use `rm` with wildcards until you have previewed the match.

## Redirection

Redirection sends command output to a file.

Replace file content:

```bash
echo "first line" > output.txt
cat output.txt
```

Append to file:

```bash
echo "second line" >> output.txt
cat output.txt
```

Remember:

- `>` replaces.
- `>>` appends.

## Pipes

A pipe sends the output of one command into another command.

```bash
ls | wc -l
```

This means:

1. `ls` lists files.
2. `|` sends that list to the next command.
3. `wc -l` counts lines.

## More pipe examples

Create a file:

```bash
printf "error: disk\ninfo: start\nerror: network\ninfo: stop\n" > app.log
```

Show only error lines:

```bash
grep "error" app.log
```

Count error lines:

```bash
grep "error" app.log | wc -l
```

## Try it

```bash
ls -la > listing.txt
cat listing.txt
wc -l listing.txt
```

## Checkpoint

1. What does `*.txt` match?
2. What is the difference between `>` and `>>`?
3. In `grep "error" app.log | wc -l`, which command runs first?
