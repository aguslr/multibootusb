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


## Creating a bootable USB drive

Follow the instructions to create a [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios] from the ArchWiki.


## Copying the files to the USB drive:

1. Mount the data partition:

    ```sh
    mount --target <mountpoint> <partition>
    ```

    Where `<mountpoint>` is any directory you want the partition to be mounted at, and `<partition>` is the name of the data partition (e.g. */dev/sdh3*). Run `dmesg` to get this information.

2. Create a directory named *boot* to store GRUB's configuration files, a directory named *krnl* for the kernel files and another named *isos* for the ISO files:

    ```sh
    mkdir -p <mountpoint>/boot/{grub/grub.d/,krnl,isos}
    ```

3. Copy the necessary GRUB files:

    ```sh
    cd multibootusb
    cp -f grub.cfg <mountpoint>/boot/grub/
    cp grub.d/*.cfg <mountpoint>/boot/grub/grub.d/
    ```

4. Download and copy the ISO files into the USB drive:

    ```sh
    wget "http://cdimage.kali.org/kali-1.1.0/kali-linux-1.1.0-i386.iso" -P <mountpoint>/boot/isos/
    ```

5. Reboot and select the USB drive to access the menu.


## Testing USB drive with [QEMU][qemu]

To test the newly created USB drive in a virtual environment, run:

```sh
qemu-system-x86_64 -enable-kvm -localtime -m 2G -drive file=<device>,cache=none,if=virtio
```

Where `<device>` is the name of the USB device (e.g. */dev/sdh*). Run `mount` to get this information.


## Get bootable files

You can download ISO files from these websites (save to `<mountpoint>/boot/isos`):

* **[BackBox][backbox]**: an Ubuntu-based distribution developed to perform penetration tests and security assessments.

* **[Clonezilla Live][clonezilla]**: a small bootable GNU/Linux distribution for x86/amd64 (x86-64) based computers.

* **[Grml Live Linux][grml]**: a bootable live system based on Debian that includes a collection of GNU/Linux software especially for system administrators.

* **[Debian][debian]**: a free operating system (OS) for your computer.

* **[Fedora][fedora]**: a polished, easy to use operating system.

* **[Hiren's BootCD][hirens]**: a first aid kit for your computer.

* **[Kali Linux][kali]**: a Debian-derived Linux distribution designed for digital forensics and penetration testing.

* **[Parted Magic][partedmagic]**: a complete hard disk management solution.

* **[Slax Linux][slax]**: a modern, portable, small and fast Linux operating system with a modular approach and outstanding design.

* **[SystemRescueCd][sysrescuecd]**: a Linux system rescue disk for administrating or repairing your system and data after a crash.

* **[Tails][tails]**: a live operating system, that aims at preserving your privacy and anonymity.

* **[Ubuntu][ubuntu]**: an open source software platform that runs from the cloud, to the smartphone, to all your things.

You can get iPXE kernels from these websites (save to `<mountpoint>/boot/krnl`):

* **[boot.rackspace.com][]**: a collection of iPXE scripts that allow you to rapidly network boot Operating Systems, Utilities and other tools very easily.

* **[netboot.xyz][]**: a way to select various operating system installers or utilities from one place within the BIOS without the need of having to go retrieve the media to run the tool.


## Demo

![Demo GIF](demo.gif "Demo")

## References

- [Hybrid UEFI GPT + BIOS GPT/MBR boot][efi+bios]
- [Using Syslinux and memdisk][memdisk]
- [Thermionix/multipass-usb][multipass-usb]
- [Transform a USB stick into a boot device packing multiple Linux distros][multiboot-usb]
- [MultiBoot USB with Grub2 (boot directly from iso files)][multibootusb]
- [Grub2 Loop Boot Solution][loop-boot]
- [Multiboot USB-Stick: grml 2014.11 einrichten][grml-usb-stick]

[backbox]: https://backbox.org/
[clonezilla]: http://clonezilla.org/clonezilla-live.php
[debian]: https://www.debian.org/
[fedora]: https://getfedora.org/
[grml]: https://grml.org/
[hirens]: http://www.hirensbootcd.org/
[kali]: https://www.kali.org/
[partedmagic]: http://partedmagic.com/
[slax]: http://www.slax.org/
[sysrescuecd]: http://www.sysresccd.org/
[tails]: https://tails.boum.org/
[ubuntu]: http://www.ubuntu.com/
[boot.rackspace.com]: http://boot.rackspace.com/
[netboot.xyz]: https://netboot.xyz/
[qemu]: http://qemu.org/
[memdisk]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Using_Syslinux_and_memdisk
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[multiboot-usb]: http://www.circuidipity.com/multi-boot-usb.html
[multibootusb]: http://www.panticz.de/MultiBootUSB
[loop-boot]: http://forums.kali.org/showthread.php?1025-Grub2-Loop-Boot-Solution
[grml-usb-stick]: http://www.gtkdb.de/index_7_2627.html
[efi+bios]: https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
