---
title: Sabayon Linux
homepage: https://www.sabayon.org/
download: http://www.sabayon.org/download
cfgdir: sabayon.d
layout: default
---

# {{ page.title }}

> Sabayon is a Gentoo-based distribution which follows the works-out-of-the-box
> philosophy, aiming to give the user a wide number of applications that are
> ready for use and a self-configured operating system. Sabayon offers the user
> an easy-to-use workspace with a captivating look, good hardware detection and
> a large number of up-to-date software packages installed by default, with
> additional software available from a repository. Sabayon is available in
> several flavors featuring respectively the KDE, GNOME and Xfce desktop
> environments.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=sabayon
[wikipedia]: https://en.wikipedia.org/wiki/Sabayon_Linux
