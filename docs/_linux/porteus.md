---
title: Porteus
homepage: http://www.porteus.org/
download: http://build.porteus.org/
cfgdir: porteus.d
layout: default
---

# {{ page.title }}

> Porteus is a fast, portable and modular live CD/USB medium based on Slackware
> Linux. The distribution started as a community remix of Slax, another
> Slackware-based live CD, with KDE 3 as the default desktop for the i486
> edition and a stripped-down KDE 4 as the desktop environment for the x86_64
> flavour. The lightweight LXDE is available as an alternative desktop
> environment.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop Edition ISO


## Resources

- [Cheatcodes - what they are and how to use them - Porteus - Portable Linux][cheatcodes]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=porteus
[wikipedia]: https://en.wikipedia.org/wiki/Porteus_(operating_system)
[cheatcodes]: http://www.porteus.org/tutorials/26-general-info-tutorials/117-cheatcodes-what-they-are-and-how-to-use-them.html
