---
title: Installation
layout: default
---
* auto-gen TOC:
{:toc}

# Installation

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
wget https://github.com/aguslr/multibootusb/tarball/master -O - | tar -xzv --strip-components 1 --exclude={README.md}
```


## Creating the USB drive

### Manually prepare the drive

#### Creating a bootable USB drive

Follow the instructions to create a [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios] from the ArchWiki.


#### Copying the files to the USB drive

1. Mount the data partition:

    ```sh
    mount --target <mountpoint> <partition>
    ```

    Where `<mountpoint>` is any directory you want the partition to be mounted at, and `<partition>` is the name of the data partition (e.g. */dev/sdh3*). Run `dmesg` to get this information.

2. Create a directory named *boot* to store GRUB's configuration files, a directory named *bin* for binary files and another named *isos* for the kernel/ISO files:

    ```sh
    mkdir -p <mountpoint>/boot/{grub/grub.d/,bin,isos}
    ```

3. Copy the necessary GRUB files:

    ```sh
    cd multibootusb && cp -rf {grub.cfg,grub.d,multiboot.*} <mountpoint>/boot/grub/
    ```

4. Download [memdisk][] from [kernel.org][]:

    ```sh
    wget -qO - 'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' | tar -xz -C <mountpoint>/boot/grub/ --no-same-owner --strip-components 3 'syslinux-6.03/bios/memdisk/memdisk'
    ```

5. Download [Memtest86+][]:

    ```sh
    wget -qO - 'http://www.memtest.org/download/5.01/memtest86+-5.01.bin.gz' | gunzip -c > <mountpoint>/boot/bin/memtest86+.bin
    ```


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
  -b,  --hybrid                 Create a hybrid MBR
  -e,  --efi                    Enable EFI compatibility
  -i,  --interactive            Launch gdisk to create a hybrid MBR
  -l,  --log                    Save debug information to log
  -h,  --help                   Display this message
```


## Get bootable files

Currently, the following bootable files are supported (save to `<mountpoint>/boot/isos`):

* **[Antergos][]**: a modern, elegant, and powerful operating system based on one of the best Linux distributions available, Arch Linux.

* **[Arch-Anywhere][]**: an automated install script giving you the ability to install a fully custom Arch Linux system in minutes.

* **[Arch Linux][arch]**: a lightweight and flexible Linux® distribution that tries to Keep It Simple.

* **[AVG Rescue CD][avgrescue]**: a tool to repair system crashes and return your systems to operating at full capacity.

* **[BackBox][]**: an Ubuntu-based distribution developed to perform penetration tests and security assessments.

* **[boot.rackspace.com][]**: a collection of iPXE scripts that allow you to rapidly network boot Operating Systems, Utilities and other tools very easily.

* **[Boot-repair-disk][brd]**: the 'must-have' rescue CD.

* **[Byzantium][]**: a live Linux distribution that delivers easy-to-use, secure, and robust mesh networking capabilities.

* **[CentOS][]**: a community-driven free software effort focused on delivering a robust open source ecosystem.

* **[Clonezilla Live][clonezilla]**: a small bootable GNU/Linux distribution for x86/amd64 (x86-64) based computers.

* **[DBAN][]**: a free erasure software designed for the personal user.

* **[Debian][]**: a free operating system (OS) for your computer.

* **[elementary OS][elementary]**: a fast and open replacement for Windows and OS X.

* **[Fedora][]**: a polished, easy to use operating system.

* **[Gentoo Linux][gentoo]**: a flexible, source-based Linux distribution that becomes just about any system you need—and much more.

* **[GParted Live][gparted]**: a small bootable GNU/Linux distribution for x86 based computers.

* **[Grml Live Linux][grml]**: a bootable live system based on Debian that includes a collection of GNU/Linux software especially for system administrators.

