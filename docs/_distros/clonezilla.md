---
title: Clonezilla Live
homepage: http://clonezilla.org/clonezilla-live.php
download: http://clonezilla.org/downloads.php
cfgdir: clonezilla.d
layout: default
---

# {{ page.title }}

> Clonezilla Live is a Debian-based live CD containing Clonezilla, a partition
> and disk cloning software similar to Norton Ghost. It saves and restores only
> used blocks in hard drive. With Clonezilla, one can clone a 5 GB system to 40
> clients in about 10 minutes.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Stable ISO
- Alternative stable ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=clonezilla
[wikipedia]: https://en.wikipedia.org/wiki/Clonezilla#Clonezilla_Live
