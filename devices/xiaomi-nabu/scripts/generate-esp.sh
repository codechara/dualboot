#!/usr/bin/bash
set -uexo pipefail

export UUID=$(sudo blkid -s UUID -o value release/images/fedora_esp.raw | tr -d '-')
dd if=/dev/zero of=esp.raw bs=1M count=300
mkfs.vfat -F 32 -S 4096 -n EFI -i $UUID esp.raw

mkdir esp.orig esp.gen
mount release/images/fedora_esp.raw esp.orig
mount esp.raw esp.gen

mkdir esp.gen/EFI
cp refind/refind esp.gen/EFI/BOOT -r && mv esp.gen/EFI/BOOT/refind_aa64.efi esp.gen/EFI/BOOT/BOOTAA64.EFI
cp reboot2android/android -r esp.gen/EFI/
cp esp.orig/EFI/fedora -r esp.gen/EFI

if [[ "$CUSTOM_UUID" != "" ]]; then
    echo "set BOOT_UUID=\"$CUSTOM_UUID\"" > esp.gen/EFI/fedora/bootuuid.cfg
fi

umount esp.orig esp.gen
rm -rf esp.orig esp.gen
