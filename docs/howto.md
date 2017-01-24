---
title: How-to
layout: default
---
* auto-gen TOC:
{:toc}

# How-to

This how-to will explain how we can configure [GRUB][] so it can directly boot an [ISO file][iso] for a specific distribution or software utility. There are several ways to achieve this, listed below in order of preference.


## Previous steps

First of all, we'll need to download the ISO file and mount it so we can access its contents to find out what the best method is:

- [Mounting an ISO file in Linux][mntlinux].
- [Mounting an ISO file in Windows][mntwin].


## Methods

### Using loopback.cfg

Some ISO files include a file named *[loopback.cfg][]* specifically designed to be read by GRUB. This file should be located in `/boot/grub/`.

As an example, we can load the `/boot/grub/loopback.cfg` file for *Ubuntu 16.04* like so:

~~~
submenu "Ubuntu 16.04 ->" {
  iso_path="/boot/isos/ubuntu-16.04.1-desktop-i386.iso"
  export iso_path
  search --set=root --file "$iso_path"
  loopback loop "$iso_path"
  root=(loop)
  configfile /boot/grub/loopback.cfg
  loopback --delete loop
}
~~~


### Converting ISOLINUX entries

Commonly, when creating a bootable ISO, you'd use [ISOLINUX][], which is part of the [SYSLINUX Project][syslinux], as [boot loader][boot-loader].

The process involves creating a file named [isolinux.cfg][] that contains the menu entries for the boot loader.

This file is usually located in `/isolinux/` or `/boot/syslinux/` but the location can vary, therefore it's recommended to search the directory where our ISO is mounted (e.g. `/mnt/loop`) with the following command:

~~~
find /mnt/loop -type f -name 'isolinux.cfg'
~~~

