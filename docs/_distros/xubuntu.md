---
title: Xubuntu
homepage: https://xubuntu.org/
download: https://xubuntu.org/getxubuntu/
cfgdir: xubuntu.d
layout: default
---

# {{ page.title }}

> Xubuntu is a community-developed operating system based on Ubuntu. It comes
> with Xfce, which is a stable, light and configurable desktop environment.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=xubuntu
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Xubuntu
