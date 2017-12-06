---
title: Q4OS
homepage: https://q4os.org/
download: https://q4os.org/downloads1.html
cfgdir: q4os.d
layout: default
---

# {{ page.title }}

> Q4OS is a Debian-based desktop Linux distribution designed to offer
> classic-style user interface (Trinity) and simple accessories, and to serve
> stable APIs for complex third-party applications, such as Google Chrome,
> VirtualBox and development tools. The system is also very useful for virtual
> cloud environments due to its very low hardware requirements.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live CD ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=q4os
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
