---
title: Pentoo
homepage: http://www.pentoo.ch/
download: http://www.pentoo.ch/download/
cfgdir: pentoo.d
layout: default
---

# {{ page.title }}

> Pentoo is a Live CD and Live USB designed for penetration testing and security
> assessment. Based on Gentoo Linux, Pentoo is provided both as 32 and 64 bit
> installable livecd. Pentoo is also available as an overlay for an existing
> Gentoo installation. It features packet injection patched wifi drivers, GPGPU
> cracking software, and lots of tools for penetration testing and security
> assessment. The Pentoo kernel includes grsecurity and PAX hardening and extra
> patches - with binaries compiled from a hardened toolchain with the latest
> nightly versions of some tools available.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


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
[distrowatch]: https://distrowatch.com/table.php?distribution=pentoo
[wikipedia]: https://en.wikipedia.org/wiki/Pentoo
