# Apache Server
In this example lets look at the flow of installing and  setting up apache web server 
- Install apache server
- Create a simple web page `/var/www/html/index.html`
- Configure website in `httpd.conf`
- Configure DNS locallay `/etc/hosts`

## Install apache 
In rhel, apache is called httpd
To install it, you can use yum or dnf.
```
sudo dnf install httpd

# verify installation
rpm -qa  httpd
httpd-2.4.57-8.el9.x86_64

# Start and enable the service
systemctl start httpd
systemctl enable httpd

# add http to firewall
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
firewall-cmd --list-services

```
## Create a html file 

The file name must end with .html for example `index.html`
```
<!DOCTYPE html>
<html>
<body>

<h1>Simple HTML page</h1>
<p>We are learning how to host a web site using apache web server.</p>

</body>
</html>
```
> [!TIP]
> Everytime you make changes, httpd must be restarted for changes to take effect. `systecmctl restart httpd`

## Apache config
The config file have three main sections 
- Global
- Main
- Virtual host

copy sample file from `/usr/share/doc/httpd-core/httpd-vhosts.conf` to `/etc/httpd/config.d/`
```
cp /usr/share/doc/httpd-core/httpd-vhosts.conf /etc/httpd/conf.d/
```
The virtual host config is at the end of the config file

```
# Sample config
<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host.example.com
    DocumentRoot "/var/www/dummy-host.example.com"
    ServerName dummy-host.example.com
    ServerAlias www.dummy-host.example.com
    ErrorLog "/var/log/httpd/dummy-host.example.com-error_log"
    CustomLog "/var/log/httpd/dummy-host.example.com-access_log" common
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "/var/www/dummy-host2.example.com"
    ServerName dummy-host2.example.com
    ErrorLog "/var/log/httpd/dummy-host2.example.com-error_log"
    CustomLog "/var/log/httpd/dummy-host2.example.com-access_log" common
</VirtualHost>

```
```
# my config
<VirtualHost *:80>
    ServerAdmin webmaster@tcp.ip
    DocumentRoot "/var/www/html/"
    ServerName server1.tcp.ip
    ServerAlias www.server1.tcp.ip
    ErrorLog "/var/log/httpd/server1.tcp.ip-error_log"
    CustomLog "/var/log/httpd/server1.tcp.ip-access_log" common
</VirtualHost>
```

Once the required changes are made, test the syntex using `httpd -t`. If the response is: `Syntax OK` then you are you are good to go.

## Add dns
Add dns entry in local host file `/etc/hosts`
```
<server name>   <ip addresss>
```