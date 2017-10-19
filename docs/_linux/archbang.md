---
title: ArchBang Linux
homepage: http://www.archbang.org/
download: https://sourceforge.net/projects/archbang/files/
cfgdir: archbang.d
layout: default
---

# {{ page.title }}

> ArchBang Linux is a lightweight distribution based on Arch Linux. Using the
> Openbox window manager, it is fast, up-to-date and suitable for both desktop
> and portable systems.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All ISOs

## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=archbang
[wikipedia]: https://en.wikipedia.org/wiki/ArchBang
