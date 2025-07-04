
all: uboot kernel ko

uboot:
	cd u-boot-v2017 && ./dc-a588.sh

kernel-5.10.110:
	cd kernel-5.10.110 && ./dc-a588.sh

kernel-5.10.226:
	cd kernel-5.10.110 && ./dc-a588.sh

kernel-6.1.115:
	cd kernel-5.10.110 && ./dc-a588.sh

release:
	mkdir -p rockdev
	cp -a uboot/output/uboot.img rockdev/
	cp -a kernel/output/boot.img rockdev/

ko:
	ls -alh rockdev/modules/*.ko
	md5sum rockdev/modules/*.ko
