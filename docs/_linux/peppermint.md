---
title: Peppermint
homepage: https://peppermintos.com/
download: https://peppermintos.com/download
cfgdir: peppermint.d
layout: default
---

# {{ page.title }}

> Peppermint OS is a Lubuntu-based Linux distribution that aims to be lightning
> fast and easy on system resources. By employing Ice, Peppermint integrates
> seamlessly with Cloud and web-based applications. The distribution's other
> features include automatic updates, easy step-by-step installation, sleek and
> user-friendly interface, and increased mobility by integrating directly with
> Cloud-based applications.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISOs (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=peppermint
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Peppermint_Linux_OS
