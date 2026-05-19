# 3. Navigation: `pwd`, `ls`, `cd`

Navigation means moving through folders.

Start in the practice folder:

```bash
cd ~/linux-practice
```

## Show where you are: `pwd`

```bash
pwd
```

Example output:

```text
/home/ava/linux-practice
```

This is your current working directory.

## List files: `ls`

```bash
ls
```

If the folder is empty, `ls` may print nothing. That is normal.

Try a long listing:

```bash
ls -l
```

Try showing hidden files:

```bash
ls -a
```

Hidden files usually begin with a dot, like `.bashrc`.

Combine options:

```bash
ls -la
```

## Create folders for navigation practice

```bash
mkdir -p animals/cats animals/dogs plants/trees
```

Now list them:

```bash
ls
ls animals
```

## Change directory: `cd`

Move into `animals`:

```bash
cd animals
pwd
ls
```

Move into `cats`:

```bash
cd cats
pwd
```

Move up one level:

```bash
cd ..
pwd
```

Move to your home folder:

```bash
cd ~
pwd
```

Return to the practice folder:

```bash
cd ~/linux-practice
```

## Relative and absolute paths

An absolute path starts from the root `/` or your home shortcut `~`:

```bash
cd ~/linux-practice/animals/dogs
```

A relative path starts from where you are now:

```bash
cd animals/dogs
```

Both can reach the same place, depending on where you start.

## Special path symbols

| Symbol | Meaning |
|---|---|
| `.` | current directory |
| `..` | parent directory |
| `~` | your home directory |
| `/` | root of the filesystem |

Examples:

```bash
cd .
cd ..
cd ~
```

## Try it

From `~/linux-practice`, run:

```bash
cd animals/dogs
pwd
cd ../../plants/trees
pwd
cd ../..
pwd
```

Read each path out loud. This makes paths feel less mysterious.

## Checkpoint

1. What is the difference between `cd animals` and `cd /animals`?
2. What does `..` mean?
3. Why might `ls` show no output in an empty folder?
