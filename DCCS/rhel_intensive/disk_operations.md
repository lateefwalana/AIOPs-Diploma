## mounting disk

# Temp mounting 
## command syntext
mount <disk path> <mount_point>
## exmaple
mount /dev/sdb1 /tomcat

## Update kernal
partx -a /dev/sdb

## format disk
mkfs.ext[2-4] /dev/sdb1

# permanent mounting 
## fstab
### edit fstab file 
vi /ect/fstab

/dev/sdb1 /part1 ext2 defaults 1 2
/dev/sdb2 /part2 ext3 defaults 1 2


