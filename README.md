# My Hackintosh

This repository is the EFI directory (basically a boot drive) that can boot a Sierra (10.11.1) installation. This EFI will only work with my specific setup, but may work with similar ones via tweaking.

## Installation

### My Hackintosh Hardware



### Sierra Setup
0. Attach your Hackintosh hard drive to a real Mac.
1. Use Disk Utility to erase and create a GPT drive with an HFS+ partition.
2. On the Mac, download Sierra.
3. Using that Mac, change install target, and install Sierra to the attached Hackintosh hard drive.
4. Put this hard drive into your Hackintosh. 

### Boot USB Setup

This EFI directory lives on an ESP (EFI System Partition). This partition is typically hidden from operating systems. On the real Mac, again:

0. Download Clover bootloader (I am using r3949 at time of writing): https://sourceforge.net/projects/cloverefiboot/files/Installer/
1. Use Disk Utility to erase and create a GPT drive with an HFS+ partition. The ESP parititon will be automatically created and hidden.
2. Install Clover to the USB stick using these options:
  a. Change Install Location to the USB Stick (DO NOT FORGET THIS!!!!)
  b. Customize, with only the following checked:
   i. Install for UEFI booting only
   ii. Install Clover in the ESP.
3. After installation of Clover is complete, the installer will leave the ESP mounted.
4. In that ESP, there will be an EFI directory. So typically, the directory structure will be as follows _/Volumes/ESP/EFI_.
5. In a command prompt:
```sh
cd /Volumes/ESP/
# wipe this out to overwrite with this EFI
rm -rf EFI
# check out this EFI
git clone https://github.com/koush/EFI-X99.git EFI
```

