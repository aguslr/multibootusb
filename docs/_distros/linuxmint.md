---
title: Linux Mint
homepage: https://linuxmint.com/
download: https://linuxmint.com/download.php
cfgdir: linuxmint.d
layout: default
---

# {{ page.title }}

> Linux Mint is an Ubuntu-based distribution whose goal is to provide a more
> complete out-of-the-box experience by including browser plugins, media codecs,
> support for DVD playback, Java and other components. It also adds a custom
> desktop and menus, several unique configuration tools, and a web-based package
> installation interface. Linux Mint is compatible with Ubuntu software
> repositories.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=mint
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Linux_Mint
