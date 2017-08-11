---
title: Window Maker Live
homepage: http://wmlive.sourceforge.net/
download: https://sourceforge.net/projects/wmlive/files/
cfgdir: wmlive.d
layout: default
---

# {{ page.title }}

> Window Maker Live is a Debian-based Linux distribution that applies the Window
> Maker window manager as the default graphical user interface and integrates
> well-known open-source components in an attractive and usable user interface.
> The distribution includes integrated GNOME components, as well as the Firefox
> web browser and the Thunderbird mail client both of which are enhanced with
> essential productivity add-ons.
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


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=wmlive
