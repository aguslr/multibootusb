---
title: Lubuntu
homepage: http://lubuntu.me/
download: http://lubuntu.me/downloads/
cfgdir: lubuntu.d
layout: default
---

# {{ page.title }}

> Lubuntu is a fast, lightweight and energy-saving variant of Ubuntu using the
> LXDE (Lightweight X11 Desktop Environment) desktop. It is intended to have
> low-resource system requirements and is designed primarily for netbooks,
> mobile devices and older PCs.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=lubuntu
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Lubuntu
