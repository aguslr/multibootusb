---
title: Gentoo Linux
homepage: https://www.gentoo.org/
download: https://www.gentoo.org/downloads/
cfgdir: gentoo.d
layout: default
---

# {{ page.title }}

> Gentoo Linux is a versatile and fast, completely free Linux distribution
> geared towards developers and network professionals. Unlike other distros,
> Gentoo Linux has an advanced package management system called Portage. Portage
> is a true ports system in the tradition of BSD ports, but is Python-based and
> sports a number of advanced features including dependencies, fine-grained
> package management, "fake" (OpenBSD-style) installs, safe unmerging, system
> profiles, virtual packages, config file management, and more.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- LiveDVD ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/grub.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=gentoo
[wikipedia]: https://en.wikipedia.org/wiki/Gentoo_Linux
