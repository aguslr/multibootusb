---
title: Parted Magic
homepage: https://partedmagic.com/
download: https://partedmagic.com/downloads/
cfgdir: pmagic.d
layout: default
---

# {{ page.title }}

> Parted Magic is a small live CD/USB/PXE with its elemental purpose being to
> partition hard drives. Although GParted and Parted are the main programs, the
> CD/USB also offers other applications, such as Partition Image, TestDisk,
> fdisk, sfdisk, dd, ddrescue, etc. In August 2013 the distribution became a
> commercial product and is no longer available as a free download.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Last ISO avaliable as free download ([pmagic_2013_08_01][isofile]).


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=partedmagic
[wikipedia]: https://en.wikipedia.org/wiki/Parted_Magic
[isofile]: https://archive.org/details/pmagic_2013_08_01