However, `isolinux.cfg` usually loads other files via an [INCLUDE][syslinux-include] clause. If so, we'll need to follow these files in order to find the one containing the actual menu entries. Then, we can manually convert the entries from [ISOLINUX's format][isolinux.cfg] to [GRUB's format][grub.cfg].

As an example, these are the menu entries for *Debian 8 Live* (file `/isolinux/live.cfg`):

~~~ null
label live-586
        menu label ^Live (586)
        menu default
        linux /live/vmlinuz1
        initrd /live/initrd1.img
        append boot=live components quiet splash

label live-586-failsafe
        menu label ^Live (586 failsafe)
        linux /live/vmlinuz1
        initrd /live/initrd1.img
        append boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal

label live-686-pae
        menu label ^Live (686-pae)
        linux /live/vmlinuz2
        initrd /live/initrd2.img
        append boot=live components quiet splash

label live-686-pae-failsafe
        menu label ^Live (686-pae failsafe)
        linux /live/vmlinuz2
        initrd /live/initrd2.img
        append boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal
~~~

Which could be converted as:

~~~
submenu "Debian 8 Live ->" {
  isofile="/boot/isos/debian-live-8.7.1-i386-standard.iso"
  loopback loop "$isofile"
  menuentry "Live (586)" "$isofile" {
    isofile="$2"
    bootoptions="findiso=$isofile boot=live components quiet splash"
    linux (loop)/live/vmlinuz1 $bootoptions
    initrd (loop)/live/initrd1.img
  }
  menuentry "Live (586 failsafe)" "$isofile" {
    isofile="$2"
    bootoptions="findiso=$isofile boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal"
    linux (loop)/live/vmlinuz1 $bootoptions
    initrd (loop)/live/initrd1.img
  }
  menuentry "Live (686-pae)" "$isofile" {
    isofile="$2"
    bootoptions="findiso=$isofile boot=live components quiet splash"
    linux (loop)/live/vmlinuz2 $bootoptions
    initrd (loop)/live/initrd2.img
  }
  menuentry "Live (686-pae failsafe)" "$isofile" {
    isofile="$2"
    bootoptions="findiso=$isofile boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal"
    linux (loop)/live/vmlinuz2 $bootoptions
    initrd (loop)/live/initrd2.img
  }
}
~~~

Notice, however, that we've had to add the parameter `findiso=$isofile` so the kernel can mount and access the contents of the ISO during boot. Otherwise the boot process will fail.

Unfortunately, many distributions use different parameters. Some known examples:

| Parameter  | Distributions |
|:-----------|:--------------|
| `img_loop=$isofile` | Antergos, Arch Linux, Manjaro Linux, Parabola GNU/Linux-libre |
| `from=$isofile` | Byzantium, Slax |
| `iso-scan/filename=$isofile` | CentOS, Fedora, Trisquel GNU/Linux, Ubuntu, Void |
| `findiso=$isofile` | Clonezilla Live, Debian, GParted Live, Kali Linux, Tails |
| `isoboot=$isofile` | Gentoo, Sabayon Linux |
| `isofrom_system=$isofile` | openSUSE |
| `iso_filename=$isofile` | Parted Magic |
| `isoloop=$isofile` | SystemRescueCd |

Distributions based on these might work with its corresponding parameter, so it's a matter of trial and error.


### Using MEMDISK

If the ISO file is relatively small (less than 128MB) or nothing else works, we can try using [MEMDISK][]. With this method, the ISO is loaded directly into memory (as long as the system has enough) which will allow for booting some unsupported ISOs.

To get MEMDISK's binary, we can install [SYSLINUX][] using our system's package manager, and find it at `/usr/lib/syslinux/memdisk` or `/usr/lib/syslinux/bios/memdisk`, depending on our distribution.

Alternatively, we can download the official [tarball][] from [kernel.org][], in which case, we will find the binary at `/bios/memdisk/memdisk`.

As an example, we can load into memory the ISO for *DBAN 2.3.0* (only 17MB) using this:

~~~
menuentry "DBAN 2.3.0" {
  isofile="/boot/isos/dban-2.3.0_i586.iso"
  bootoptions="iso raw"
  linux16 $prefix/memdisk $bootoptions
  initrd16 $isofile
}
~~~

If our ISO is bigger than 128MB and we have a 32-bit OS, then we have to increase the maximum memory usage, by adding the parameter `vmalloc` with (at least) the size of the ISO file. For instance, for *Ultimate Boot CD v5.3.6*:

~~~
menuentry "Ultimate Boot CD v5.3.6" {
  isofile="/boot/isos/ubcd536.iso"
  bootoptions="iso raw vmalloc=650M"
  linux16 $prefix/memdisk $bootoptions
  initrd16 $isofile
}
~~~


## If nothing works

- Search the home page for the project that created the ISO. They might provide further information on how to boot directly from the ISO file. This should actually be our first course of action.
- Use your favorite search engine to scour the Internet for a solution. Search for *"grub loopback"* or *"grub iso"*, followed by the name of the distribution or software utility.
- Browse the [repository tree][repo] and check the existing GRUB configurations files.


[boot-loader]: https://en.wikipedia.org/wiki/Boot_loader
[grub.cfg]: https://www.gnu.org/software/grub/manual/html_node/Multi_002dboot-manual-config.html
[grub]: https://www.gnu.org/software/grub/
[iso]: https://en.wikipedia.org/wiki/ISO_image
[isolinux.cfg]: http://www.syslinux.org/wiki/index.php?title=Isolinux.cfg
[isolinux]: http://www.syslinux.org/wiki/index.php?title=ISOLINUX
[kernel.org]: https://www.kernel.org/pub/linux/utils/boot/syslinux/
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[mntlinux]: http://www.howtogeek.com/168137/mount-an-iso-image-in-linux/
[mntwin]: http://www.howtogeek.com/howto/windows-vista/mount-an-iso-image-in-windows-vista/
[repo]: {{ site.github.repository_url }}
[syslinux-include]: http://www.syslinux.org/wiki/index.php?title=SYSLINUX#INCLUDE_filename
[syslinux]: http://www.syslinux.org/
[tarball]: https://en.wikipedia.org/wiki/Tar_(computing)
