# 2. Your first safe practice folder

Before learning file commands, create a folder where mistakes are harmless.

## Create the folder

Run:

```bash
mkdir -p ~/linux-practice
cd ~/linux-practice
pwd
```

You should see a path ending in:

```text
linux-practice
```

## What those commands mean

```bash
mkdir -p ~/linux-practice
```

- `mkdir` means "make directory".
- `-p` means "create parent folders if needed and do not complain if the folder already exists".
- `~` means your home directory.

```bash
cd ~/linux-practice
```

- `cd` means "change directory".
- This moves your shell into the practice folder.

```bash
pwd
```

- `pwd` means "print working directory".
- It shows where you are now.

## Windows and macOS path comparison

A path is the address of a file or folder.

Windows example:

```text
C:\Users\Ava\Documents\report.txt
```

Linux/WSL example:

```text
/mnt/c/Users/Ava/Documents/report.txt
```

macOS example:

```text
/Users/ava/Documents/report.txt
```

Linux home folder example:

```text
/home/ava
```

In the terminal, `/` separates folders. Windows often uses `\`.

## Safety habit

For the rest of the tutorial, if you ever feel lost, run:

```bash
pwd
```

If the output does not end with `linux-practice`, return to the practice folder:

```bash
cd ~/linux-practice
```

## Try it

Run:

```bash
cd ~
pwd
cd ~/linux-practice
pwd
```

Notice how your location changes.

## Checkpoint

1. What does `~` mean?
2. Why are we using a practice folder?
3. What command tells you where you are?
