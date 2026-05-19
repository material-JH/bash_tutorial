# Linux Command Line Tutorial for Absolute Beginners

A gentle, practical tutorial for people who usually use Windows or macOS and are new to the terminal.

This repo teaches Linux commands by doing small tasks in a safe practice folder. You do not need programming experience.

## Who this is for

- You mostly use a graphical interface: folders, icons, Finder, Explorer.
- You have heard words like terminal, shell, Bash, command line, or Linux, but they feel confusing.
- You want enough command-line skill to navigate files, run tools, install software, read errors, and follow technical instructions.

## Learning goals

By the end, you will be able to:

- Open a terminal on Windows, macOS, or Linux.
- Understand the difference between terminal, shell, prompt, command, option, and argument.
- Move around the filesystem with `pwd`, `ls`, and `cd`.
- Create, inspect, copy, move, rename, and delete files safely.
- Read text files with `cat`, `less`, `head`, and `tail`.
- Search files with `grep` and count things with `wc`.
- Connect commands with pipes and redirection.
- Understand basic permissions, executable files, and `sudo`.
- Use help pages, command history, tab completion, and common keyboard shortcuts.

## Suggested setup

### Windows

Recommended: install WSL (Windows Subsystem for Linux), because it gives you a real Linux command line.

1. Open PowerShell as Administrator.
2. Run:

```powershell
wsl --install
```

3. Restart if Windows asks.
4. Open "Ubuntu" from the Start menu.

Notes:

- Windows paths look like `C:\Users\YourName\Documents`.
- In WSL, the same place is usually `/mnt/c/Users/YourName/Documents`.
- Git Bash is useful, but it is not exactly the same as Linux. For this tutorial, WSL is better.

### macOS

1. Open Finder.
2. Go to Applications -> Utilities -> Terminal.
3. macOS now usually uses `zsh`, not Bash, but the beginner commands in this tutorial work almost the same.

Notes:

- Your home folder is usually `/Users/yourname`.
- Some macOS command options differ from Linux because macOS uses BSD tools. This tutorial avoids most differences.

### Linux

Open your system terminal app. Common shortcuts:

- Ubuntu/GNOME: `Ctrl` + `Alt` + `T`
- KDE: search for "Konsole"
- Any desktop: search the app menu for "Terminal"

## How to use this tutorial

Read in order and type the commands yourself.

Important: do not include the `$` prompt when copying commands. For example:

```bash
$ pwd
```

You type only:

```bash
pwd
```

## Lessons

1. [What the terminal is](lessons/01-what-is-the-terminal.md)
2. [Your first safe practice folder](lessons/02-safe-practice-folder.md)
3. [Navigation: `pwd`, `ls`, `cd`](lessons/03-navigation.md)
4. [Files and folders: `mkdir`, `touch`, editors](lessons/04-files-and-folders.md)
5. [Reading text: `cat`, `less`, `head`, `tail`](lessons/05-reading-text.md)
6. [Copy, move, rename, delete safely](lessons/06-copy-move-delete.md)
7. [Wildcards, pipes, and redirection](lessons/07-wildcards-pipes-redirection.md)
8. [Searching and inspecting files](lessons/08-searching-and-inspecting.md)
9. [Permissions, executables, and `sudo`](lessons/09-permissions-and-sudo.md)
10. [Help, history, shortcuts, and next steps](lessons/10-help-history-next-steps.md)
11. [Final practice project](lessons/11-final-practice-project.md)

Extra:

- [Cheat sheet](CHEATSHEET.md)
- [Research notes: how other tutorials are structured](RESEARCH_NOTES.md)

## Safety rules

1. Practice inside `~/linux-practice` until you are comfortable.
2. Pause before using `rm`, especially `rm -r`.
3. Never run a command from the internet unless you understand the parts.
4. Be very careful with `sudo`; it runs commands with administrator privileges.
5. If a command includes `*`, check what it matches before running destructive commands.

## Quick start

```bash
mkdir -p ~/linux-practice
cd ~/linux-practice
pwd
ls
```

You are now in a safe folder for this tutorial.
