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

```
git clone git://github.com/aguslr/multibootusb.git
```

After this, every time we want to update the files we do:

```
cd multibootusb && git pull
```

### Without Git

If Git is not installed, we can still get the files as long as we have a basic Unix environment available:

```
wget https://github.com/aguslr/multibootusb/tarball/master -O - | tar -xzv --strip-components 1 --exclude={README.md,docs}
```


## Creating the USB drive

### Manually prepare the drive

#### Creating a bootable USB drive

Follow the instructions to create a [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios] from the ArchWiki.


#### Copying the files to the USB drive

1. Set variables to avoid errors:

        export mntusb=<mountpoint> partusb=<partition>

    Where `<mountpoint>` is any directory you want the partition to be mounted at (e.g. */media/usb*), and `<partition>` is the name of the data partition (e.g. */dev/sdh3*). Run `dmesg` to get this information.

2. Mount the data partition:

        mount --target $mntusb $partusb

3. Create a directory named *boot* to store GRUB's configuration files, a directory named *bin* for binary files and another named *isos* for the kernel/ISO files:

        mkdir -p $mntusb/boot/{grub/grub.d/,bin,isos}

4. Copy the necessary GRUB files:

        cd multibootusb && cp -rf {grub.cfg,grub.d,multiboot.*} $mntusb/boot/grub/

5. Download [MEMDISK][] from [kernel.org][]:

        wget -qO - 'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' | tar -xz -C $mntusb/boot/grub/ --no-same-owner --strip-components 3 'syslinux-6.03/bios/memdisk/memdisk'

6. Download [Memtest86+][]:

        wget -qO - 'http://www.memtest.org/download/5.01/memtest86+-5.01.bin.gz' | gunzip -c > $mntusb/boot/bin/memtest86+.bin


### Using the script

Simply run as root:

```
./makeUSB.sh <device>
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.

**WARNING**: This will delete all data in the device, so make sure you pick the right one.

These are the options for the script:

```null
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

<svg xmlns="http://www.w3.org/2000/svg"  style="display: none;">
  <symbol id="cfg-icon">
    <path d="M10 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-8l-2-2z"/>
  </symbol>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="dl-icon">
    <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>
  </symbol>
</svg>

Once the USB drive is created, it only remains to copy the bootable files (ISO or kernel) to the pendrive. Currently, the following utilities are supported (save to `$mntusb/boot/isos`):

