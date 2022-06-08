# TWRP (AOSP 11) for A21s

This source is WIP but so far it works good enough for everyday use

## Bugs 
Everything works except for the following:

- ADB Sideload
- Encryption* (Does decryption even work on any TWRP supported devices these days?)
- Fastbootd
- Haptics*

Vibrator (Haptics) works but I have disabled it for the time being  because it causes a nasty touch delay, will enable it back once I solve the issue.

Some GSIs forces encryption which will make TWRP misbehave
Remove all references to 'avb', 'fileencryption=ice' and 'errors=panic' from fstab.exynos850 in /vendor/etc/ (and /system_root if there is one) and then format /data

## Features
- DTB: Imported KawaKernel DTB
- DTBO: Imported A217MUBS9CVD3 stock recovery DTBO
- Implemented Multidisabler command
- Recovery Kernel is KawaKernel 1.3.1


## Building

Make tw directory and go into it

```bash
mkdir tw; cd tw
```

Clone A21s device tree to device/samsung/a21s

```bash
git clone https://github.com/DozNaka/exynos3830-a21s-twrp.git device/samsung/a21s
```

Init TWRP AOSP 11 manifest repo

```bash
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
```

Sync repo and wait

```bash
repo sync
```

Begin building TWRP

```bash
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_a21s-eng; mka recoveryimage
```

Output will be in tw/out/target/product/a21s/recovery.img

## Installation
### Requirements: Rooted by flashing AP file via Odin that was patched using Magisk App

**Method 1: recovery.img**
- If you are on linux then flash recovery.img with heimdall

```bash
heimdall flash --RECOVERY recovery.img
```

### OR
- You can the TWRP app to flash the recovery.img

### OR
- You can use the dd command to flash recovery.img by placing the recovery.img in /sdcard and running these commands

```bash
su
```

```bash
dd if=/sdcard/recovery.img of=/dev/block/by-name/recovery
```

**Method 2: recovery.tar**
The tar file consists of the recovery.img and patched vbmeta.img(s) from the A217MUBS9CVD3 firmware

- Simply flash via Odin

### Alternative
- You can extract the tar file to get the blank vbmeta.img(s) and flash them on your device similar to Method 1
