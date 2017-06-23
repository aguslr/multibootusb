---
title: GParted Live
homepage: http://gparted.sourceforge.net/livecd.php
download: http://gparted.sourceforge.net/download.php
cfgdir: gparted.d
layout: default
---

# {{ page.title }}

> GParted Live is a business card-size live CD distribution with a single
> purpose - to provide tools for partitioning hard disks in an intuitive,
> graphical environment. The distribution uses X.Org, the light-weight Fluxbox
> window manager, and the latest 4.x Linux kernel. GParted Live runs on most x86
> machines with a Pentium II or better.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=gparted
[wikipedia]: https://en.wikipedia.org/wiki/Gparted_live
