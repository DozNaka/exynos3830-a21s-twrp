# android_device_samsung_a21s-twrp
Device source tree for Galaxy A21S (TWRP ONLY)

WORKING: Backup, Restore, Flash Zip, MTP, Screen Brightness, ADB, File Manager, Terminal

NOT Working: Device encryption (When used without decrypting device via FSTAB edit, all the files in /userdata appear broken), Flashing some super.img files (When flashing, the super partition breaks), Magisk flashing (The Zip file installs successfully, but the device goes into bootloop upon reboot. Seems to be a problem with stock rom though.), ADB Sideload and FastbootD is broken, Vibration works but it causes the touch to have a high delay so it has been disabled.

In order to disable device encryption, after flashing the recovery, open up 'fstab.exynos850' on your device's boot.img, system_root partition(/fstab.exynos850), and vendor partition(/vendor/etc/fstab.exynos850), remove all terms that state 'avb', 'fileencryption=ice', 'errors=panic', and replace/re-flash them onto the device. Please note that disabling encryption will make your device more vulnerable, and you must perform a complete wipe of your device's userdata partition after doing so.

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