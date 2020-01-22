---
title: GeckoLinux
homepage: https://geckolinux.github.io/
download: https://geckolinux.github.io/#download
cfgdir: gecko.d
layout: default
---

# {{ page.title }}

> GeckoLinux is a Linux spin based on the openSUSE distribution, with a focus on
> polish and out-of-the-box usability on the desktop. The distribution features
> many desktop editions which can be installed from live discs. Some patent
> encumbered open source software is included in GeckoLinux which is not
> available in the default installation of openSUSE. Special attention has been
> given to the quality of the font rendering. GeckoLinux provides two main
> editions, Static (which is based on openSUSE Leap) and Rolling
> (based on openSUSE Tumbleweed).
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All ISOs?

## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=gecko
