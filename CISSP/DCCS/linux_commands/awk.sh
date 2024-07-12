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
# run who command present data in tabular farm, add headers
mroot:~$ who | awk 'BEGIN { OFS="\t"; print "Active", "Sessions"} {print $1,$4}'
Active  Sessions
mroot   21:43
mroot   21:43
mroot   22:27

mroot:~$ awk -v name="Ali" 'BEGIN {print name}'
Ali

mroot:~$ name="Ali"
mroot:~$ awk -v name=$name 'BEGIN{print name}'
Ali

mroot:~$ cat /etc/passwd | awk 'BEGIN {print "START"} /mroot/ {print $0} END {print "END"}'
START
mroot:x:1000:1000:mroot,,,:/home/mroot:/bin/bash
END

# for loop
awk 'BEGIN {for (i=1; i<=10; i++) print "The numner is: ", i}'
The numner is:  1
The numner is:  2
The numner is:  3
The numner is:  4
The numner is:  5
The numner is:  6
The numner is:  7
The numner is:  8
The numner is:  9
The numner is:  10

# while loop

mroot:~$ awk 'BEGIN { i=1; while (i<=10) print "The number is: "i++ }'
The number is: 1
The number is: 2
The number is: 3
The number is: 4
The number is: 5
The number is: 6
The number is: 7
The number is: 8
The number is: 9
The number is: 10

mroot:~$ awk 'BEGIN { i=1; while (i<=10) {print "The number is: ", i++ }}'
The number is:  1
The number is:  2
The number is:  3
The number is:  4
The number is:  5
The number is:  6
The number is:  7
The number is:  8
The number is:  9
The number is:  10











