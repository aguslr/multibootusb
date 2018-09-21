---
title: Solus
homepage: https://getsol.us/
download: https://getsol.us/download/
cfgdir: solus.d
layout: default
---

# {{ page.title }}

> Solus is a Linux distribution built from scratch. It uses a forked version of
> the PiSi package manager, maintained as "eopkg" within Solus, and a custom
> desktop environment called "Budgie", developed in-house. The Budgie desktop,
> which can be set to emulate the look and feel of the GNOME 2 desktop, is
> tightly integrated with the GNOME stack. The distribution is available for
> 64-bit computers only.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Budgie ISO
- GNOME ISO
- MATE ISO


## Resources

- [How to launch Solus ISO from GRUB2 : SolusProject][howtosolus]
- [Fix Solus · Issue #17 · probonopd/SystemImageKit · GitHub][fixsolus]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=solus
[wikipedia]: https://en.wikipedia.org/wiki/Solus_(operating_system)
[howtosolus]: https://redd.it/5vzhi2
[fixsolus]: https://github.com/probonopd/SystemImageKit/issues/17
