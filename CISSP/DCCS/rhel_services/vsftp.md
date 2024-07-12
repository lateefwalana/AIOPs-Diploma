# vSFTPd
Some useful commands
```
systemctl list-units
systemctl list-unit-files | grep vsftpd

firewall-cmd --state

rpm -qa | grep -i vsftpd # shows installed
rpm -ql | grep vsftpd
rpm -qc vsftpd # shows config files
rpm -qd vsftpd # documentation files
```
## User types
- annonymus user
- normal user /etc/passwd aka system local accounts
- virtual users
## Config files
```
[root@server1 vsftpd]# rpm -qc vsftpd
/etc/logrotate.d/vsftpd
/etc/pam.d/vsftpd
/etc/vsftpd/ftpusers
/etc/vsftpd/user_list
/etc/vsftpd/vsftpd.conf
```
## FTP clients
Following is the list of most popular clients used to access files on ftp/vsftp servers 
- lftp
- gftp
- winscp
- filezilla

## FTP operations 
```
mget <filename> # To download files
mput <filename> # To upload files
```
## Security 
Limit user to its own directory. Enable chroot flag in `/etc/vsftpd/vsftpd.config` 

```
vi /etc/vsftpd/vsftpd.conf
chroot_local_user=YES

```
## Command issues 
SELinux might be blocking 
```
sestatus # To check the status of SElinux
setenforce 0 # To disable selinux
setenforce 1 # To enable selinux
```
## Sample config 
The following config sample can be used in production. These most used tags for production
```
listen=YES
anonymous_enable=NO
local_enable=YES
guest_enable=YES
guest_username=virtualftp
write_enable=YES
allow_writeable_chroot=YES

connect_from_port_20=YES
dirmessage_enable=YES
idle_session_timeout=600
data_connection_timeout=120

#dual_log_enable=YES
#anon_upload_enable=YES
#anon_mkdir_write_enable=YES
#anon_other_write_enable=YES
ls_recurse_enable=NO
session_support=YES
virtual_use_local_privs=YES
xferlog_file=/var/log/xferlog
vsftpd_log_file=/var/log/vsftpd.log
xferlog_std_format=YES
ftpd_banner=Welcome to Alnafi FTP Server. To improve the security of the server, SSL encryption has been enabled. This creates a secure connection between the client and the server, over which data can $
chroot_local_user=YES
user_sub_token=$USER
pam_service_name=vsftpd
local_root=/var/ftp/$USER
hide_ids=YES

syslog_enable=YES
log_ftp_protocol=YES
xferlog_enable=YES
dual_log_enable=YES


#ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=NO
force_local_logins_ssl=NO
ssl_tlsv1=YES
ssl_sslv2=YES
ssl_sslv3=YES
#rsa_cert_file=/etc/vsftpd/vsftpd.pem
#require_ssl_reuse=NO

pasv_min_port=20211
pasv_max_port=20218

#listen_port=990




#ssl_enable=YES
#ssl_tlsv1=YES
#ssl_sslv3=YES
rsa_cert_file=/etc/ssl/vsftpd/vsftpd.pem
rsa_private_key_file=/etc/ssl/vsftpd/vsftpd.pem
#rsa_cert_file=/etc/vsftpd/vsftpd.pem
#rsa_private_key_file=/etc/vsftpd/vsftpd.pem
```
