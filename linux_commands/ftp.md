# All about FTP
FTP stand for File transfer portocol and its default port is tcp/udp port 21/20. As its name suggest, it is used for transfering files.

21 is used for connection 
20 is used for data transfer

- wuftpd
- proftp
- sftp
- vsftpd

> Lets look at how to install and configure vsftpd
## Install vsftpd
```
dnf install vsftpd
or
yum install vsftpd
```
> [!NOTE]
> dnf is new version of yum

## Start and verify the service
```
[root@server1 opt]# systemctl start vsftpd
[root@server1 opt]# systemctl status vsftpd
● vsftpd.service - Vsftpd ftp daemon
     Loaded: loaded (/usr/lib/systemd/system/vsftpd.service; disabled; preset: disabled)
     Active: active (running) since Tue 2024-07-02 01:20:55 BST; 8s ago
    Process: 1579 ExecStart=/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf (code=exited, status=0/SUCCESS)
   Main PID: 1580 (vsftpd)
      Tasks: 1 (limit: 23170)
     Memory: 720.0K
        CPU: 6ms
     CGroup: /system.slice/vsftpd.service
             └─1580 /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

Jul 02 01:20:55 server1 systemd[1]: Starting Vsftpd ftp daemon...
Jul 02 01:20:55 server1 systemd[1]: Started Vsftpd ftp daemon.
OR
[root@server1 opt]# systemctl is-active vsftpd
active
```

