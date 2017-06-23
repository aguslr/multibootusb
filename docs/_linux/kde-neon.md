---
title: KDE neon
homepage: https://neon.kde.org/
download: https://neon.kde.org/download
cfgdir: kde-neon.d
layout: default
---

# {{ page.title }}

> KDE neon is a Ubuntu-based Linux distribution and live DVD featuring the
> latest KDE Plasma desktop and other KDE community software. Besides the
> installable DVD image, the project provides a rapidly-evolving software
> repository with all the latest KDE software. Two editions of the product are
> available - a "User" edition, designed for those interested in checking out
> the latest KDE software as it gets released, and a "Developer's" edition,
> created as a platform for testing cutting-edge KDE applications.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- User Edition ISO (using [loopback.cfg][])
- User LTS Edition ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=kdeneon
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/KDE#KDE_neon
