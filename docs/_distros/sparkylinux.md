---
title: SparkyLinux
homepage: https://sparkylinux.org/
download: https://sparkylinux.org/download/
cfgdir: sparkylinux.d
layout: default
---

# {{ page.title }}

> SparkyLinux is a lightweight, fast and simple Linux distribution designed for
> both old and new computers featuring customised Enlightenment and LXDE
> desktops. It has been built on the "testing" branch of Debian GNU/Linux.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Home ISOs
- Minimal ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=sparky
[wikipedia]: https://en.wikipedia.org/wiki/SparkyLinux
