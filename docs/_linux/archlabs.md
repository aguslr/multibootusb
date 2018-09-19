---
title: ArchLabs
homepage: https://archlabslinux.com/
download: https://archlabslinux.com/get-archlabs-2/
cfgdir: archlabs.d
layout: default
---

# {{ page.title }}

> ArchLabs is a distribution based on Arch Linux and featuring the Openbox
> window manager as the primary desktop interface. ArchLabs is a 64-bit, rolling
> release distribution which provides a live DVD. The distribution can be
> installed using the AL-Installer system installer.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=archlabs
[wikipedia]: https://en.wikipedia.org/wiki/ArchLabs
