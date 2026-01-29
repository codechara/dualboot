#!/usr/bin/bash

set -uexo pipefail

dd if=/dev/zero of=esp.raw bs=1M count=256
mkfs.vfat -F 32 -S 4096 -n EFI esp.raw

mkdir esp_new esp_produced

mount esp.raw esp_new
mount /dev/mapper/loop0p1 esp_produced

cp dualboot/devices/xiaomi-nabu/EFI esp_new -r
cp esp_produced/EFI/fedora esp_new/EFI -r

umount esp_*
