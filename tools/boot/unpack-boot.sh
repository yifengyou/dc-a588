#!/bin/bash

set -x

WORKDIR=`pwd`
IMG=boot.img

if [ $# -eq 1 ] ; then
	IMG=$1
fi

if [ ! -f ${IMG} ] ; then
	echo "Error! ${IMG} not found!"
	exit 1
fi


file_info=$(file -b ${IMG})
if [[ "$file_info" =~ "Device Tree Blob version" ]]; then
	echo "Device Tree Blob version"
	mkdir -p boot-unpack
	dumpimage -i ${IMG} -T flat_dt  -p 0 boot-unpack/boot_fdt
	ls -alh boot-unpack/boot_fdt

	dumpimage -i ${IMG} -T flat_dt  -p 1 boot-unpack/boot_kernel
	ls -alh boot-unpack/boot_kernel

	dumpimage -i ${IMG} -T flat_dt  -p 2 boot-unpack/boot_resource
	ls -alh boot-unpack/boot_resource
	cd boot-unpack
	resource_tool  --unpack --image=boot_resource
	cd ${WORKDIR}
	tree boot-unpack
elif [[ "$file_info" =~ "Android bootimg" ]]; then
	echo "Android bootimg"
	mkdir -p boot-unpack
	unpack_bootimg --boot_img ${IMG} --out boot-unpack
	cd boot-unpack
	resource_tool --unpack --image=second
	cd ${WORKDIR}
	tree boot-unpack
else
	echo "unknown file type or not supported: $file_info"
fi

exit 0

