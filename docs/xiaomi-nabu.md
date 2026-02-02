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
 - [ArKT-9's modded twrp](https://github.com/ArKT-7/nabu-files/raw/refs/heads/main/recovery/mod-linux-twrp.img) (twrp.img)
 - [Aloha android dualboot installer](https://github.com/rodriguezst/nabu-dualboot-img/releases/download/20250422/installer_bootmanager_NOSB.zip) (installer\_bootmanager\_NOSB.zip)

## Installing
### Clean

> [!TIP]
> If you're only installed pocketlblue with release scripts, then you still needed to do clean install \
> If you're installed dualbooting with A/B slots, you can skip *Clean* section.

---

First, you need to reboot to recovery. Press Vol- button on turned off device and connect it to PC, then boot into recovery:
```shell
fastboot boot twrp.img
```

Then, press onto the "Penguin" logo, and press on "Restore partitions" and accept. Your partition table will be recovered from previous changes.

 
