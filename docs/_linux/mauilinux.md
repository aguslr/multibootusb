---
title: Maui Linux
homepage: https://mauilinux.org/
download: https://mauilinux.org/download/
cfgdir: maui.d
layout: default
---

# {{ page.title }}

> Maui Linux is a desktop Linux distribution based on KDE neon and featuring
> KDE's Plasma desktop. It was created in August 2016 as a continuation of
> Netrunner's Kubuntu-based "Desktop" edition, but it was re-based on KDE neon
> which is a more cutting-edge project with frequent updates and a semi-rolling
> release model. Besides providing a KDE-centric distribution with many popular
> KDE packages included on the live DVD, the project also focuses on integrating
> non-KDE software, such as Firefox, Thunderbird or VLC with the underlying
> infrastructure of the Plasma desktop.
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


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=maui
