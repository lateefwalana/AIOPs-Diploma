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
systemctl start vsftpd
systemctl status vsftpd
```
## Enable the service 
If we want the service to auto restart after reboot, we have to enable the services 
```
systemctl enable vsftpd
```
## Other verifications commands
The follwoing commands are useful to verify the service status 
```
systemctl is-active vsftpd
systemctl is-enabled vsftpd
ss -tulnp | grep -i 21
```
## FTP path
FTP default path is `/var/ftp/`