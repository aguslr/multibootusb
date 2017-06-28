---
title: FreeDOS
homepage: http://www.freedos.org/
download: http://www.freedos.org/download/
cfgdir: freedos.d
layout: default
---

# {{ page.title }}

> FreeDOS (formerly Free-DOS and PD-DOS) is a free operating system for IBM PC
> compatible computers. It intends to provide a complete DOS-compatible
> environment for running legacy software and supporting embedded systems.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- CDROM "standard" installer ISO.
- USB "Lite" installer image (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/FreeDOS
