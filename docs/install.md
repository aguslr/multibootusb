---
title: Preparing the multiboot USB
layout: default
---

# {{ page.title }}

* auto-gen TOC:
{:toc}

## Getting the configuration files

### Using Git

If we have Git installed on the system, we can get the files directly from the repository:

```
git clone https://github.com/aguslr/multibootusb
```

After this, every time we want to update the files we do:

```
cd multibootusb && git pull
```

### Without Git

If Git is not installed, we can still get the files as long as we have a basic Unix environment available:

```
wget {{ site.github.tar_url }} -O - | tar -xzv --strip-components 1 --exclude={README.md,docs}
```

## Creating new USB drive

<div class="note" markdown="1">
We must have the files for targets *i386-pc* (e.g. package *[grub-pc-bin][]* in Debian/Ubuntu) and *x86_64-efi* (e.g. package *[grub-efi-amd64-bin][]* in Debian/Ubuntu) available in the system, usually in `/usr/lib/grub/`.
</div>

### Manually preparing the drive

#### Creating a bootable USB drive

Follow the instructions to create a [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios] from the ArchWiki.


#### Copying the configuration files to the USB drive

1. Set variables to avoid errors:

        export mntusb=<mountpoint> partusb=<partition>

    Where `<mountpoint>` is any directory you want the partition to be mounted at (e.g. */media/usb*), and `<partition>` is the name of the data partition (e.g. */dev/sdh3*). Run `dmesg` to get this information.

2. Mount the data partition:

        mount --target $mntusb $partusb

3. Create a directory named *boot* to store GRUB's configuration files and a directory named *isos* for the kernel/ISO files:

        mkdir -p $mntusb/boot/{grub/mbusb.d/,isos}

4. Copy the necessary GRUB files:

        cd multibootusb && cp -rf mbusb.* $mntusb/boot/grub/

5. Copy the provided `grub.cfg`:

        cp -f grub.cfg.example $mntusb/boot/grub/grub.cfg

6. Download [MEMDISK][] from [kernel.org][]:

        wget -qO - 'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' | tar -xz -C $mntusb/boot/grub/ --no-same-owner --strip-components 3 'syslinux-6.03/bios/memdisk/memdisk'


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
Usage: makeUSB.sh [options] device [fs-type] [data-size]

 device                         Device to modify (e.g. /dev/sdb)
 fs-type                        Filesystem type for the data partition [ext3|ext4|vfat|ntfs]
 data-size                      Data partition size (e.g. 5G)
  -b,  --hybrid                 Create a hybrid MBR
  -c,  --clone                  Clone Git repository on the device
  -e,  --efi                    Enable EFI compatibility
  -i,  --interactive            Launch gdisk to create a hybrid MBR
  -h,  --help                   Display this message
```


## Adding to existing USB drive

If you already have your own bootable USB drive that uses GRUB to boot, you can simply add the following lines into your custom `grub.cfg`:

```
# Load MBUSB configuration
if [ -e "$prefix/mbusb.cfg" ]; then
  source "$prefix/mbusb.cfg"
fi
```

And then copy the project's configuration files to your drive's GRUB directory:

```
cd multibootusb && cp -rf mbusb.* $mntusb/boot/grub/
```


## Get bootable files

Once you have a bootable USB drive, it only remains to copy the bootable files (ISO or kernel) to the pendrive. See the [list of supported files][isos] for download links and then save them into `$mntusb/boot/isos`.


## Testing USB drive with QEMU

To test the newly created USB drive in a virtual environment with [QEMU][], run:

```
qemu-system-x86_64 -enable-kvm -rtc base=localtime -m 2G -vga std -drive file=<device>,readonly,cache=none,format=raw,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


## Resources

- [Hybrid MBRs][hybridmbr]
- [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios]
- [grub.cfg · Jimmy-Z/grub-iso-boot][grub-iso-boot]
- [Man page of SGDISK][sgdisk]
- [MultiBoot USB with Grub2 (boot directly from iso files)][panticz-mbusb]
- [QEMU Emulator User Documentation][qemudocs]
- [Super Grub Disk Wiki - Loopback.cfg][loopback.cfg]
- [Transform a USB stick into a boot device packing multiple Linux distros][multiboot-usb]
- [Tuning KVM - KVM][kvmtuning]
- [Using Syslinux and memdisk][usingmemdisk]


[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
[grub-efi-amd64-bin]: https://packages.debian.org/search?keywords=grub-efi-amd64-bin
[grub-iso-boot]: https://github.com/Jimmy-Z/grub-iso-boot/blob/master/grub.cfg
[grub-pc-bin]: https://packages.debian.org/search?keywords=grub-pc-bin
[hybridmbr]: http://www.rodsbooks.com/gdisk/hybrid.html
[isos]: isos.html
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[kvmtuning]: http://www.linux-kvm.org/page/Tuning_KVM
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[multiboot-usb]: http://www.circuidipity.com/multi-boot-usb.html
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[panticz-mbusb]: http://www.panticz.de/MultiBootUSB
[qemu]: http://qemu.org/
[qemudocs]: https://qemu.weilnetz.de/doc/qemu-doc.html
[sgdisk]: http://www.rodsbooks.com/gdisk/sgdisk.html
[usingmemdisk]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Using_Syslinux_and_memdisk
