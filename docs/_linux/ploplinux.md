---
title: Plop Linux
homepage: https://www.plop.at/en/ploplinux/index.html
download: https://www.plop.at/en/ploplinux/downloads/index.html
cfgdir: ploplinux.d
layout: default
---

# {{ page.title }}

> Plop Linux is a small distribution that can boot from CD, DVD, USB flash drive
> (UFD), USB hard disk or from network with PXE. It is designed to rescue data
> from a damaged system, backup and restore operating systems, automate tasks
> and more.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=plop
