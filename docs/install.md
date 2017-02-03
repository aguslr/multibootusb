---
title: Preparing the multiboot USB
layout: default
---
* auto-gen TOC:
{:toc}

# {{ page.title }}

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

Once the USB drive is created, it only remains to copy the bootable files (ISO or kernel) to the pendrive. Currently, the following utilities are supported (save to `$mntusb/boot/isos`):

Distribution | Links | Notes
:------------|-------|-----:
[Antergos][] | [Configuration][antergos-cfg] [Download][antergos-dl] | Live ISO
[Arch-Anywhere][] | [Configuration][arch-anywhere-cfg] [Download][arch-anywhere-dl] | Dual ISO
[Arch Linux][arch] | [Configuration][arch-cfg] [Download][arch-dl] | Dual ISO
[AVG Rescue CD][avgrescue] | [Configuration][avgrescue-cfg] [Download][avgrescue-dl] | [MEMDISK][]
[BackBox][] | [Configuration][backbox-cfg] [Download][backbox-dl] | [loopback.cfg][]
[BlackArch Linux][blackarch] | [Configuration][blackarch-cfg] [Download][blackarch-dl] |
[boot.rackspace.com][] | [Configuration][boot.rackspace.com-cfg] | [MEMDISK][]
[Boot-repair-disk][brd] | [Configuration][brd-cfg] [Download][brd-dl] | [loopback.cfg][]
[Byzantium][] | [Configuration][byzantium-cfg] [Download][byzantium-dl] |
[CentOS][] | [Configuration][centos-cfg] [Download][centos-dl] | Live ISO
[Clonezilla Live][clonezilla] | [Configuration][clonezilla-cfg] [Download][clonezilla-dl] |
[DBAN][] | [Configuration][dban-cfg] [Download][dban-dl] | [MEMDISK][]
[Debian][] | [Configuration][debian-cfg] [Download][debian-dl] | Live ISO and Netboot[^note1] ISO ([MEMDISK][])
[elementary OS][elementary] | [Configuration][elementary-cfg] | [loopback.cfg][]
[Fedora][] | [Configuration][fedora-cfg] | Workstation and Server ISOs
[Gentoo Linux][gentoo] | [Configuration][gentoo-cfg] [Download][gentoo-dl] | LiveDVD ISO
[GParted Live][gparted] | [Configuration][gparted-cfg] [Download][gparted-dl] |
[Grml Live Linux][grml] | [Configuration][grml-cfg] [Download][grml-dl] | [loopback.cfg][]
[Hiren's BootCD][hirens] | [Configuration][hirens-cfg] [Download][hirens-dl] | [MEMDISK][][^note2]
[Kali Linux][kali] | [Configuration][kali-cfg] [Download][kali-dl] | [loopback.cfg][]
[KDE neon][kdeneon] | [Configuration][kdeneon-cfg] [Download][kdeneon-dl] | [loopback.cfg][]
[Kubuntu][] | [Configuration][kubuntu-cfg] [Download][kubuntu-dl] | Desktop ISO ([loopback.cfg][])
[Linux Mint][mint] | [Configuration][mint-cfg] [Download][mint-dl] | [loopback.cfg][]
[Lubuntu][] | [Configuration][lubuntu-cfg] [Download][lubuntu-dl] | Desktop ISO ([loopback.cfg][])
[Manjaro Linux][manjaro] | [Configuration][manjaro-cfg] [Download][manjaro-dl] | [MEMDISK][]
[netboot.xyz][] | [Configuration][netboot.xyz-cfg] | [MEMDISK][]
[OpenBSD][] | [Configuration][openbsd-cfg] [Download][openbsd-dl] | Install ISO[^note3] ([MEMDISK][])
[openSUSE][] | [Configuration][opensuse-cfg] | Tumbleweed ISO
[Parabola GNU/Linux-libre][parabola] | [Configuration][parabola-cfg] [Download][parabola-dl] | Dual ISO
[Parted Magic][partedmagic] | [Configuration][partedmagic-cfg] [Download][partedmagic-dl] |
[Pentoo][] | [Configuration][pentoo-cfg] [Download][pentoo-dl] |
[Raspberry PIXEL][raspixel] | [Configuration][raspixel-cfg] [Download][raspixel-dl] | [loopback.cfg][]
[Sabayon Linux][sabayon] | [Configuration][sabayon-cfg] [Download][sabayon-dl] | Desktop ISO
[Seagate SeaTools][seatools] | [Configuration][seatools-cfg] | [MEMDISK][]
[Slax Linux][slax] | [Configuration][slax-cfg] [Download][slax-dl] |
[SliTaz][] | [Configuration][slitaz-cfg] [Download][slitaz-dl] | [MEMDISK][]
[Subgraph OS][subgraphos] | [Configuration][subgraphos-cfg] [Download][subgraphos-dl] | [loopback.cfg][]
[SystemRescueCd][sysrescuecd] | [Configuration][sysrescuecd-cfg] [Download][sysrescuecd-dl] |
[Tails][] | [Configuration][tails-cfg] [Download][tails-dl] |
[Tiny Core Linux][tinycore] | [Configuration][tinycore-cfg] [Download][tinycore-dl] |
[Trisquel GNU/Linux][trisquel] | [Configuration][trisquel-cfg] [Download][trisquel-dl] | Live CD and DVD ISOs
[Ubuntu][] | [Configuration][ubuntu-cfg] [Download][ubuntu-dl] | Desktop ISO ([loopback.cfg][]) and Netboot[^note4] ISO ([MEMDISK][])
[Ultimate Boot CD][ubcd] | [Configuration][ubcd-cfg] [Download][ubcd-dl] | [MEMDISK][]
[Void][] | [Configuration][void-cfg] [Download][void-dl] | Live ISO
[Xubuntu][] | [Configuration][xubuntu-cfg] [Download][xubuntu-dl] | Desktop ISO ([loopback.cfg][])


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
[kubuntu-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/kubuntu.d "Configuration"
[kubuntu-dl]: https://www.kubuntu.org/getkubuntu/ "Download"
[kubuntu]: https://www.kubuntu.org/
[loop-boot]: http://forums.kali.org/showthread.php?1025-Grub2-Loop-Boot-Solution
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[lubuntu-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/lubuntu.d "Configuration"
[lubuntu-dl]: http://lubuntu.me/downloads/ "Download"
[lubuntu]: http://lubuntu.me/
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
[subgraphos-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/subgraphos.d "Configuration"
[subgraphos-dl]: https://subgraph.com/sgos/download/ "Download"
[subgraphos]: https://subgraph.com/
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
[xubuntu-cfg]: {{ site.github.repository_url }}/tree/master/grub.d/xubuntu.d "Configuration"
[xubuntu-dl]: https://xubuntu.org/getxubuntu/ "Download"
[xubuntu]: https://xubuntu.org/
