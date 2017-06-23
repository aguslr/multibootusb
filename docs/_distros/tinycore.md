---
title: Tiny Core Linux
homepage: http://tinycorelinux.net/
download: http://www.tinycorelinux.net/downloads.html
cfgdir: tinycore.d
layout: default
---

# {{ page.title }}

> Tiny Core Linux is a 12 MB graphical Linux desktop. It is based on a recent
> Linux kernel, BusyBox, Tiny X, Fltk, and Flwm. The core runs entirely in
> memory and boots very quickly. The user has complete control over which
> applications and/or additional hardware to have supported, be it for a
> desktop, a nettop, an appliance or server; selectable from the project's
> online repository.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All ISOs


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=tinycore
[wikipedia]: https://en.wikipedia.org/wiki/Tiny_Core_Linux
