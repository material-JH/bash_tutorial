# Linux Command Line Cheat Sheet

Use this after you have read the lessons.

## Command shape

```bash
command [options] [arguments]
```

Example:

```bash
ls -l Documents
```

- `ls` is the command.
- `-l` is an option.
- `Documents` is an argument.

## Navigation

| Task | Command |
|---|---|
| Show current folder | `pwd` |
| List files | `ls` |
| Long list | `ls -l` |
| Show hidden files | `ls -a` |
| Long list including hidden files | `ls -la` |
| Go into a folder | `cd folder-name` |
| Go up one folder | `cd ..` |
| Go home | `cd ~` or `cd` |
| Go to previous folder | `cd -` |

## Paths

| Symbol | Meaning |
|---|---|
| `/` | Root of the Linux filesystem |
| `~` | Your home directory |
| `.` | Current directory |
| `..` | Parent directory |

## Files and folders

| Task | Command |
|---|---|
| Create folder | `mkdir notes` |
| Create nested folders | `mkdir -p projects/demo` |
| Create empty file | `touch file.txt` |
| Copy file | `cp old.txt new.txt` |
| Copy folder | `cp -r folder copy-folder` |
| Move or rename | `mv old-name new-name` |
| Delete file | `rm file.txt` |
| Delete empty folder | `rmdir folder` |
| Delete folder and contents | `rm -r folder` |

## Read text

| Task | Command |
|---|---|
| Print file | `cat file.txt` |
| Page through file | `less file.txt` |
| First 10 lines | `head file.txt` |
| Last 10 lines | `tail file.txt` |
| Follow growing log file | `tail -f file.log` |

## Search and count

| Task | Command |
|---|---|
| Search text in file | `grep "word" file.txt` |
| Case-insensitive search | `grep -i "word" file.txt` |
| Search recursively | `grep -R "word" folder/` |
| Count lines, words, bytes | `wc file.txt` |
| Count lines only | `wc -l file.txt` |

## Pipes and redirection

| Task | Command |
|---|---|
| Save output to file, replacing old content | `command > file.txt` |
| Append output to file | `command >> file.txt` |
| Send output into another command | `command1 | command2` |
| Example: count matching lines | `grep "error" app.log | wc -l` |

## Permissions

| Task | Command |
|---|---|
| Show permissions | `ls -l` |
| Make script executable | `chmod +x script.sh` |
| Run script in current folder | `./script.sh` |
| Run as administrator | `sudo command` |

## Help

| Task | Command |
|---|---|
| Short help | `command --help` |
| Manual page | `man command` |
| Find command location | `which command` |
| Show command history | `history` |

## Keyboard shortcuts

| Shortcut | Meaning |
|---|---|
| `Tab` | Autocomplete command or path |
| `Up Arrow` | Previous command |
| `Down Arrow` | Next command |
| `Ctrl + C` | Stop current command |
| `Ctrl + L` | Clear screen |
| `Ctrl + A` | Move to beginning of line |
| `Ctrl + E` | Move to end of line |
| `Ctrl + R` | Search command history |

## Dangerous commands to treat carefully

Do not run these unless you understand them:

```bash
rm -r something
rm -rf something
sudo command
chmod -R ...
chown -R ...
```

Before deleting with a wildcard, preview with `ls`:

```bash
ls *.txt
rm *.txt
```
