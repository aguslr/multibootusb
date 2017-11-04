---
title: MenuetOS
homepage: http://www.menuetos.net/
download: http://www.menuetos.net/download.htm
cfgdir: menuetos.d
layout: default
---

# {{ page.title }}

> MenuetOS is an operating system with a monolithic preemptive, real-time kernel,
> including video drivers, all written in FASM assembly language, for 64-bit and
> 32-bit x86 architecture computers, by Ville M. Turjanmaa. It has a graphical
> desktop, games, and networking abilities (TCP/IP stack), yet it still fits on
> one 1.44 MB floppy disk.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard diskette image (using [MEMDISK][])[^note1]
- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename image files (e.g. from `M6412690.IMG` to `menuet-6412690.img`)


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/MenuetOS
