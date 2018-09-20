---
title: Netrunner
homepage: http://www.netrunner.com/
download: http://netrunner.com/download
cfgdir: netrunner.d
layout: default
---

# {{ page.title }}

> Netrunner is a Debian-based distribution featuring a highly customised KDE
> desktop with extra applications, multimedia codecs, Flash and Java plugins,
> and a unique look and feel. The modifications are designed to enhance the
> user-friendliness of the desktop environment while still preserving the
> freedom to tweak.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Arch-based ISO
- Debian-based ISO (using [loopback.cfg][])
- Core ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=netrunner
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Netrunner_(operating_system)
