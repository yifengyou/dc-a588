#!/bin/bash

set -x

cp -a *.sh d3588.git/
chown -R 1000:1000 d3588.git/

docker run \
	--privileged \
	-it \
	--rm \
	-v /dev:/dev \
	-v `pwd`/d3588.git:/home/builder/armbian/build \
	-w /home/builder/armbian/build \
	ubuntu2204:latest \
	bash

