#!/usr/bin/bash
set -uexo pipefail

mkdir esp.mnt
mount esp.raw esp.mnt > /dev/zero

basedir=$(dirname $0)
echo $($basedir/extract_uuid_from_cfg.py esp.mnt/EFI/fedora/bootuuid.cfg)

umount esp.mnt
rm -rf esp.mnt
