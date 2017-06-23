---
title: Ultimate Boot CD
homepage: http://www.ultimatebootcd.com/
download: http://www.ultimatebootcd.com/download.html
cfgdir: ubcd.d
layout: default
---

# {{ page.title }}

> Ultimate Boot CD allows you to run floppy-based diagnostic tools from CDROM
> drives and consolidate as many diagnostic tools as possible into one bootable
> CD. An experimental feature also allows you to run UBCD from your USB memory
> stick on newer machines that supports booting from USB devices.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Resources

- [Ultimate Boot CD - grub2 loopback iso support][ubcdgrub]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[ubcdgrub]: http://www.ultimatebootcd.com/forums/viewtopic.php?p=9108#p9108
