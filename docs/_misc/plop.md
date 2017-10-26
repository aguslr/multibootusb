---
title: Plop Boot Manager
homepage: https://www.plop.at/en/bootmanager/index.html
download: https://www.plop.at/en/bootmanager/download.html
cfgdir: plop.d
layout: default
---

# {{ page.title }}

> The Plop Boot Manager is a small program to boot different operating systems.
> The boot manager has a built-in ide cdrom and usb driver to access that
> hardware without the help/need of a bios. You can boot the operating systems
> from hard disk, floppy, CD/DVD or from USB. You can start the boot manager
> from floppy, CD, network and there are many more ways to start the boot
> manager. You can install the boot manager on your hard disk. There is no extra
> partition required for the boot manager.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
