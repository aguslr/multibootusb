---
title: Remix OS
homepage: http://www.jide.com/remixos-for-pc
download: https://sourceforge.net/projects/remix-os/files/
cfgdir: remixos.d
layout: default
---

# {{ page.title }}

> Remix OS is an operating system based on Android-x86. Remix OS merges the
> Android operating system with a PC/desktop style interface with a traditional
> desktop application menu.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Remix OS for PC ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=remixos
[wikipedia]: https://en.wikipedia.org/wiki/Remix_OS