Distribution | Links | Notes
-------------|-------|------
[Antergos][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][antergos-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][antergos-dl] | only Live ISO
[Arch-Anywhere][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][arch-anywhere-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][arch-anywhere-dl] | only Dual ISO
[Arch Linux][arch] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][arch-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][arch-dl] | only Dual ISO
[AVG Rescue CD][avgrescue] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][avgrescue-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][avgrescue-dl] | with [MEMDISK][]
[BackBox][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][backbox-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][backbox-dl] | with [loopback.cfg][]
[BlackArch Linux][blackarch] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][blackarch-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][blackarch-dl] |
[boot.rackspace.com][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][boot.rackspace.com-cfg] | with [MEMDISK][]
[Boot-repair-disk][brd] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][brd-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][brd-dl] | with [loopback.cfg][]
[Byzantium][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][byzantium-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][byzantium-dl] |
[CentOS][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][centos-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][centos-dl] | only Live ISO
[Clonezilla Live][clonezilla] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][clonezilla-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][clonezilla-dl] |
[DBAN][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][dban-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][dban-dl] | with [MEMDISK][]
[Debian][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][debian-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][debian-dl] | only Live and Netboot[^note1] ISOs
[elementary OS][elementary] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][elementary-cfg] | with [loopback.cfg][]
[Fedora][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][fedora-cfg] | only Workstation and Server ISOs
[Gentoo Linux][gentoo] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][gentoo-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][gentoo-dl] | only LiveDVD ISO
[GParted Live][gparted] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][gparted-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][gparted-dl] |
[Grml Live Linux][grml] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][grml-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][grml-dl] | with [loopback.cfg][]
[Hiren's BootCD][hirens] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][hirens-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][hirens-dl] | with [MEMDISK][][^note2]
[Kali Linux][kali] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][kali-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][kali-dl] | with [loopback.cfg][]
[KDE neon][kdeneon] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][kdeneon-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][kdeneon-dl] | with [loopback.cfg][]
[Linux Mint][mint] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][mint-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][mint-dl] | with [loopback.cfg][]
[Manjaro Linux][manjaro] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][manjaro-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][manjaro-dl] | with [MEMDISK][]
[netboot.xyz][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][netboot.xyz-cfg] | with [MEMDISK][]
[OpenBSD][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][openbsd-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][openbsd-dl] | only Install ISO[^note3]; with [MEMDISK][]
[openSUSE][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][opensuse-cfg] | only Tumbleweed ISO
[Parabola GNU/Linux-libre][parabola] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][parabola-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][parabola-dl] | only Dual ISO
[Parted Magic][partedmagic] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][partedmagic-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][partedmagic-dl] |
[Pentoo][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][pentoo-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][pentoo-dl] |
[Raspberry PIXEL][raspixel] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][raspixel-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][raspixel-dl] | with [loopback.cfg][]
[Sabayon Linux][sabayon] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][sabayon-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][sabayon-dl] | only Desktop ISO
[Seagate SeaTools][seatools] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][seatools-cfg] | with [MEMDISK][]
[Slax Linux][slax] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][slax-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][slax-dl] |
[SliTaz][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][slitaz-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][slitaz-dl] | with [MEMDISK][]
[SystemRescueCd][sysrescuecd] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][sysrescuecd-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][sysrescuecd-dl] |
[Tails][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][tails-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][tails-dl] |
[Tiny Core Linux][tinycore] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][tinycore-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][tinycore-dl] |
[Trisquel GNU/Linux][trisquel] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][trisquel-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][trisquel-dl] | only Live CD and DVD ISOs
[Ubuntu][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][ubuntu-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][ubuntu-dl] | only Desktop and Netboot[^note4] ISOs
[Ultimate Boot CD][ubcd] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][ubcd-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][ubcd-dl] | with [MEMDISK][]
[Void][] | [<svg class="icon"><use xlink:href="#cfg-icon"/></svg>][void-cfg] [<svg class="icon"><use xlink:href="#dl-icon"/></svg>][void-dl] | only Live ISO


## Testing USB drive with QEMU

To test the newly created USB drive in a virtual environment with [QEMU][], run:

