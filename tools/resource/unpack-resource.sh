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

resource_tool --verbose --unpack --image=${RESOURCE_IMG}
mv out ${OUTPUT_DIR}

ls -alh ${OUTPUT_DIR}
file ${OUTPUT_DIR}/*

echo "All done!"

