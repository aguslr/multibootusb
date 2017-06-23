---
title: Parabola GNU/Linux-libre
homepage: https://www.parabola.nu/
download: https://parabola.nu/download/
cfgdir: parabola.d
layout: default
---

# {{ page.title }}

> Parabola GNU/Linux-libre is an unofficial "libre" variant of Arch Linux. It
> aims to provide a fully free (as in freedom) distribution based on the
> packages of the Arch Linux project, with packages optimised for i686 and
> x86_64 processors. The goal is to give the users complete control over their
> systems with 100% "libre" software. Parabola GNU/Linux-libre is listed by the
> Free Software Foundation (FSF) as a fully free software distribution. Besides
> a standard installation CD image, the project also provides a live/rescue DVD
> image with MATE as the default desktop environment.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Main Live ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=parabola
[wikipedia]: https://en.wikipedia.org/wiki/Parabola_Linux
