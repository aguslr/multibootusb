---
title: Elive
homepage: http://www.elivecd.org/
download: http://www.elivecd.org/download/beta/
cfgdir: elive.d
layout: default
---

# {{ page.title }}

> Elive, or Enlightenment live CD, is a Debian-based desktop Linux distribution
> and live CD featuring the Enlightenment window manager. Besides being
> pre-configured and ready for daily desktop use, it also includes "Elpanel" - a
> control centre for easy system and desktop administration. Elive is a
> commercial distribution; while the live CD is available as a free download,
> those wishing to install it to a hard disk are asked to pay US$15 for an
> installation module.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Beta DVD ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=elive
[wikipedia]: https://en.wikipedia.org/wiki/Elive
