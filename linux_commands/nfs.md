### All about NFS

# Install package 
```
yum install nfs-utils -y
```
# Enable services
This will enable services 
```
systemctl enable rpcbind
systemctl enable nfs
```
# Start services
```
systemctl start rpcbind
systemctl start nfs
```
# Check status of both services 
```
systemctl status rpcbind
systemctl status nfs
```

## Share a folder
# Create directory 
```
mkdir /opt/fileserver
```
In Linux to share folder, you need to modify the following file
```
/etc/export
```
Add the directory path to /etc/export
```
/opt/fileserver *(sync)
```
run the following command to load it into memory
```
exportfs -rv
```

# Access NFS share from client device
To check what is shared, run the following command 
```
showmount -e server1.example.com
```
##mout
```
mkdir /myshare
mount server1.example.com:/opt/fileserver /myshare/
```
## make it permanent
```
vi /etc/fstab
server1.example.com:/opt/fileserver /myshare nfs defaults 0 0
```