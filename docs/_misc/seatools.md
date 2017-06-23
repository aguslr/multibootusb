---
title: Seagate SeaTools
homepage: http://www.seagate.com/support/downloads/seatools/
download: http://www.seagate.com/support/downloads/seatools/
cfgdir: seatools.d
layout: default
---

# {{ page.title }}

> SeaTools is a computer hard disk analysis software developed and released by
> Seagate Technology. It exists as a version for DOS (bundled in a bootable
> medium with FreeDOS) and Microsoft Windows.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/SeaTools
