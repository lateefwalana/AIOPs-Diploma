apache,192.168.1.2
sftp,192.168.1.3
nginx,192.168.1.5



mroot:excercises$ cat task_cut.txt
apache,192.168.1.2
sftp,192.168.1.3
nginx,192.168.1.5mroot:excercises$
mroot:excercises$
mroot:excercises$
mroot:excercises$ cat task_cut.txt | grep apache | cut -d "," -f 2
192.168.1.2
mroot:excercises$
