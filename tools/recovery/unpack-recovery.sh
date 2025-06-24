#!/bin/bash

set -x

RESOURCE_IMG=resource.img
OUTPUT_DIR="resource.img-unpack"

if [ $# -eq 1 ] ; then
	RESOURCE_IMG=$1
fi

if [ ! -f "${RESOURCE_IMG}" ]; then
    echo "Error: ${RESOURCE_IMG} not found!"
    exit 1
fi

mkdir -p "$OUTPUT_DIR" 

dumpimage -l resource.img > "$OUTPUT_DIR/image_info.txt"

#dumpimage -i resource.img -T flat_dt -p 0 resource.img-unpack/uboot
#dumpimage -i resource.img -T flat_dt -p 1 resource.img-unpack/atf-1
#dumpimage -i resource.img -T flat_dt -p 1 resource.img-unpack/atf-2
#dumpimage -i resource.img -T flat_dt -p 3 resource.img-unpack/atf-3
#dumpimage -i resource.img -T flat_dt -p 4 resource.img-unpack/atf-4
#dumpimage -i resource.img -T flat_dt -p 5 resource.img-unpack/optee
#dumpimage -i resource.img -T flat_dt -p 6 resource.img-unpack/fdt

# 解析dumpimage输出并导出各Image节
dumpimage -l resource.img | grep 'Image' | while read line; do
    if [[ $line =~ ^Image[[:space:]]+([0-9]+)[[:space:]]+\((.+)\) ]]; then
        IMAGE_NUM="${BASH_REMATCH[1]}"
        IMAGE_NAME="${BASH_REMATCH[2]}"
        OUTPUT_FILE="$OUTPUT_DIR/$IMAGE_NAME"

        echo "Extracting Image $IMAGE_NUM ($IMAGE_NAME) to $OUTPUT_FILE"
        dumpimage -i "$RESOURCE_IMG" -T flat_dt -p "$IMAGE_NUM" "$OUTPUT_FILE"
    fi
done

ls -alh ${OUTPUT_DIR}
file ${OUTPUT_DIR}/*

echo "All done!"

