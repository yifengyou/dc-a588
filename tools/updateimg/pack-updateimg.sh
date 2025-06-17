#!/bin/bash

set -xe

TARGETDIR=.
if [ $# -eq 1 ] ; then
	TARGETDIR=$1
fi

if [ ! -d "${TARGETDIR}" ] ; then
	echo "Error: ${TARGETDIR} is not valid directory"
	exit 1
fi

echo "start to pack update.img..."
if [ ! -f "${TARGETDIR}/package-file" ]; then
	echo "Error: ${TARGETDIR}/package-file not found!"
	exit 1
fi
if [ ! -f "${TARGETDIR}/parameter.txt" ]; then
	echo "Error: ${TARGETDIR}/parameter.txt not found!"
	exit 1
fi

afptool -pack ${TARGETDIR} firmware.img
rkImageMaker -RK3588 ${TARGETDIR}/MiniLoaderAll.bin firmware.img update.img -os_type:androidos

ls -alh
echo "All done!"


exit 0



# demo output

```
# pack-updateimg.sh image/
+ TARGETDIR=.
+ '[' 1 -eq 1 ']'
+ TARGETDIR=image/
+ '[' '!' -d image/ ']'
+ echo 'start to pack update.img...'
start to pack update.img...
+ '[' '!' -f image//package-file ']'
+ '[' '!' -f image//parameter.txt ']'
+ afptool -pack image/ firmware.img
Android Firmware Package Tool v2.29
------ PACKAGE ------
Add file: image/package-file
package-file,Add file: image/package-file done,offset=0x800,size=0xed,userspace=0x1
Add file: image/MiniLoaderAll.bin
bootloader,Add file: image/MiniLoaderAll.bin done,offset=0x1000,size=0x6d9c0,userspace=0xdc
Add file: image/parameter.txt
parameter,Add file: image/parameter.txt done,offset=0x6f000,size=0x223,userspace=0x1,flash_address=0x00000000
Add file: image/uboot.img
uboot,Add file: image/uboot.img done,offset=0x6f800,size=0x400000,userspace=0x800,flash_address=0x00004000
Add file: image/misc.img
misc,Add file: image/misc.img done,offset=0x46f800,size=0xc000,userspace=0x18,flash_address=0x00006000
Add file: image/boot.img
boot,Add file: image/boot.img done,offset=0x47b800,size=0xdb4000,userspace=0x1b68,flash_address=0x00008000
Add file: image/recovery.img
recovery,Add file: image/recovery.img done,offset=0x122f800,size=0x2a20e00,userspace=0x5442,flash_address=0x00028000
Add file: image/rootfs.img
rootfs,Add file: image/rootfs.img done,offset=0x3c50800,size=0xecd00000,userspace=0x1d9a00,flash_address=0x000c2000
Add file: image/oem.img
oem,Add file: image/oem.img done,offset=0xf0950800,size=0x10a8000,userspace=0x2150,flash_address=0x00082000
Add file: image/userdata.img
userdata,Add file: image/userdata.img done,offset=0xf19f8800,size=0x446000,userspace=0x88c,flash_address=0x00078000
Add CRC...
Make firmware OK!
------ OK ------
+ rkImageMaker -RK3588 image//MiniLoaderAll.bin firmware.img update.img -os_type:androidos
********rkImageMaker ver 2.29********
Generating new image, please wait...
Writing head info...
Writing boot file...
Writing firmware...
Generating MD5 data...
MD5 data generated successfully!
New image generated successfully!
+ ls -alh
total 7.6G
drwxr-xr-x 3 root root 4.0K Jun 17 10:01 .
drwxr-xr-x 3 root root 4.0K Jun 17 09:53 ..
-rw-r--r-- 1 root root 439K Jun 17 09:48 boot.bin
-rw-r--r-- 1 root root 3.8G Jun 17 10:01 firmware.img
drwxr-xr-x 2 root root 4.0K Jun 17 10:00 image
-rw-r--r-- 1 root root 3.8G Jun 17 10:01 update.img
+ echo 'All done!'
All done!
+ exit 0
```
