---
title: Devuan
homepage: https://devuan.org/
download: https://files.devuan.org/
cfgdir: devuan.d
layout: default
---

# {{ page.title }}

> Devuan GNU+Linux is a Linux distribution forked from Debian in 2015. The
> project's primary goal is to provide a variant of Debian without the
> complexities and dependencies of systemd, an init system and services manager
> originally developed by Red Hat and later adopted by most other Linux
> distributions. Devuan's initial beta release was made available in April 2016,
> together with an upgrade path from Debian 7.0 "Wheezy" and a possibility to
> switch to Devuan from Debian 8.0 "Jessie". The distribution adopted Xfce as
> its default desktop.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop Live ISO
- Minimal Live ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Only when data partition is formatted as [ext][]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=devuan
[wikipedia]: https://en.wikipedia.org/wiki/Devuan
[ext]: https://en.wikipedia.org/wiki/Extended_file_system
