---
title: MX Linux
homepage: https://mxlinux.org/
download: https://mxlinux.org/download-links
cfgdir: mx.d
layout: default
---

# {{ page.title }}

> MX Linux, a desktop-oriented Linux distribution based on Debian's "stable"
> branch, is a cooperative venture between the antiX and former MEPIS Linux
> communities. Using Xfce as the default desktop, it is a mid-weight operating
> system designed to combine an elegant and efficient desktop with simple
> configuration, high stability, solid performance and medium-sized footprint.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=mx
[wikipedia]: https://en.wikipedia.org/wiki/MX_Linux
