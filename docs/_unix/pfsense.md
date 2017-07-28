---
title: pfSense
homepage: https://www.pfsense.org/
download: https://www.pfsense.org/download/
cfgdir: pfsense.d
layout: default
---

# {{ page.title }}

> pfSense is a free, open source customized distribution of FreeBSD specifically
> tailored for use as a firewall and router that is entirely managed via web
> interface. In addition to being a routing platform, pfSense includes a long
> list of related features and a package system which allows further
> expandability.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Install 64-bit ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Unsupported on [UEFI][] systems.


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=pfsense
[wikipedia]: https://en.wikipedia.org/wiki/PfSense
[uefi]: https://en.wikipedia.org/wiki/UEFI
