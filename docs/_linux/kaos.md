---
title: KaOS
homepage: https://kaosx.us/
download: https://kaosx.us/download/
cfgdir: kaos.d
layout: default
---

# {{ page.title }}

> KaOS is a desktop Linux distribution that features the latest version of the
> KDE desktop environment, the Calligra office suite, and other popular software
> applications that use the Qt toolkit. It was inspired by Arch Linux, but the
> developers build their own packages which are available from in-house
> repositories. KaOS employs a rolling-release development model and is built
> exclusively for 64-bit computer systems.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [How to boot iso from HDD - KaOS][bootiso]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=kaos
[bootiso]: https://forum.kaosx.us/d/1365-how-to-boot-iso-from-hdd
