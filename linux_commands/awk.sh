server	ip_address
apache	192.168.1.2
sftp	192.168.1.3
nginx	192.168.1.5

cat task_cut.txt | awk {print $0}
cat task_cut.txt | awk '{print $0}'
cat task_cut.txt | awk '{print $1}'
cat task_cut.txt | awk '{print $2}'
cat task_cut.txt | awk '{print $1}'


---------------

mroot:~$ date
Wed  5 Jun 00:18:48 BST 2024

mroot:~$ date | awk {'print $1,$2,$3'}
Wed 5 Jun

OFS = Outpout Field Seprator

mroot:~$ date | awk 'OFS="/" {print $1,$2,$3}'
Wed/5/Jun
mroot:~$ date | awk 'OFS="-" {print $1,$2,$3}'
Wed-5-Jun
-----------------

awk 'BEGIN {print "Hey, my name is Muhammad Lateef"}'

-----







