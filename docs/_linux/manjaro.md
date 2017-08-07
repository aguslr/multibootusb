---
title: Manjaro Linux
homepage: https://manjaro.org/
download: http://manjaro.org/get-manjaro/
cfgdir: manjaro.d
layout: default
---

# {{ page.title }}

> Manjaro Linux is a fast, user-friendly, desktop-oriented operating system
> based on Arch Linux. Key features include intuitive installation process,
> automatic hardware detection, stable rolling-release model, ability to install
> multiple kernels, special Bash scripts for managing graphics drivers and
> extensive desktop configurability. Manjaro Linux offers Xfce as the core
> desktop options, as well as a minimalist Net edition for more advanced users.
> Community-supported GNOME 3/Cinnamon and KDE flavours are available. Users
> also benefit from the supportive and vibrant Manjaro community forum.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Official Edition ISOs
- Community Edition ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=manjaro
[wikipedia]: https://en.wikipedia.org/wiki/Manjaro_Linux
