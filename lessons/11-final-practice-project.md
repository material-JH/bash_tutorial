# 11. Final practice project

This project combines the main skills from the tutorial.

Goal: create a small organized note collection, inspect it, search it, and archive your command output.

Start clean:

```bash
cd ~/linux-practice
mkdir -p final-project
cd final-project
```

## Step 1: Create a folder structure

```bash
mkdir -p notes logs backup
```

Check it:

```bash
ls -la
```

## Step 2: Create note files

```bash
echo "Linux command line notes" > notes/summary.txt
echo "pwd shows the current directory" >> notes/summary.txt
echo "ls lists files" >> notes/summary.txt
echo "cd changes directory" >> notes/summary.txt

printf "TODO\npractice grep\npractice pipes\nreview permissions\n" > notes/todo.txt
```

## Step 3: Read files

```bash
cat notes/summary.txt
less notes/todo.txt
```

Remember: press `q` to quit `less`.

## Step 4: Search files

```bash
grep "practice" notes/todo.txt
grep -R "directory" notes/
```

## Step 5: Count lines

```bash
wc -l notes/summary.txt
wc -l notes/todo.txt
```

## Step 6: Save command output

```bash
ls -la notes > logs/notes-listing.txt
cat logs/notes-listing.txt
```

Append the current location:

```bash
pwd >> logs/notes-listing.txt
cat logs/notes-listing.txt
```

## Step 7: Copy files to backup

```bash
cp -r notes backup/notes-backup
find backup -name "*.txt"
```

## Step 8: Rename a file

```bash
mv notes/todo.txt notes/tasks.txt
ls notes
```

## Step 9: Make a small script

```bash
cat > show-project.sh <<'EOF'
#!/usr/bin/env bash
echo "Project location:"
pwd
echo
echo "Text files:"
find . -name "*.txt"
echo
echo "Lines containing practice:"
grep -R "practice" .
EOF

chmod +x show-project.sh
./show-project.sh
```

## Step 10: Clean up safely

Preview before deleting:

```bash
ls backup
```

Delete the backup copy only if you are sure:

```bash
rm -r backup/notes-backup
```

## Final self-check

You should now be able to explain what each command does:

```bash
pwd
ls -la
cd
mkdir -p
echo
cat
less
grep
wc -l
cp -r
mv
find
chmod +x
rm -r
```

If any command feels unclear, return to the lesson where it first appeared.
