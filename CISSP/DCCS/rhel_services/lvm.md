# All about LVMs
disk = 500MB
create partion = 300MB
steps:
pv -> vg -> lv

pv = physical volume = total disk size
vg = volume group = 500MB
lv - volume group = 300MB

## commands:
pvcreate /dev/sdc1

vgcreate myvol /dev/sdc1

lvcreate -L 300M -n lv1 myvol


