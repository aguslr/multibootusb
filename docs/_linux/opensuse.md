---
title: openSUSE
homepage: https://www.opensuse.org/
download: https://www.opensuse.org/
cfgdir: opensuse.d
layout: default
---

# {{ page.title }}

> The openSUSE project is a community program sponsored by SUSE Linux and other
> companies. Promoting the use of Linux everywhere, this program provides free,
> easy access to openSUSE, a complete Linux distribution. The openSUSE project
> has three main goals: make openSUSE the easiest Linux for anyone to obtain and
> the most widely used Linux distribution; leverage open source collaboration to
> make openSUSE the world's most usable Linux distribution and desktop
> environment for new and experienced Linux users; dramatically simplify and
> open the development and packaging processes to make openSUSE the platform of
> choice for Linux developers and software vendors.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Leap/Tumbleweed ISO
- Tumbleweed Live ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=opensuse
[wikipedia]: https://en.wikipedia.org/wiki/OpenSUSE
