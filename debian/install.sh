#!/bin/bash


set -x

apt-get update
apt-get install -y git lrzsz xorgxrdp xrdp vim tmux build-essential

git config --global user.name yifengyou
git config --global user.email 842056007@qq.com
git config --global pull.ff only

apt-get install -y virt-manager virt-viewer virtinst virt-what docker-compose \
	openvpn xfce4 xfce4-panel qemu-efi-aarch64 gdb lvm2 device-tree-compiler \
	mmc-utils nginx locales iftop flex bison m4 libssl-dev bc \
	spice-client-glib-usb-acl-helper gir1.2-spiceclientgtk-3.0 \
	libspice-client-gtk-3.0-5 gir1.2-spiceclientglib-2.0 libspice-server1 virt-viewer \
	xfce4-terminal ovmf ovmf-ia32 p7zip-full python3-pip \
	libvirt-clients libvirt-daemon locales libvirt-daemon-system \
	qemu-system gpg qemu-utils at-spi2-core qemu-efi xfce4-terminal \
	liba52-0.7.4 libdca0 htop glances libosinfo-bin command-not-found \
	osinfo-db-tools xfsprogs \
	xfce4-terminal flameshot xfce4-taskmanager \
	task-xfce-desktop lightdm dbus-x11 \
	rsync curl \
	xfce4 \
	xfce4-appfinder \
	xfce4-battery-plugin \
	xfce4-helpers \
	xfce4-panel \
	xfce4-power-manager \
	xfce4-power-manager-data \
	xfce4-screenshooter \
	xfce4-session \
	xfce4-settings \
	xfce4-terminal


apt-file update

