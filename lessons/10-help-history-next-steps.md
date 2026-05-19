# 10. Help, history, shortcuts, and next steps

You do not need to memorize every command. You need to know how to get help.

## Short help

Many commands support `--help`:

```bash
ls --help
cp --help
```

This can print a lot of text. You can pipe it into `less`:

```bash
ls --help | less
```

Press `q` to quit `less`.

## Manual pages

Use `man` for the manual page:

```bash
man ls
```

Inside `man`:

| Key | Action |
|---|---|
| Space | next page |
| `b` | previous page |
| `/word` | search |
| `n` | next match |
| `q` | quit |

## Command history

Show previous commands:

```bash
history
```

Use the Up Arrow to bring back a previous command.

Search history:

```text
Ctrl + R
```

Type part of a command. Press Enter to run it, or press Esc/Ctrl+C to cancel depending on your shell.

## Tab completion

Start typing a command or path, then press Tab.

Example:

```bash
cd ~/linu<Tab>
```

The shell may complete it to:

```bash
cd ~/linux-practice
```

Tab completion reduces typing and prevents spelling mistakes.

## Useful keyboard shortcuts

| Shortcut | Meaning |
|---|---|
| `Ctrl + C` | stop current command |
| `Ctrl + L` | clear the screen |
| `Ctrl + A` | beginning of line |
| `Ctrl + E` | end of line |
| `Ctrl + U` | delete from cursor to beginning |
| `Ctrl + K` | delete from cursor to end |
| `Ctrl + R` | search command history |

## Reading errors

When a command fails, read the error slowly.

Example:

```bash
cd no-such-folder
```

Possible output:

```text
bash: cd: no-such-folder: No such file or directory
```

This tells you:

- Which command failed: `cd`
- What it tried to use: `no-such-folder`
- Why it failed: no such file or directory

## Next commands to learn later

After this tutorial, learn these gradually:

| Topic | Commands |
|---|---|
| Downloading | `curl`, `wget` |
| Archives | `tar`, `zip`, `unzip` |
| Processes | `ps`, `top`, `kill` |
| Disk usage | `df`, `du` |
| Networking | `ping`, `ssh`, `scp` |
| Package management | `apt`, `dnf`, `brew` |
| Version control | `git` |
| Text processing | `sed`, `awk`, `cut`, `sort`, `uniq` |

## Checkpoint

1. How do you quit `man` or `less`?
2. What shortcut stops a running command?
3. Why is Tab completion useful?
