---
title: SystemRescueCd
homepage: https://www.sysresccd.org/
download: https://www.sysresccd.org/Download
cfgdir: systemrescuecd.d
layout: default
---

# {{ page.title }}

> SystemRescueCd is a Gentoo-based Linux system on a bootable CD-ROM or USB
> drive, designed for repairing a system and data after a crash. It also aims to
> provide an easy way to carry out administration tasks on a computer, such as
> creating and editing hard disk partitions. It contains many useful system
> utilities (GNU Parted, PartImage, FSTools) and some basic ones (editors,
> Midnight Commander, network tools). It aims to be very easy to use. The kernel
> of the system supports all of today's most important file systems, including
> ext2, ext3, ext4, ReiserFS, Reiser4FS, btrfs, XFS, JFS, VFAT, NTFS, ISO9660,
> as well as network file systems, such as Samba and NFS.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard Arch-based ISO
- Old Gentoo-based ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=systemrescue
[wikipedia]: https://en.wikipedia.org/wiki/SystemRescueCD
