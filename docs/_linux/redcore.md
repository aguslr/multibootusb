---
title: Redcore Linux
homepage: https://redcorelinux.org/
download: http://mirror.math.princeton.edu/pub/redcorelinux/iso/
cfgdir: redcore.d
layout: default
---

# {{ page.title }}

> Redcore Linux explores the idea of bringing the power of Gentoo Linux to the
> masses. It aims to be a very quick way to install a pure Gentoo Linux system
> without spending hours or days compiling from source code, and reading
> documentation. To achieve this goal, Redcore provides a repository with
> pre-built binary packages which receives continuous updates, following a
> rolling release model.
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


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=redcore
