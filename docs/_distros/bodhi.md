---
title: Bodhi Linux
homepage: http://www.bodhilinux.com/
download: http://www.bodhilinux.com/download/
cfgdir: bodhi.d
layout: default
---

# {{ page.title }}

> Bodhi Linux is an elegant and lightweight Ubuntu-based distribution featuring
> Moksha, an Enlightenment-17-based desktop environment. The project takes a
> decidedly minimalist approach by offering modularity, high levels of
> customisation, and choice of themes. In addition to basic 32- and 64-bit
> systems, Bodhi maintains designated ISO images for Chromebooks and legacy
> machines. By default Bodhi has only five pre-installed applications: Midori,
> Terminology, PCManFM, ePhoto, and ePad. Additional software is available via
> AppCenter, a web-based software installation tool.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard 32bit and 64bit ISOs (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=bodhi
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Bodhi_Linux