* **[Hiren's BootCD][hirens]**: a first aid kit for your computer.

* **[Kali Linux][kali]**: a Debian-derived Linux distribution designed for digital forensics and penetration testing.

* **[KDE neon][kdeneon]**: the latest and greatest of KDE community software packaged on a rock-solid base.

* **[Linux Mint][mint]**: an Ubuntu-based distribution whose goal is to provide a more complete out-of-the-box experience by including browser plugins, media codecs, support for DVD playback, Java and other components.

* **[Manjaro Linux][manjaro]**: a user-friendly Linux distribution based on the independently developed Arch operating system.

* **[netboot.xyz][]**: a way to select various operating system installers or utilities from one place within the BIOS without the need of having to go retrieve the media to run the tool.

* **[OpenBSD][]**: a FREE, multi-platform 4.4BSD-based UNIX-like operating system.

* **[openSUSE][]**: a Linux-based project and distribution sponsored by SUSE Linux GmbH and other companies.

* **[Parabola GNU/Linux-libre][parabola]**: a community driven effort to provide a fully Free (as in freedom) operating system that is simple and lightweight.

* **[Parted Magic][partedmagic]**: a complete hard disk management solution.

* **[Raspberry PIXEL][raspixel]**: the Raspberry Pi OS for PC and Mac.

* **[Sabayon Linux][sabayon]**: a beginner-friendly Gentoo-based Open Source Linux distribution.

* **[Slax Linux][slax]**: a modern, portable, small and fast Linux operating system with a modular approach and outstanding design.

* **[SliTaz][]**: a secure and high performance operating system using the Linux Kernel and GNU software.

* **[SystemRescueCd][sysrescuecd]**: a Linux system rescue disk for administrating or repairing your system and data after a crash.

* **[Tails][]**: a live operating system, that aims at preserving your privacy and anonymity.

* **[Trisquel GNU/Linux][trisquel]**: a fully free operating system for home users, small enterprises and educational centers.

* **[Tiny Core Linux][tinycore]**: a highly modular based system with community build extensions.

* **[Ubuntu][]**: an open source software platform that runs from the cloud, to the smartphone, to all your things.

* **[Ultimate Boot CD][ubcd]**: a boot CD with several diagnotic tools.

* **[Void][]**: a general purpose operating system, based on the monolithic Linux® kernel.


## Testing USB drive with QEMU

To test the newly created USB drive in a virtual environment with [QEMU][], run:

```sh
qemu-system-x86_64 -enable-kvm -localtime -m 2G -vga std -drive file=<device>,cache=none,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


[antergos]: https://antergos.com/
[arch-anywhere]: https://arch-anywhere.org/
[arch]: https://www.archlinux.org/
[avgrescue]: http://www.avg.com/ww-en/rescue-cd-business-edition
[backbox]: https://backbox.org/
[boot.rackspace.com]: http://boot.rackspace.com/
[brd]: https://sourceforge.net/p/boot-repair-cd/home/Home/
[byzantium]: http://project-byzantium.org/
[centos]: http://www.centos.org/
[clonezilla]: http://clonezilla.org/clonezilla-live.php
[dban]: http://www.dban.org/
[debian]: https://www.debian.org/
[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
[elementary]: https://elementary.io/
[fedora]: https://getfedora.org/
[gentoo]: https://www.gentoo.org/
[gparted]: http://gparted.sourceforge.net/livecd.php
[grml]: https://grml.org/
[hirens]: http://www.hirensbootcd.org/
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[kali]: https://www.kali.org/
[kdeneon]: https://neon.kde.org/
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[manjaro]: https://manjaro.org/
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[memtest86+]: http://www.memtest.org/
[mint]: https://linuxmint.com/
[netboot.xyz]: https://netboot.xyz/
[openbsd]: http://www.openbsd.org/
[opensuse]: https://www.opensuse.org/
[parabola]: https://www.parabola.nu/
[partedmagic]: http://partedmagic.com/
[qemu]: http://qemu.org/
[raspixel]: https://www.raspberrypi.org/blog/pixel-pc-mac/
[sabayon]: https://www.sabayon.org/
[slax]: http://www.slax.org/
[slitaz]: http://www.slitaz.org/
[sysrescuecd]: http://www.sysresccd.org/
[tails]: https://tails.boum.org/
[tinycore]: http://tinycorelinux.net/
[trisquel]: https://trisquel.info/
[ubcd]: http://www.ultimatebootcd.com/
[ubuntu]: http://www.ubuntu.com/
[void]: http://www.voidlinux.eu/
