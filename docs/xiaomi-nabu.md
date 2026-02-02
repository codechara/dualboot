# Xiaomi Pad 5 UEFI

This guide will help you setup Android Stock/Custom ROM & Pocketblue dualbooting via UEFI & rEFInd!

> [!CAUTION]
> This guide is WIP. ***Read this guide with caution. We're not responsible for any bricked devices. You've been warned.***
> If you're doing clean installation, ***your data will be erased.***

> [!TIP]
> For people that uses A/B slots for dualbooting, you don't need to repartition device or/and do clean install. (only if you're do repartitioning with ArKT-9's modded recovery) 

## Prepare

This guide should work on Windows/Linux systems with adb & fastboot installed: 

You should prepare some files that helps you with installation:
 - [ArKT-7's modded twrp](https://github.com/ArKT-7/nabu-files/raw/refs/heads/main/recovery/mod-linux-twrp.img) (twrp.img)
 - [Aloha android dualboot installer](https://github.com/rodriguezst/nabu-dualboot-img/releases/download/20250422/installer_bootmanager_NOSB.zip) (installer\_bootmanager\_NOSB.zip)
 - [Pocketblue](https://github.com/pocketblue/pocketblue/releases)
 - [Dualboot ESP](https://github.com/pocketblue/dualboot/releases) (esp.raw)

> [!WARNING]
> If you're doing clean install, you **should** download the **same version** of Pocketblue and Dualboot ESP

## Installing
### Clean

> [!TIP]
> If you're only installed pocketlblue with release scripts, then you still needed to do clean install. \
> If you're installed dualbooting with A/B slots, you can skip *Clean* section.

First, you need to reboot to recovery. Press Vol- button on turned off device and connect it to PC, then boot into recovery:
```shell
fastboot boot twrp.img
```

Then, press onto the "Penguin" logo, and press on "Restore partitions" and accept. Your partition table will be recovered from previous changes.

Then, you can install your Stock/Custom ROM with fastboot/twrp.

### Repartition

Boot into recovery again:
```shell
fastboot boot twrp.img
```

Then, press onto the "Penguin" logo, and press on "Partitioning". It will ask for `linux` partition size. I'll recommend a half of android size (only if you have a 256 GB version)

### Installing Pocketblue

> [!TIP]
> If you're moving from dualbooting with A/B slots, you should do first #creating-own-dualboot-esp before proceed.

## Tips
### Creating own Dualboot ESP

Why do you need to create own Dualboot ESP? Becauze every Pocketblue on every DE generates `boot` with different UUIDs. This means that if Pocketblue GRUB (which is in ESP) has one UUID, and the `boot` partition on your device has a completely different one, GRUB will not see `boot` and will not be able to boot the system.

First, on booted Pocketblue you should find `cust` or `fedora_boot` named partition:
```
sudo lsblk -o NAME,PARTNAME /dev/sda
```

Next, you need to copy the partition UUID:
```
sudo blkid /dev/sdaX # where is X, it's should be a number of cust/fedora_boot partition. Like: /dev/sda29
```

Then, you need to fork a [dualboot](https://github.com/pocketblue/dualboot), then go to Actions page, press onto `xiaomi-nabu-esp-repacker` action, press onto "Run workflow" button and paste UUID to "Custom UUID for GRUB". 
> You can leave Release URL empty.

Then, go to this action and wait a few minutes, go to the Artifacts and download a `esp.raw`
