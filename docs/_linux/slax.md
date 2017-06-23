---
title: Slax Linux
homepage: http://www.slax.org/
download: http://www.slax.org/download.php
cfgdir: slax.d
layout: default
---

# {{ page.title }}

> Slax is a Slackware-based bootable CD containing a Linux operating system,
> designed with a modular approach. Despite its small size, Slax provides a wide
> collection of pre-installed software for daily use, including a well-organised
> graphical user interface and useful recovery tools for system administrators.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=slax
[wikipedia]: https://en.wikipedia.org/wiki/Slax
