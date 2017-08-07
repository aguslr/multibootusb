---
title: Linux Kodachi
homepage: https://www.digi77.com/linux-kodachi/
download: https://www.digi77.com/linux-kodachi/
cfgdir: kodachi.d
layout: default
---

# {{ page.title }}

> Linux Kodachi is a Debian-based distribution which can be run from a DVD or
> USB thumb drive. The distribution filters all network traffic through a VPN
> and the Tor network, obscuring the user's network location. The distribution
> attempts to clean up after itself, removing traces of its use from the
> computer.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=kodachi
