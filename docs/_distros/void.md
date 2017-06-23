---
title: Void
homepage: http://www.voidlinux.eu/
download: http://www.voidlinux.eu/download/
cfgdir: void.d
layout: default
---

# {{ page.title }}

> Void is an independently-developed, general-purpose operating system based on
> the monolithic Linux kernel. It features a hybrid binary/source package
> management system which allows users to quickly install, update and remove
> software, or to build software directly from sources with the help of the XBPS
> source packages collection. Other features of the distribution include support
> for Raspberry Pi single-board computers (both armv6 and armv7),
> rolling-release development model with daily updates, integration of OpenBSD's
> LibreSSL software, and native init system called "runit".
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=void
[wikipedia]: https://en.wikipedia.org/wiki/Void_Linux
