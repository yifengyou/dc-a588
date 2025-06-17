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

mkdir -p boot-unpack
dumpimage -i ${IMG} -T flat_dt  -p 0 boot-unpack/boot_fdt
ls -alh boot-unpack/boot_fdt

dumpimage -i ${IMG} -T flat_dt  -p 1 boot-unpack/boot_kernel
ls -alh boot-unpack/boot_kernel

dumpimage -i ${IMG} -T flat_dt  -p 2 boot-unpack/resource
ls -alh boot-unpack/boot_resource

exit 0
rm -rf out
/data/rk3588/rk3588-latest/kernel/scripts/resource_tool  --unpack --image=boot_resource
ls -alh out

