# 1. What the terminal is

If you are used to Windows Explorer or macOS Finder, the terminal can look unfriendly at first. It is just another way to control the computer: you type instructions instead of clicking icons.

## Key words

### Terminal

The terminal is the app or window where you type commands.

Examples:

- Windows: Windows Terminal running WSL/Ubuntu
- macOS: Terminal or iTerm2
- Linux: Terminal, GNOME Terminal, Konsole, etc.

### Shell

The shell is the program inside the terminal that reads your command and starts programs.

Common shells:

- `bash`: very common on Linux
- `zsh`: default on modern macOS
- `fish`: friendly alternative shell

This tutorial uses Bash-style commands, but most examples also work in `zsh`.

### Prompt

The prompt is the text that appears before your cursor. It means the shell is ready.

It may look like this:

```bash
user@computer:~$
```

or this:

```bash
$
```

When tutorials show commands, they often include `$` to mean "type this at the prompt". You do not type the `$` itself.

## Command anatomy

Most commands look like this:

```bash
command option argument
```

Example:

```bash
ls -l Documents
```

- `ls` is the command.
- `-l` is an option, also called a flag.
- `Documents` is an argument, the thing the command works on.

Options can be short or long:

```bash
ls -a
ls --all
```

Both mean "show all files", including hidden files.

## Why learn the command line?

The command line is useful because it is:

- Fast for repeated tasks.
- Precise: commands say exactly what happened.
- Scriptable: you can save commands and run them later.
- Common in development, data science, servers, research computing, and troubleshooting.

## Try it

Open a terminal and run:

```bash
echo Hello terminal
```

You should see:

```text
Hello terminal
```

`echo` prints text back to you.

## Checkpoint

Answer in your own words:

1. What is the difference between a terminal and a shell?
2. In `ls -l Documents`, which part is the command?
3. Should you type the `$` symbol shown in examples?
