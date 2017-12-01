---
title: OpenMandriva Lx
homepage: https://www.openmandriva.org/
download: https://www.openmandriva.org/download
cfgdir: openmandriva.d
layout: default
---

# {{ page.title }}

> The OpenMandriva distribution is a full-featured Linux desktop and server,
> sponsored by the OpenMandriva Association. It was based on ROSA, a Russian
> Linux distribution project which forked Mandriva Linux in 2012, incorporating
> many of Mandriva's original tools and utilities and adding in-house
> enhancements. The goal of OpenMandriva is to facilitate the creation,
> improvement, promotion and distribution of free and open-source software in
> general, and OpenMandriva projects in particular.
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
[distrowatch]: http://distrowatch.com/table.php?distribution=openmandriva
[wikipedia]: https://en.wikipedia.org/wiki/OpenMandriva_Lx
