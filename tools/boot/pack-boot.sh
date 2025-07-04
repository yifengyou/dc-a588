#!/bin/bash

set -x


mkbootimg --kernel Image --second second -o boot.img
ls -alh boot.img
binwalk boot.img


exit 0

TIMESTAMP=`date +"%Y%m%d%H%M%S"`
cp Image ok_boot_kernel -a
mkdir ../rockdev
../rkbin/tools/mkimage -f boot.its -E -p 0x800 ../rockdev/boot.img
md5sum ../rockdev/boot.img
realpath ../rockdev/boot.img


exit 0

./scripts/bmpconvert ./logo.bmp
./scripts/bmpconvert ./logo_kernel.bmp

scripts/resource_tool ./arch/arm64/boot/dts/rockchip/rk3588-evb7-lp4-v10-linux.dtb logo.bmp logo_kernel.bmp
echo '  Image:  resource.img (with rk3588-evb7-lp4-v10-linux.dtb logo.bmp logo_kernel.bmp) is ready'

make_boot_img
RAMDISK_IMG_PATH=./ramdisk.img

./scripts/mkbootimg --kernel ./arch/arm64/boot/Image --second resource.img -o boot.img
Image:  boot.img (with Image  resource.img) is ready

./scripts/mkbootimg --kernel ./arch/arm64/boot/Image.lz4 --second resource.img -o zboot.img


exit 0

abootimg --create boot.img \
	-f bootimg.cfg \
	-k zImage \
	-r initrd.img \
	-s stage2.img
