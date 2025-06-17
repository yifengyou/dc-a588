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
afptool -unpack output/firmware.img output

ls -alh
echo "All done!"

