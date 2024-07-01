### All about NFS

# Install package 
```
yum install nfs-utils -y
```
# Enable services
This will enable services 
```
systemctl enable rpcbind
systemctl enable nfs-server
```
# Start services
```
systemctl start rpcbind
systemctl start nfs-server
```
# Check status of both services 
```
systemctl status rpcbind
systemctl status nfs-server
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
> [!IMPORTANT]
> Make sure `nfs-util` packege is also installed on client device 

To check what is shared, run the following command 
```
showmount -e server1.example.com
```
## Mouting

```
mkdir /myshare
mount server1.example.com:/opt/fileserver /myshare/
```
## make it permanent
```
vi /etc/fstab
server1.example.com:/opt/fileserver /myshare nfs defaults 0 0
```
# Open firewall for NFS operations
```
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=mountd
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --reload
```

