---
title: Kubuntu
homepage: https://www.kubuntu.org/
download: https://www.kubuntu.org/getkubuntu/
cfgdir: kubuntu.d
layout: default
---

# {{ page.title }}

> Kubuntu is a free, user-friendly Linux distribution based on KDE's desktop
> software and on the Ubuntu operating system. It has a biannual release cycle.
> Besides providing an up-to-date version of the KDE desktop at the time of the
> release, the project also releases updated KDE packages throughout the
> lifetime of each release.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=kubuntu
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/kubuntu
