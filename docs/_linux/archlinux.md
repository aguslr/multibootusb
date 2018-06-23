---
title: Arch Linux
homepage: https://www.archlinux.org/
download: https://www.archlinux.org/download/
cfgdir: archlinux.d
layout: default
---

# {{ page.title }}

> Arch Linux is an independently developed, i686- and x86_64-optimised Linux
> distribution targeted at competent Linux users. It uses 'pacman', its
> home-grown package manager, to provide updates to the latest software
> applications with full dependency tracking. Operating on a rolling release
> system, Arch can be installed from a CD image or via an FTP server. The
> default install provides a solid base that enables users to create a custom
> installation. In addition, the Arch Build System (ABS) provides a way to
> easily build new packages, modify the configuration of stock packages, and
> share these packages with other users via the Arch Linux user repository.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Dual ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=arch
[wikipedia]: https://en.wikipedia.org/wiki/Arch_Linux
