---
title: Super Grub2 Disk
homepage: http://www.supergrubdisk.org/super-grub2-disk/
download: http://www.supergrubdisk.org/category/download/supergrub2diskdownload/
cfgdir: supergrub.d
layout: default
---

# {{ page.title }}

> Super Grub2 Disk is a live CD that helps the user to boot into almost any
> operating system even if the system cannot boot into it by normal means. This
> allows a user to boot into an installed operating system if their GRUB
> installation has been overwritten, erased or otherwise corrupted. Super Grub2
> Disk can detect installed operating systems and provide a boot menu which
> allows the user to boot into their desired operating system. Super Grub2 Disk
> is not an operating system itself, but a live boot loader which can be run
> from a CD or USB thumb drive.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=supergrub
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
