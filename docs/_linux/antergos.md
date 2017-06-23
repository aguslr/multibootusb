---
title: Antergos
homepage: https://antergos.com/
download: https://www.antergos.com/try-it/
cfgdir: antergos.d
layout: default
---

# {{ page.title }}

> Antergos is a modern, elegant and powerful operating system based on Arch
> Linux. It started life under the name of Cinnarch, combining the Cinnamon
> desktop with the Arch Linux distribution, but the project has moved on from
> its original goals and now offers a choice of several desktops, including
> GNOME 3 (default), Cinnamon, Razor-qt and Xfce. Antergos also provides its own
> graphical installation program.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=antergos
[wikipedia]: https://en.wikipedia.org/wiki/Antergos
