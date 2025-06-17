#!/bin/bash

set -x

UBOOT_IMG=uboot.img
OUTPUT_DIR="uboot.img-unpack"

if [ $# -eq 1 ] ; then
	UBOOT_IMG=$1
fi

if [ ! -f "${UBOOT_IMG}" ]; then
    echo "Error: ${UBOOT_IMG} not found!"
    exit 1
fi

mkdir -p "$OUTPUT_DIR" 

dumpimage -l uboot.img > "$OUTPUT_DIR/image_info.txt"

#dumpimage -i uboot.img -T flat_dt -p 0 uboot.img-unpack/uboot
#dumpimage -i uboot.img -T flat_dt -p 1 uboot.img-unpack/atf-1
#dumpimage -i uboot.img -T flat_dt -p 1 uboot.img-unpack/atf-2
#dumpimage -i uboot.img -T flat_dt -p 3 uboot.img-unpack/atf-3
#dumpimage -i uboot.img -T flat_dt -p 4 uboot.img-unpack/atf-4
#dumpimage -i uboot.img -T flat_dt -p 5 uboot.img-unpack/optee
#dumpimage -i uboot.img -T flat_dt -p 6 uboot.img-unpack/fdt

# 解析dumpimage输出并导出各Image节
dumpimage -l uboot.img | grep 'Image' | while read line; do
    if [[ $line =~ ^Image[[:space:]]+([0-9]+)[[:space:]]+\((.+)\) ]]; then
        IMAGE_NUM="${BASH_REMATCH[1]}"
        IMAGE_NAME="${BASH_REMATCH[2]}"
        OUTPUT_FILE="$OUTPUT_DIR/$IMAGE_NAME"

        echo "Extracting Image $IMAGE_NUM ($IMAGE_NAME) to $OUTPUT_FILE"
        dumpimage -i "$UBOOT_IMG" -T flat_dt -p "$IMAGE_NUM" "$OUTPUT_FILE"
    fi
done

ls -alh ${OUTPUT_DIR}
file ${OUTPUT_DIR}/*

echo "All done!"

