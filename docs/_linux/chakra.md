---
title: Chakra Linux
homepage: https://www.chakralinux.org/
download: https://www.chakralinux.org/
cfgdir: chakra.d
layout: default
---

# {{ page.title }}

> Chakra GNU/Linux is a user-friendly and powerful distribution and live CD
> originally forked from Arch Linux. It features a graphical installer,
> automatic hardware detection and configuration, the latest KDE desktop, and a
> variety of tools and extras.
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
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=chakra
[wikipedia]: https://gl.wikipedia.org/wiki/Chakra_GNU/Linux
