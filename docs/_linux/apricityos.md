---
title: Apricity OS
homepage: https://apricityos.com/
download: https://apricityos.com/download
cfgdir: apricityos.d
layout: default
---

# {{ page.title }}

> Apricity OS is a Linux distribution based on Arch Linux. Apricity features a
> trimmed down desktop (GNOME or Cinnamon) and provides the ICE Site Specific
> Browser to integrate web-apps into the desktop environment.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Stable ISO
- Development ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=apricity
