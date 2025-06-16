
all: uboot kernel ko

uboot:
	cd u-boot-v2017 && ./dc-a588.sh

kernel:
	cd kernel-5.10 && ./dc-a588.sh
	cd tools && ./pack.sh

ko:
	ls -alh rockdev/modules/*.ko
	md5sum rockdev/modules/*.ko
