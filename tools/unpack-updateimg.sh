#!/bin/bash

set -xe

if [ $# -ne 1 ] ; then
	echo "Usage: $0 update.img"
	exit 1
fi

echo "start to unpack update.img..."
mkdir -p output
if [ ! -f "$1" ]; then
	echo "Error:Not valid file $1"
	exit 1
fi

rkImageMaker -unpack "$1" output
mkdir -p output/image
afptool -unpack output/firmware.img output/image

ls -alh
echo "All done!"



exit 0



# demo output

```
# unpack-updateimg.sh A588_ubuntu20.04_20230202-135921_V1.0.img
+ '[' 1 -ne 1 ']'
+ echo 'start to unpack update.img...'
start to unpack update.img...
+ mkdir -p output
+ '[' '!' -f A588_ubuntu20.04_20230202-135921_V1.0.img ']'
+ rkImageMaker -unpack A588_ubuntu20.04_20230202-135921_V1.0.img output
********rkImageMaker ver 2.29********
Unpacking image, please wait...
Exporting boot.bin
Exporting firmware.img
Unpacking image success.
+ mkdir -p output/image
+ afptool -unpack output/firmware.img output/image
Android Firmware Package Tool v2.29
Check file... OK
------- UNPACK ------
output/image/package-file	offset=0x800	size=0x257
output/image/MiniLoaderAll.bin	offset=0x1000	size=0x6D9C0
output/image/parameter.txt	offset=0x6F000	size=0x217
output/image/uboot.img	offset=0x6F800	size=0x400000
output/image/misc.img	offset=0x46F800	size=0xC000
output/image/boot.img	offset=0x47B800	size=0xDB4000
output/image/recovery.img	offset=0x122F800	size=0x2A20E00
output/image/rootfs.img	offset=0x3C50800	size=0xECD00000
output/image/oem.img	offset=0xF0950800	size=0x10A8000
output/image/userdata.img	offset=0xF19F8800	size=0x446000
Unpack firmware OK!
------ OK ------
+ ls -alh
total 11G
drwxr-xr-x 3 root root 4.0K Jun 17 09:48 .
drwxr-xr-x 5 root root 4.0K Jun 17 09:28 ..
-rw-r--r-- 1 root root 1.6G Jun 17 09:30 1.img
-rw-r--r-- 1 root root 3.8G Jun 17 09:36 2.img
-rw-r--r-- 1 root root 3.8G Feb  2  2023 A588_ubuntu20.04_20230202-135921_V1.0.img
-rw-r--r-- 1 root root 1.1G Jun 17 09:39 archive.rar
drwxr-xr-x 3 root root 4.0K Jun 17 09:48 output
+ echo 'All done!'
All done!
```
