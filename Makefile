
all: uboot kernel ko

uboot:
	cd u-boot-v2017 && ./dc-a588.sh

kernel:
	cd kernel-5.10 && ./dc-a588.sh

release:
	mkdir -p rockdev
	cp -a uboot/output/uboot.img rockdev/
	cp -a kernel/output/boot.img rockdev/

ko:
	ls -alh rockdev/modules/*.ko
	md5sum rockdev/modules/*.ko