```
qemu-system-x86_64 -enable-kvm -localtime -m 2G -vga std -drive file=<device>,cache=none,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


## Resources

- [Grub2 Loop Boot Solution][loop-boot]
- [Grub2 loopback ISO support - Ultimate Boot CD][ubcdiso]
- [Hybrid MBRs][hybridmbr]
- [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios]
- [Man page of SGDISK][sgdisk]
- [MultiBoot USB with Grub2 (boot directly from iso files)][panticz-mbusb]
- [Multiboot USB-Stick: grml 2014.11 einrichten][grml-usb-stick]
- [Super Grub Disk Wiki - Loopback.cfg][loopback.cfg]
- [Transform a USB stick into a boot device packing multiple Linux distros][multiboot-usb]
- [Using Syslinux and memdisk][usingmemdisk]


## Notes

[^note1]: Rename [Debian][] Netboot ISO files (e.g. from `mini.iso` to `debian-8.6.0-i386-mini.iso`).
[^note2]: Rename [Hiren's BootCD][hirens] ISO files to remove the apostrophe which causes problems with [globbing][] (e.g. `Hirens.BootCD.15.2.iso`).
[^note3]: Rename [OpenBSD][] install ISO files (e.g. from `install60.iso` to `openbsd-install60-i386.iso`).
[^note4]: Rename [Ubuntu][] Netboot ISO files (e.g. from `mini.iso` to `ubuntu-16.04.1-mini-i386.iso`).

[antergos-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/antergos.d "Configuration"
[antergos-dl]: https://www.antergos.com/try-it/ "Download"
[antergos]: https://antergos.com/
[arch-anywhere-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/arch-anywhere.d "Configuration"
[arch-anywhere-dl]: https://arch-anywhere.org/download/ "Download"
[arch-anywhere]: https://arch-anywhere.org/
[arch-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/arch.d "Configuration"
[arch-dl]: http://www.archlinux.org/download/ "Download"
[arch]: https://www.archlinux.org/
[avgrescue-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/avg.d "Configuration"
[avgrescue-dl]: http://www.avg.com/download.prd-arl "Download"
[avgrescue]: http://www.avg.com/rescue-cd-business-edition
[backbox-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/backbox.d "Configuration"
[backbox-dl]: http://www.backbox.org/downloads "Download"
[backbox]: https://backbox.org/
[blackarch-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/blackarch.d "Configuration"
[blackarch-dl]: https://blackarch.org/downloads.html "Download"
[blackarch]: https://blackarch.org/
[boot.rackspace.com-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/boot.rackspace.com.d "Configuration"
[boot.rackspace.com]: http://boot.rackspace.com/
[brd-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/boot-repair-disk.d "Configuration"
[brd-dl]: https://sourceforge.net/projects/boot-repair-cd/files/ "Download"
[brd]: https://sourceforge.net/p/boot-repair-cd/home/Home/
[byzantium-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/byzantium.d "Configuration"
[byzantium-dl]: http://project-byzantium.org/download/ "Download"
[byzantium]: http://project-byzantium.org/
[centos-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/centos.d "Configuration"
[centos-dl]: https://www.centos.org/download/ "Download"
[centos]: http://www.centos.org/
[clonezilla-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/clonezilla.d "Configuration"
[clonezilla-dl]: http://clonezilla.org/downloads.php "Download"
[clonezilla]: http://clonezilla.org/clonezilla-live.php
[dban-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/dban.d "Configuration"
[dban-dl]: https://sourceforge.net/projects/dban/files/ "Download"
[dban]: http://www.dban.org/
[debian-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/debian.d "Configuration"
[debian-dl]: https://www.debian.org/CD/ "Download"
[debian]: https://www.debian.org/
[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
[elementary-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/elementaryos.d "Configuration"
[elementary]: https://elementary.io/
[fedora-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/fedora.d "Configuration"
[fedora]: https://getfedora.org/
[gentoo-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/gentoo.d "Configuration"
[gentoo-dl]: https://www.gentoo.org/downloads/ "Download"
[gentoo]: https://www.gentoo.org/
[globbing]: https://en.wikipedia.org/wiki/Glob_(programming)
[gparted-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/gparted.d "Configuration"
[gparted-dl]: http://gparted.sourceforge.net/download.php "Download"
[gparted]: http://gparted.sourceforge.net/livecd.php
[grml-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/grml.d "Configuration"
[grml-dl]: https://grml.org/download/ "Download"
[grml-usb-stick]: http://www.gtkdb.de/index_7_2627.html
[grml]: https://grml.org/
[hirens-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/hbcd.d "Configuration"
[hirens-dl]: http://www.hirensbootcd.org/download/ "Download"
[hirens]: http://www.hirensbootcd.org/
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[kali-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/kali.d "Configuration"
[kali-dl]: http://www.kali.org/downloads/ "Download"
[kali]: https://www.kali.org/
[kdeneon-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/kde-neon.d "Configuration"
[kdeneon-dl]: https://neon.kde.org/download "Download"
[kdeneon]: https://neon.kde.org/
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[loop-boot]: http://forums.kali.org/showthread.php?1025-Grub2-Loop-Boot-Solution
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[manjaro-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/manjaro.d "Configuration"
[manjaro-dl]: http://manjaro.org/get-manjaro/ "Download"
[manjaro]: https://manjaro.org/
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[memtest86+]: http://www.memtest.org/
[mint-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/linuxmint.d "Configuration"
[mint-dl]: https://linuxmint.com/download.php "Download"
[mint]: https://linuxmint.com/
[multiboot-usb]: http://www.circuidipity.com/multi-boot-usb.html
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[netboot.xyz-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/netboot.xyz.d "Configuration"
[netboot.xyz]: https://netboot.xyz/
[openbsd-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/openbsd.d "Configuration"
[openbsd-dl]: http://www.openbsd.org/ftp.html "Download"
[openbsd]: http://www.openbsd.org/
[opensuse-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/opensuse.d "Configuration"
[opensuse]: https://www.opensuse.org/
[panticz-mbusb]: http://www.panticz.de/MultiBootUSB
[parabola-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/parabola.d "Configuration"
[parabola-dl]: https://parabola.nu/download/ "Download"
[parabola]: https://www.parabola.nu/
[partedmagic-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/pmagic.d "Configuration"
[partedmagic-dl]: https://partedmagic.com/downloads/ "Download"
[partedmagic]: http://partedmagic.com/
[pentoo-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/pentoo.d "Configuration"
[pentoo-dl]: http://www.pentoo.ch/download/ "Download"
[pentoo]: http://www.pentoo.ch/
[qemu]: http://qemu.org/
[raspixel-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/pixel.d "Configuration"
[raspixel-dl]: http://downloads.raspberrypi.org/pixel_x86/ "Download"
[raspixel]: https://www.raspberrypi.org/blog/pixel-pc-mac/
[sabayon-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/sabayon.d "Configuration"
[sabayon-dl]: http://www.sabayon.org/download "Download"
[sabayon]: https://www.sabayon.org/
[seatools-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/seatools.d "Configuration"
[seatools]: http://www.seagate.com/support/downloads/seatools/
[sgdisk]: http://www.rodsbooks.com/gdisk/sgdisk.html
[slax-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/slax.d "Configuration"
[slax-dl]: http://www.slax.org/download.php "Download"
[slax]: http://www.slax.org/
[slitaz-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/slitaz.d "Configuration"
[slitaz-dl]: http://www.slitaz.org/en/get/ "Download"
[slitaz]: http://www.slitaz.org/
[sysrescuecd-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/systemrescuecd.d "Configuration"
[sysrescuecd-dl]: http://www.sysresccd.org/Download "Download"
[sysrescuecd]: http://www.sysresccd.org/
[tails-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/tails.d "Configuration"
[tails-dl]: https://tails.boum.org/install/download/ "Download"
[tails]: https://tails.boum.org/
[tinycore-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/tinycore.d "Configuration"
[tinycore-dl]: http://www.tinycorelinux.net/downloads.html "Download"
[tinycore]: http://tinycorelinux.net/
[trisquel-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/trisquel.d "Configuration"
[trisquel-dl]: http://trisquel.info/download "Download"
[trisquel]: https://trisquel.info/
[ubcd-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/ubcd.d "Configuration"
[ubcd-dl]: http://www.ultimatebootcd.com/download.html "Download"
[ubcd]: http://www.ultimatebootcd.com/
[ubcdiso]: http://www.ultimatebootcd.com/forums/viewtopic.php?p=9108#p9108
[ubuntu-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/ubuntu.d "Configuration"
[ubuntu-dl]: https://www.ubuntu.com/download "Download"
[ubuntu]: http://www.ubuntu.com/
[usingmemdisk]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Using_Syslinux_and_memdisk
[void-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/void.d "Configuration"
[void-dl]: http://www.voidlinux.eu/download/ "Download"
[void]: http://www.voidlinux.eu/
