# Network related commands

```
lspci
```
## Network interface properties
```
ethtool eth0
```

## Configure static ip

```
ifconfig eth0 192.168.1.1 netmask 255.255.255.0
```

If server reboots, this config will be removed.

To make it permanent, we need to modify `ifcfg` files at the following location.

```
/etc/sysconfig/network-scripts/
```

file name example - ifcfg-eth0

```
DEVICE=eth0
BOOTPROTO=static
HWADDR=08:00:27:B1:4E:F9
IPADDR=192.168.1.51
GATEWAY=192.168.1.1
NETMASK=255.255.255.0
```
To load the new config use the following command
all files named with be loaded, dont't backup files with name starting ifcfg
```
service network reststart
```
Use the follwing command to set ip using wizard.
```
setup
```
## How to Configure Gateway
Check current gateway
```
route -n
```
Add gateway
```
route add default gw <gateway_ip>
route add default gw 192.168.1.1
route del defautl gw 192.168.1.1 # This will remove the gateway.
```
To make this config permanent, add it to `ifcfg` file.
Once the file is edited and saved, use the following commands to restart interfaces or network service.
```
ifconfig eth1 up
ifconfig eth1 down
ifup eth1
ifdown eth1

service network restart # This will restart all interfaces
```
## Static routes
Adding a static route
```
ip route add {NETWORK/MASK} via {GATEWAYIP}
ip route add 10.1.1.0/24 via 192.168.1.2
ip route add {NETWORK/MASK} dev {DEVICE}
ip route add 10.1.2.0/24 dev eth2
ip route add default {NETWORK/MASK} dev {DEVICE}
ip route add default {NETWORK/MASK} via {GATEWAYIP}
```
## DNS
DNS use nameserver that is configured in the following file.
resolv.conf
```
/etc/resolv.conf
```



