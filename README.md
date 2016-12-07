# My Hackintosh

This repository is the EFI directory (basically, a boot drive) that can boot a macOS (10.12.1, at time of writing) installation. Think of the EFI as the isolated magic boot image that will let you start macOS on unofficial hardware. Ideally, all your system compatibility changes are in this boot partition, away from macOS itself. You don't want a macOS update accidentally breaking your system.
This EFI will only work with my specific setup, but may work with similar ones via tweaking.

![macpro6_1_-_geekbench_browser](https://cloud.githubusercontent.com/assets/73924/20958327/f1370bc8-bc09-11e6-823b-833d1da15cbd.png)

## Why Github?

This is the easiest way to make and track changes to improve support and manage OS updates (as needed). Not having your EFI in revision control is bad. Eventually you will end up breaking something and not remember what you did.
Additionally, someone using this repository can stay up to date with my changes by simply pulling down the latest files through Github on their boot partition.

## Installation

### My Hackintosh Hardware

Total Cost: ~$3500 ($500 more if using a PCIe flash drive). A maxed out Mac Pro, for reference, is around ~$10,000, and is dated in comparison.

You need to have mostly the same hardware for this to work. Parts that can not be swapped easily will be noted.

* [Cooler Master HAF XB II EVO, HTPC Computer Case](http://amzn.to/2h4oiqI)
* [Corsair RMx Series, RM750x, 750W, Fully Modular Power Supply](http://amzn.to/2g8zbe4)
* [Gigabyte X99P-SLI Motherboard](http://amzn.to/2g8vxAR) <sup>[1]</sup>
* [2 x Corsair Vengeance LPX 32GB DDR4 3200](http://amzn.to/2h4l729)
* [Intel Core i7-6950X Processor](http://amzn.to/2gBbozC) <sup>[2]</sup>
* [MasterAir Pro 3 CPU Air Cooler](http://amzn.to/2h4pL0k)
* [Gigabyte GeForce GTX 980Ti](http://amzn.to/2h1rDXd) <sup>[3]</sup>
* [BCM94360CD Wireless and Bluetooth Card](http://amzn.to/2g8AQ3m) <sup>[4]</sup>
* [Samsung 850 EVO 1TB SSD](http://amzn.to/2h2yJuG) <sup>[5]</sup>

#### Notes
1. This motherboard is a little wonky, so while other Gigabyte or Asus X99 motherboards may work, my EFI repository may not work with it. Change at your own risk.
2. If you get a different CPU, you MUST modify [this line](https://github.com/koush/EFI-X99/blob/master/CLOVER/kexts/Other/VoodooTSCSync.kext/Contents/Info.plist#L54) in your checkout with the correct IOCPUNumber value. Each CPU core has two hyper threading cores. Subtract 1 to get the max IOCPUNumber (zero indexed). _IOCPUNumber = (Number of CPU Cores * 2) - 1_. For example, the 6950X has 10 cores. So (10*2)-1=19, as shown in the link.
3. Do not get any Pascal (1070, 1080, or Titan X) hardware. It is not supported on Mac yet. I recommend sticking with 970/980 NVidia hardware. You must install [NVidia Web Drivers](http://www.insanelymac.com/forum/topic/306535-nvidia-web-driver-updates-for-el-capitan-update-10242016/) after booting. That will get your graphics card drivers installed, and you won't be stuck in VESA graphics mode.
4. Any USB wifi will work. I chose this card because this is the the best/easiest way to get AirDrop working. Totally optional though. You don't have to get any wifi at all.
5. Any SSD or HDD drive works. Not sure about the new M.2 drives yet though.

[Full List of Hardware](http://a.co/7V7E9QI)

### macOS Preparation
0. Attach your Hackintosh OS drive to a real Mac. Use a [USB enclosure](http://amzn.to/2h4wuY0) to do this.
1. Use Disk Utility to erase and create a GPT drive with a single HFS+ partition.
2. On the Mac, download the latest macOS (Sierra, 10.12.1 at time of writing).
3. Using that Mac, change install target, and install macOS to the attached Hackintosh hard drive.
4. Insert a USB drive into your real Mac. This will be used to update your BIOS.
  * Use Disk Utility to erase the drive and create a GPT drive with a single Fat32 partition. Fat32 is mandatory for the BIOS update process.
  * [Download the latest BIOS](http://www.gigabyte.com/products/product-page.aspx?pid=5658#bios) to the latest (F23, at time of writing) using the Fat32 partitioned USB boot stick that was previously set up.
  * [Copy the BIOS file to the Fat32 partition and name it GIGABYTE.bin](https://www.gigabytenordic.com/update-bios-using-q-flash-plus-x99-motherboards/).

### Making your Drive Bootable

Obviously, you want to make your macOS drive bootable. However, sometimes when tweaking things, the OS drive will fail to boot. It is *extremely* recommended to have a backup bootable USB stick (which you already formatted above). Make tweaks to the EFI boot on your macOS drive, and if it fails to boot, fall back to the USB stick to boot. The USB boot stick is optional, but encouraged.

This EFI directory lives on an ESP (EFI System Partition). This partition is typically hidden from operating systems.

First, get the prerequisite [Clover Bootloader](https://sourceforge.net/projects/cloverefiboot/files/Installer/) (I am using r3949 at time of writing).

On the real Mac, again. You will be performing the following steps (optionally twice, if creating a USB boot stick as well):

1. Install Clover to the target drive (Hackintosh hard drive or USB Stick) using these options:
  * Change Install Location to the target drive (DO NOT FORGET THIS!!!!)
  * Customize, with only the following checked:
    * Install for UEFI booting only
    * Install Clover in the ESP.
    * Don't delete the Clover PKG file when the installation ends, you may need it later.
2. After installation of Clover is complete, the installer leaves the ESP mounted.
3. In that ESP, there will be an EFI directory. So typically, the directory structure will be as follows _/Volumes/ESP/EFI_.
4. In Terminal:
```sh
cd /Volumes/ESP/
# wipe this out to overwrite with this EFI
rm -rf EFI
# check out this EFI
git clone https://github.com/koush/EFI-X99.git EFI
# If you chose a different processor, modify the aforementioned file in VoodooTSCSync.kext.
# Exit the Terminal and unmount ESP! 
```

_Optional: Repeat the above steps with the USB stick._

### Hackintosh Setup

1. Assemble your computer.
2. The OS drive should already be set up with macOS from a real Mac. Connect it to your Hackintosh if you haven't already.
3. Boot into the BIOS. [Update the BIOS](https://www.gigabytenordic.com/update-bios-using-q-flash-plus-x99-motherboards/) using the USB stick which contains the update from the previous steps.
  * You may want to shut down and reset your CMOS by connecting the CMOS reset pins.
4. Restart and get into the BIOS again. Load Optimized Defaults.
5. You'll see 2 or 3 options show up in the Clover bootloader.
 * Boot Clover
 * Boot macOS
 * Boot Recovery
6. Choose Boot macOS
7. You should be fully booted in with ancient VESA graphics (low resolution and framerate). We'll fix this in a sec.
8. Remember those busted graphics? Just need to install the drivers now. [Get the appopriate download for your version of macOS](http://www.insanelymac.com/forum/topic/306535-nvidia-web-driver-updates-for-el-capitan-update-10242016/) and install it.
 * Hold off on restarting. Read on below in the Graphics section.

### Graphics
I'm not particularly happy with this part, as it requires modifying a system file every time there is an update.

1. Download and run [AGDPfix](http://www.insanelymac.com/forum/files/file/424-agdpfix/).
2. Restart.

AGDPfix prevents macOS from erroneously putting your video card to sleep on boot. This app needs to be run after every update (when the file gets clobbered), to fix the computer starting in VESA mode. There's better, long term way, to fix this, but I haven't managed to get it working.

[Here's the change](https://github.com/koush/EFI-X99/blob/master/AppleGraphicsControl.kext.diff) it makes in case one is curious, or wants to apply it manually (and use KextUtility to rebuild the kext cache). Just use the app though. You'll screw this up.

Done!

### XMP
Wanna pimp your ride? Enable [XMP](http://www.intel.com/content/www/us/en/gaming/extreme-memory-profile-xmp.html) Profile 1 in the BIOS. It's overclocking your RAM, so it may make your system unstable. That's why I didn't have it enabled out the gate.

### Staying Up To Date
I'll be making improvements and fixes as needed. To stay up to date, use [EFI Mounter](http://www.insanelymac.com/forum/files/file/528-efi-mounter/) to mount your EFI partition (or do it manually with mounnt_msdos if you know the partition, typically /dev/disk0s1).

```sh
cd /Volumes/EFI/EFI
git pull
# Done!
```

### Credits
[nmano's Guide](https://www.tonymacx86.com/threads/mac-osx-10-12-with-x99-broadwell-e-family-and-haswell-e-family.197513/)
