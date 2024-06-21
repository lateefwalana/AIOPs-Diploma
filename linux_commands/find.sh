# find command

find path -name filename # This finds files 
OR
find path -type f file 

find path -type d -name directory name # This finds directries 

find . -type d -perm 0664 -print

find . -perm /u=r # find files where user have read-only permissions 
find . -perm /g=r # find files where group have read-only permissions
find . -perm /o=r # find files where others have read-only permissions 


find path -type f -name '*.txt' -exec rm -f {} \; # This will remove all files with .txt extention

find path -type d -perm 777 -print -exec rm chmod {} \; # This will change permissons on directory

find . -type d -perm 0755 -print -exec chmod 775 {} \;
# find empty files
find . -type d -size 0
