# Back tools
## Back types
- complete backups
- incremental backups
- differential backups
- cumlative backups

rsync can be combined with compression tools 

rsync | tar
rsync | zip

## rsync

15 examples of using `rsync`, a powerful file copying tool that can synchronize files and directories between two locations over a network or on the same machine.

1. **Basic file copy:**
   ```bash
   rsync -av /source/file.txt /destination/
   ```

2. **Copy a directory recursively:**
   ```bash
   rsync -av /source/directory/ /destination/directory/
   ```

3. **Copy and delete files at the destination that are not at the source:**
   ```bash
   rsync -av --delete /source/directory/ /destination/directory/
   ```

4. **Copy only files that have changed or are new:**
   ```bash
   rsync -av --update /source/directory/ /destination/directory/
   ```

5. **Show progress during transfer:**
   ```bash
   rsync -av --progress /source/directory/ /destination/directory/
   ```

6. **Copy files over SSH:**
   ```bash
   rsync -av -e ssh /source/directory/ user@remote:/destination/directory/
   ```

7. **Exclude specific files or directories:**
   ```bash
   rsync -av --exclude 'file.txt' /source/directory/ /destination/directory/
   ```

8. **Include only specific files or directories:**
   ```bash
   rsync -av --include 'file.txt' --exclude '*' /source/directory/ /destination/directory/
   ```

9. **Limit bandwidth usage:**
   ```bash
   rsync -av --bwlimit=1000 /source/directory/ /destination/directory/
   ```

10. **Preserve file permissions, times, symbolic links, etc.:**
    ```bash
    rsync -a /source/directory/ /destination/directory/
    ```

11. **Dry run to see what will be transferred:**
    ```bash
    rsync -av --dry-run /source/directory/ /destination/directory/
    ```

12. **Copy files larger than a specific size:**
    ```bash
    rsync -av --min-size=1M /source/directory/ /destination/directory/
    ```

13. **Copy files smaller than a specific size:**
    ```bash
    rsync -av --max-size=1M /source/directory/ /destination/directory/
    ```

14. **Copy files while preserving hard links:**
    ```bash
    rsync -avH /source/directory/ /destination/directory/
    ```

15. **Compress file data during the transfer:**
    ```bash
    rsync -avz /source/directory/ /destination/directory/
    ```

These examples cover a range of common uses for `rsync`, showcasing its flexibility and powerful features.

## scp
