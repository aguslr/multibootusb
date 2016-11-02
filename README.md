# Multiboot USB

## About

This repository stores the files needed to create a pendrive capable of booting different ISO files using GRUB2.

## Getting the files

### Using Git

If we have Git installed on the system, we can get the files directly from the repository:

```sh
git clone git://github.com/aguslr/multibootusb.git
```

After this, every time we want to update the files we do:

```sh
cd multibootusb && git pull
```

### Without Git

If Git is not installed, we can still get the files as long as we have a basic Unix environment available:

```sh
wget https://github.com/aguslr/multibootusb/tarball/master -O - | tar -xzv --strip-components 1 --exclude={README.md,demo.gif}
```


## Creating the USB drive

### Using the script

Simply run as root:

```sh
./makeUSB.sh <device>
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.

**WARNING**: This will delete all data in the device, so make sure you pick the right one.

These are the options for the script:

```
Script to prepare multiboot USB drive
Usage: makeUSB.sh [options] device [fs-type]

 device                         Device to modify (e.g. /dev/sdb)
 fs-type                        Filesystem type for the data partition [ext3|ext4|vfat|ntfs]
  -e,  --efi                    Enable EFI compatibility
  -i,  --interactive            Launch gdisk to create a hybrid MBR
  -l,  --log                    Save debug information to log
  -h,  --help                   Display this message
```


### Manually prepare the drive

#### Creating a bootable USB drive

Follow the instructions to create a [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios] from the ArchWiki.


#### Copying the files to the USB drive:

1. Mount the data partition:

    ```sh
    mount --target <mountpoint> <partition>
    ```

    Where `<mountpoint>` is any directory you want the partition to be mounted at, and `<partition>` is the name of the data partition (e.g. */dev/sdh3*). Run `dmesg` to get this information.

2. Create a directory named *boot* to store GRUB's configuration files, a directory named *krnl* for the kernel files and another named *isos* for the ISO files:

    ```sh
    mkdir -p <mountpoint>/boot/{grub/grub.d/,bin,krnl,isos}
    ```

3. Copy the necessary GRUB files:

    ```sh
    cd multibootusb && cp -rf {grub.cfg,grub.d,multiboot.*} <mountpoint>/boot/grub/
    ```

4. Download and copy the ISO files into the USB drive:

    ```sh
    wget "http://cdimage.kali.org/kali-1.1.0/kali-linux-1.1.0-i386.iso" -P <mountpoint>/boot/isos/
    ```

5. Reboot and select the USB drive to access the menu.


## Boot any ISO with [MEMDISK][]

[Using Syslinux's MEMDISK][usingmemdisk], an ISO file can be loaded directly into memory (as long as the system has enough) which will allow for booting some unsupported ISO's.

To get MEMDISK's binary, you can install [syslinux][] using your system's package manager, and find it at `/usr/lib/syslinux/memdisk` or `/usr/lib/syslinux/bios/memdisk`, depending on your distribution.

Alternatively, you can download the official tarball from [kernel.org][], in which case, you will find the binary at `/bios/memdisk/memdisk`.

Once you have the file, simply copy it to your data partition:

```sh
cp -f memdisk <mountpoint>/boot/grub/
```


## Testing USB drive with [QEMU][]

To test the newly created USB drive in a virtual environment, run:

```sh
qemu-system-x86_64 -enable-kvm -localtime -m 2G -vga std -drive file=<device>,cache=none,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


## Get bootable files

You can download ISO files from these websites (save to `<mountpoint>/boot/isos`):

* **[Antergos][]**: a modern, elegant, and powerful operating system based on one of the best Linux distributions available, Arch Linux.

* **[Arch Linux][arch]**: a lightweight and flexible Linux® distribution that tries to Keep It Simple.

* **[AVG Rescue CD][avgrescue]**: a tool to repair system crashes and return your systems to operating at full capacity.

* **[BackBox][]**: an Ubuntu-based distribution developed to perform penetration tests and security assessments.

* **[CentOS][]**: a community-driven free software effort focused on delivering a robust open source ecosystem.

* **[Clonezilla Live][clonezilla]**: a small bootable GNU/Linux distribution for x86/amd64 (x86-64) based computers.

* **[Debian][]**: a free operating system (OS) for your computer.

* **[elementary OS][elementary]**: a fast and open replacement for Windows and OS X.

* **[Fedora][]**: a polished, easy to use operating system.

* **[Gentoo Linux][gentoo]**: a flexible, source-based Linux distribution that becomes just about any system you need—and much more.

* **[GParted Live][gparted]**: a small bootable GNU/Linux distribution for x86 based computers.

