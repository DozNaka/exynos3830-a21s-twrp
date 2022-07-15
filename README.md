# TWRP (AOSP 12.1) for A21s

This source is WIP but so far it works good enough for everyday use

## Bugs 
Everything works except for the following:

- ADB Sideload
- Decryption*
- FastbootD
- Haptics*

Vibrator (Haptics) works but I have disabled it for the time being  because it causes a nasty touch delay, will enable it back once I solve the issue.

Decryption does not work on this device and if your device is encrypted then TWRP will be unable to view your files. To Decrypt your device, enter the terminal in TWRP and run the `multidisabler` command 

## Features
- DTB: Imported Stock DTB from A217MUBU9DVF6
- DTBO: Imported A217MUBU9DVF6 stock recovery DTBO
- Implemented Multidisabler command
- Recovery Kernel: Stock kernel from A217MUBU9DVF6


## Building

Make tw directory and go into it

```bash
mkdir tw; cd tw
```

Clone A21s device tree to device/samsung/a21s

```bash
git clone https://github.com/DozNaka/exynos3830-a21s-twrp.git device/samsung/a21s
```

Init TWRP AOSP 12.1 manifest repo

```bash
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
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

**To root your device with the patch AP method you do the following:**
- Install [Bitfrost](https://github.com/zacharee/SamloaderKotlin/releases/latest) apk
- Download stock firmware using bitfrost app
- Extract AP from firmware
- Install [Magisk](https://github.com/topjohnwu/Magisk/releases/latest)
- Open Magisk, press Install and then **Select and Patch a File**
- Select the AP file you have extracted from stock firmware
- Once finished patching, you will find the patched AP file in Downloads
- Move the patched AP file to your computer
- Flash the patched AP file with Odin

Once you have done this you can proceed with the methods below

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
- Place the tar file in AP on Odin then flash