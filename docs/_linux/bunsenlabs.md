---
title: BunsenLabs Linux
homepage: https://www.bunsenlabs.org/
download: https://www.bunsenlabs.org/installation.html
cfgdir: bunsenlabs.d
layout: default
---

# {{ page.title }}

> BunsenLabs Linux is a distribution offering a light-weight and easily
> customizable Openbox desktop. The BunsenLabs distribution is based on Debian's
> Stable branch and is a community continuation of the CrunchBang Linux
> distribution.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=bunsenlabs
[wikipedia]: https://en.wikipedia.org/wiki/CrunchBang_Linux#BunsenLabs
