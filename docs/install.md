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

        cd multibootusb && cp -rf grub.* $mntusb/boot/grub/

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

{% if site.distros %}
<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="cfg-icon" viewBox="0 0 24 24">
    <path d="M10 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-8l-2-2z"/>
  </symbol>
</svg>
<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="dl-icon" viewBox="0 0 24 24">
    <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>
  </symbol>
</svg>
<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="home-icon" viewBox="0 0 24 24">
    <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
  </symbol>
</svg>
<table class="distro-list">
  <thead>
  <tr><th colspan="2">Distribution</th></tr>
  </thead>
  <tbody>
  {% for distro in site.distros %}
  <tr>
  <td markdown="1">
  [{{ distro.title }}]({{ distro.url }})
  </td>
  <td markdown="1">
  {% if distro.download %}<a href="{{ distro.download }}" alt="Download" title="Download"><svg class="icon"><use xlink:href="#dl-icon"/></svg></a>{% endif %}
  {% if distro.homepage %}<a href="{{ distro.homepage }}" alt="Homepage" title="Homepage"><svg class="icon"><use xlink:href="#home-icon"/></svg></a>{% endif %}
  {% if distro.cfgdir %}<a href="{{ site.github.repository_url | append: "/tree/master/grub.d/" | append: distro.cfgdir }}" alt="Configuration" title="Configuration"><svg class="icon"><use xlink:href="#cfg-icon"/></svg></a>{% endif %}
  </td>
  </tr>
  {% endfor %}
  </tbody>
</table>
{% endif %}


## Testing USB drive with QEMU

To test the newly created USB drive in a virtual environment with [QEMU][], run:

```
qemu-system-x86_64 -enable-kvm -localtime -m 2G -vga std -drive file=<device>,cache=none,format=raw,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


## Resources

- [Hybrid MBRs][hybridmbr]
- [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios]
- [Man page of SGDISK][sgdisk]
- [MultiBoot USB with Grub2 (boot directly from iso files)][panticz-mbusb]
- [QEMU Emulator User Documentation][qemudocs]
- [Super Grub Disk Wiki - Loopback.cfg][loopback.cfg]
- [Transform a USB stick into a boot device packing multiple Linux distros][multiboot-usb]
- [Tuning KVM - KVM][kvmtuning]
- [Using Syslinux and memdisk][usingmemdisk]


[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[kvmtuning]: http://www.linux-kvm.org/page/Tuning_KVM
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[memtest86+]: http://www.memtest.org/
[multiboot-usb]: http://www.circuidipity.com/multi-boot-usb.html
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[panticz-mbusb]: http://www.panticz.de/MultiBootUSB
[qemu]: http://qemu.org/
[qemudocs]: https://qemu.weilnetz.de/doc/qemu-doc.html
[sgdisk]: http://www.rodsbooks.com/gdisk/sgdisk.html
[usingmemdisk]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Using_Syslinux_and_memdisk
