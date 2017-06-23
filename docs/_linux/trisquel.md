---
title: Trisquel GNU/Linux
homepage: https://trisquel.info/
download: http://trisquel.info/download
cfgdir: trisquel.d
layout: default
---

# {{ page.title }}

> Trisquel GNU/Linux is a 100% libre Ubuntu-based Linux distribution. Its main
> purpose is to provide an operating system for varied audience, including home
> and office users, educational institutions, multimedia workstations, etc. The
> project is managed by independent developers and is partially funded by
> donations.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live CD and DVD ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=trisquel
[wikipedia]: https://en.wikipedia.org/wiki/Trisquel
