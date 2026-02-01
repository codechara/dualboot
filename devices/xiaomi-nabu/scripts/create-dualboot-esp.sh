#!/usr/bin/bash
set -uexo pipefail

export UUID=$(sudo blkid -s UUID -o value release/images/fedora_esp.raw | tr -d '-')
dd if=/dev/zero of=esp.raw bs=1M count=300
mkfs.vfat -F 32 -S 4096 -n EFI -i $UUID esp.raw

mkdir esp.orig esp.dual
mount release/images/fedora_esp.raw esp.orig
mount esp.raw esp.dual

cp dualboot/devices/xiaomi-nabu/EFI esp.dual -r
cp esp.orig/EFI/fedora esp.dual/EFI -r

umount esp.orig esp.dual
rm -r esp.orig esp.dual
