---
title: Deepin
homepage: https://www.deepin.org/
download: https://www.deepin.org/download/
cfgdir: deepin.d
layout: default
---

# {{ page.title }}

> deepin (formerly, Deepin, Linux Deepin, Hiweed GNU/Linux) is a Debian-based
> distribution (it was Ubuntu-based until version 15 released in late 2015) that
> aims to provide an elegant, user-friendly and reliable operating system. It
> does not only include the best the open source world has to offer, but it has
> also created its own desktop environment called DDE or Deepin Desktop
> Environment which is based on the Qt 5 toolkit. Deepin focuses much of its
> attention on intuitive design. Its home-grown applications, like Deepin
> Software Centre, DMusic and DPlayer are tailored to the average user. Being
> easy to install and use, deepin can be a good Windows alternative for office
> and home use.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=deepin
