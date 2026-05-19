# Research notes: how beginner terminal tutorials are usually made

Before writing this tutorial, I surveyed common online Linux command-line tutorials and noted their teaching patterns.

## Sources surveyed

- Ubuntu: "The Linux command line for beginners"
  - https://ubuntu.com/tutorials/command-line-for-beginners
- LinuxCommand.org: "Learning the shell"
  - https://linuxcommand.org/lc3_learning_the_shell.php
- Software Carpentry: "The Unix Shell"
  - https://swcarpentry.github.io/shell-novice/
- MIT Missing Semester: "Course Overview + The Shell"
  - https://missing.csail.mit.edu/2020/course-shell/
- freeCodeCamp: "The Linux Command Handbook"
  - https://www.freecodecamp.org/news/the-linux-commands-handbook/
- DigitalOcean: "50+ Essential Linux Commands"
  - https://www.digitalocean.com/community/tutorials/linux-commands

## Common patterns found

### 1. Start with the mental model

Good tutorials explain early:

- The terminal is the window or app.
- The shell is the program reading your commands.
- A command is a small program.
- Commands usually have options and arguments.
- The prompt shows where you are and waits for input.

This reduces fear because learners know what they are looking at.

### 2. Teach location before commands

Many tutorials start with:

- `pwd` to show where you are.
- `ls` to list what is there.
- `cd` to move.
- Absolute paths, relative paths, `.`, `..`, and `~`.

This matches how GUI users think about folders.

### 3. Use a safe sandbox

Beginner lessons often create a practice directory so learners do not damage real files.

This tutorial uses:

```bash
~/linux-practice
```

### 4. Build skills progressively

The common progression is:

1. Open terminal.
2. Understand prompt and command shape.
3. Navigate directories.
4. Create files and directories.
5. Copy, move, rename, delete.
6. View text.
7. Search text.
8. Use pipes and redirection.
9. Learn permissions and `sudo`.
10. Learn help and next steps.

### 5. Mix narrative lessons with reference material

Some tutorials are guided lessons; others are command handbooks.

This repo combines both:

- `lessons/` for guided learning.
- `CHEATSHEET.md` for quick lookup.

### 6. Include exercises

The best tutorials ask learners to predict, type, observe, and fix small mistakes.

This tutorial includes "Try it" and "Checkpoint" sections in lessons.

## Design choices for this tutorial

- Audience: Windows/macOS users who are new to terminal work.
- Tone: friendly, non-judgmental, no assumed programming background.
- Safety: repeated warnings around destructive commands.
- Platform notes: Windows WSL, macOS Terminal, Linux terminal.
- Scope: enough commands to become comfortable, not an encyclopedia.
- Practice-first: learners type commands in a sandbox instead of only reading.
