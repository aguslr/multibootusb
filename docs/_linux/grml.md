---
title: Grml Live Linux
homepage: https://grml.org/
download: https://grml.org/download/
cfgdir: grml.d
layout: default
---

# {{ page.title }}

> Grml is a bootable CD (live CD) based on Debian GNU/Linux. It includes a
> collection of GNU/Linux software especially for users of text tools and system
> administrators. It also provides automatic hardware detection. Grml can be
> used as a rescue system, for analysing systems and networks, or as a working
> environment. Due to on-the-fly decompression, Grml includes about 2 GB of
> software and documentation on the CD.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All ISOs (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=grml
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Grml
