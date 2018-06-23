---
title: Kali Linux
homepage: https://www.kali.org/
download: https://www.kali.org/downloads/
cfgdir: kali.d
layout: default
---

# {{ page.title }}

> Kali Linux (formerly known as BackTrack) is a Debian-based distribution with a
> collection of security and forensics tools. It features timely security
> updates, support for the ARM architecture, a choice of four popular desktop
> environments, and seamless upgrades to newer versions.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=kali
[wikipedia]: https://en.wikipedia.org/wiki/Kali_Linux
