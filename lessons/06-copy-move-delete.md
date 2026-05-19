# 6. Copy, move, rename, delete safely

This lesson includes destructive commands. Stay inside the practice folder.

```bash
cd ~/linux-practice
pwd
```

Confirm that the output ends with `linux-practice` before continuing.

## Create sample files

```bash
mkdir -p file-practice
cd file-practice
echo "alpha" > a.txt
echo "beta" > b.txt
mkdir folder1 folder2
ls
```

## Copy files with `cp`

```bash
cp a.txt a-copy.txt
ls
cat a-copy.txt
```

Copy a file into a folder:

```bash
cp b.txt folder1/
ls folder1
```

Copy a folder recursively:

```bash
cp -r folder1 folder1-copy
ls
```

`-r` means recursive: include the folder contents.

## Move and rename with `mv`

Rename a file:

```bash
mv a-copy.txt renamed.txt
ls
```

Move a file into a folder:

```bash
mv renamed.txt folder2/
ls folder2
```

`mv` means move, but renaming is just moving to a new name.

## Delete files with `rm`

Delete one file:

```bash
rm a.txt
ls
```

Delete an empty directory:

```bash
mkdir empty-folder
rmdir empty-folder
```

Delete a folder and everything inside it:

```bash
rm -r folder1-copy
```

## Be careful with `rm`

The terminal usually does not move deleted files to Trash. Deleted can mean gone.

Safer habits:

1. Use `pwd` before deleting.
2. Use `ls` to preview what you are deleting.
3. Avoid `rm -rf` until you know exactly what it does.
4. Do not run deletion commands from random websites.

## Interactive delete

You can ask `rm` to confirm:

```bash
echo "temporary" > maybe-delete.txt
rm -i maybe-delete.txt
```

Type `y` for yes or `n` for no.

## Try it

Create, copy, rename, and remove a file:

```bash
echo "practice" > practice.txt
cp practice.txt backup.txt
mv practice.txt final.txt
ls
rm -i backup.txt
```

## Checkpoint

1. What command renames a file?
2. Why does copying folders need `cp -r`?
3. What should you check before using `rm -r`?
