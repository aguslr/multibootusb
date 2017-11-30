---
title: ROSA
homepage: http://www.rosalab.com/
download: http://www.rosalinux.com/downloads/
cfgdir: rosa.d
layout: default
---

# {{ page.title }}

> ROSA is a Russian company developing a variety of Linux-based solutions. Its
> flagship product, ROSA Desktop, is a Linux distribution featuring a highly
> customised KDE desktop and a number of modifications designed to enhance the
> user-friendliness of the working environment. The company also develops an
> "Enterprise Server" edition of ROSA which is based on Red Hat Enterprise
> Linux.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=rosa
[wikipedia]: https://en.wikipedia.org/wiki/ROSA_Linux
