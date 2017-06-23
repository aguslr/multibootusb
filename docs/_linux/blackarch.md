---
title: BlackArch Linux
homepage: https://blackarch.org/
download: https://blackarch.org/downloads.html
cfgdir: blackarch.d
layout: default
---

# {{ page.title }}

> BlackArch Linux is an Arch Linux-based distribution designed for penetration
> testers and security researchers. It is supplied as a live DVD image that
> comes with several lightweight window managers, including Fluxbox, Openbox,
> Awesome and spectrwm. It ships with over a thousand specialist tools for
> penetration testing and forensic analysis.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=blackarch
[wikipedia]: https://en.wikipedia.org/wiki/BlackArch_Linux
