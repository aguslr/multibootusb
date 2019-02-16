---
title: Rescatux
homepage: https://www.supergrubdisk.org/rescatux/
download: https://www.supergrubdisk.org/category/download/rescatuxdownloads/rescatux-beta/
cfgdir: rescatux.d
layout: default
---

# {{ page.title }}

> Rescatux is a GNU/Linux rescue cd (and eventually also Windows) but it is not
> like other rescue disks. Rescatux comes with Rescapp. Rescapp is a nice wizard
> that will guide you through your rescue tasks.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Rescapp 0.51 beta 1 ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://www.distrowatch.com/table.php?distribution=rescatux

