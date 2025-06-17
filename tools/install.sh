#!/bin/bash

set -x

cp -a bin/*       /bin/
# update img tools
cp -a updateimg/unpack-updateimg.sh /bin/
cp -a updateimg/pack-updateimg.sh /bin/
# uboot img tools
cp -a uboot/unpack-uboot.sh /bin/
cp -a uboot/pack-uboot.sh /bin/
# boot img tools
cp -a boot/unpack-boot.sh /bin/
cp -a boot/pack-boot.sh /bin/


