---
title: ArchStrike
homepage: https://archstrike.org/
download: https://archstrike.org/downloads
cfgdir: archstrike.d
layout: default
---

# {{ page.title }}

> ArchStrike is a distribution for security professionals and researchers based
> on Arch Linux. ArchStrike provides an extra repository of security software
> and is available in 32-bit and 64-bit builds. ArchStrike provides a live
> desktop environment based on the Openbox window manager.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO

## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=archstrike
