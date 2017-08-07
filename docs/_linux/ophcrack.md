---
title: Ophcrack LiveCD
homepage: http://ophcrack.sourceforge.net/
download: http://ophcrack.sourceforge.net/download.php?type=livecd
cfgdir: ophcrack.d
layout: default
---

# {{ page.title }}

> Ophcrack LiveCD is a specialist SliTaz-based live CD containing Ophcrack, an
> open source Windows password cracker that uses rainbow tables. The graphical
> program included on the live CD is reputed for being able to crack
> alphanumeric Windows passwords of up to 14 characters in usually just a few
> seconds.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard LiveCD ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=ophcrack
[wikipedia]: https://en.wikipedia.org/wiki/Ophcrack
