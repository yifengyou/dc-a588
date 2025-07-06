#!/bin/bash

set -x

chown -R 1000:1000 ./*

docker run \
	--privileged \
	-it \
	--rm \
	-v /dev:/dev \
	-v `pwd`:/home/builder/armbian/build \
	-w /home/builder/armbian/build \
	ubuntu2204:latest \
	bash


