---
title: KNOPPIX
homepage: http://www.knoppix.org/
download: http://www.knopper.net/knoppix-mirrors/index-en.html
cfgdir: knoppix.d
layout: default
---

# {{ page.title }}

> KNOPPIX is a bootable disc with a collection of GNU/Linux software, automatic
> hardware detection, and support for many graphics cards, sound cards, SCSI and
> USB devices and other peripherals. KNOPPIX can be used as a Linux demo,
> educational disc, rescue system, or adapted and used as a platform for
> commercial software product demos. It is not necessary to install anything on
> a hard disk. Due to on-the-fly decompression, the disc can have up to 10 GB of
> executable software installed on it.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [boot - Booting a Knoppix ISO from Grub - device/uri madness - Unix & Linux
Stack Exchange][bootknoppix]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=knoppix
[wikipedia]: https://en.wikipedia.org/wiki/Knoppix
[bootknoppix]: https://unix.stackexchange.com/q/102529/102345
