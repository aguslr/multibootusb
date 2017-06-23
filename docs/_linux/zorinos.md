---
title: Zorin OS
homepage: https://zorinos.com/
download: https://zorinos.com/download
cfgdir: zorinos.d
layout: default
---

# {{ page.title }}

> Zorin OS is an Ubuntu-based Linux distribution designed especially for
> newcomers to Linux. It has a Windows-like graphical user interface and many
> programs similar to those found in Windows. Zorin OS also comes with an
> application that lets users run many Windows programs. The distribution's
> ultimate goal is to provide a Linux alternative to Windows and let Windows
> users enjoy all the features of Linux without complications.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Core ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=zorin
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