* **[Grml Live Linux][grml]**: a bootable live system based on Debian that includes a collection of GNU/Linux software especially for system administrators.

* **[Hiren's BootCD][hirens]**: a first aid kit for your computer.

* **[Kali Linux][kali]**: a Debian-derived Linux distribution designed for digital forensics and penetration testing.

* **[Linux Mint][mint]**: an Ubuntu-based distribution whose goal is to provide a more complete out-of-the-box experience by including browser plugins, media codecs, support for DVD playback, Java and other components.

* **[Manjaro Linux][manjaro]**: a user-friendly Linux distribution based on the independently developed Arch operating system.

* **[openSUSE][]**: a Linux-based project and distribution sponsored by SUSE Linux GmbH and other companies.

* **[Parabola GNU/Linux-libre][parabola]**: a community driven effort to provide a fully Free (as in freedom) operating system that is simple and lightweight.

* **[Parted Magic][partedmagic]**: a complete hard disk management solution.

* **[Slax Linux][slax]**: a modern, portable, small and fast Linux operating system with a modular approach and outstanding design.

* **[SliTaz][]**: a secure and high performance operating system using the Linux Kernel and GNU software.

* **[SystemRescueCd][sysrescuecd]**: a Linux system rescue disk for administrating or repairing your system and data after a crash.

* **[Tails][]**: a live operating system, that aims at preserving your privacy and anonymity.

* **[Trisquel GNU/Linux][trisquel]**: a fully free operating system for home users, small enterprises and educational centers.

* **[Ubuntu][]**: an open source software platform that runs from the cloud, to the smartphone, to all your things.

* **[Void][]**: a general purpose operating system, based on the monolithic Linux® kernel.

You can get iPXE kernels from these websites (save to `<mountpoint>/boot/krnl`):

* **[boot.rackspace.com][]**: a collection of iPXE scripts that allow you to rapidly network boot Operating Systems, Utilities and other tools very easily.

* **[netboot.xyz][]**: a way to select various operating system installers or utilities from one place within the BIOS without the need of having to go retrieve the media to run the tool.


## Demo

![Demo GIF](demo.gif "Demo")

## References

- [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios]
- [Using Syslinux and memdisk][usingmemdisk]
- [Thermionix/multipass-usb][multipass-usb]
- [Transform a USB stick into a boot device packing multiple Linux distros][multiboot-usb]
- [MultiBoot USB with Grub2 (boot directly from iso files)][multibootusb]
- [Grub2 Loop Boot Solution][loop-boot]
- [Multiboot USB-Stick: grml 2014.11 einrichten][grml-usb-stick]
- [Man page of SGDISK][sgdisk]
- [Hybrid MBRs][hybridmbr]

[antergos]: https://antergos.com/
[arch]: https://www.archlinux.org/
[avgrescue]: http://www.avg.com/ww-en/rescue-cd-business-edition
[backbox]: https://backbox.org/
[centos]: http://www.centos.org/
[clonezilla]: http://clonezilla.org/clonezilla-live.php
[debian]: https://www.debian.org/
[elementary]: https://elementary.io/
[fedora]: https://getfedora.org/
[gentoo]: https://www.gentoo.org/
[gparted]: http://gparted.sourceforge.net/livecd.php
[grml]: https://grml.org/
[hirens]: http://www.hirensbootcd.org/
[kali]: https://www.kali.org/
[manjaro]: https://manjaro.org/
[mint]: https://linuxmint.com/
[opensuse]: https://www.opensuse.org/
[parabola]: https://www.parabola.nu/
[partedmagic]: http://partedmagic.com/
[slax]: http://www.slax.org/
[slitaz]: http://www.slitaz.org/
[sysrescuecd]: http://www.sysresccd.org/
[tails]: https://tails.boum.org/
[trisquel]: https://trisquel.info/
[ubuntu]: http://www.ubuntu.com/
[void]: http://www.voidlinux.eu/
[boot.rackspace.com]: http://boot.rackspace.com/
[netboot.xyz]: https://netboot.xyz/
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[syslinux]: http://www.syslinux.org/
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[qemu]: http://qemu.org/
[usingmemdisk]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Using_Syslinux_and_memdisk
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[multiboot-usb]: http://www.circuidipity.com/multi-boot-usb.html
[multibootusb]: http://www.panticz.de/MultiBootUSB
[loop-boot]: http://forums.kali.org/showthread.php?1025-Grub2-Loop-Boot-Solution
[grml-usb-stick]: http://www.gtkdb.de/index_7_2627.html
[sgdisk]: http://www.rodsbooks.com/gdisk/sgdisk.html
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
