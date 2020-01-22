---
title: RoboLinux
homepage: https://www.robolinux.org/
download: https://sourceforge.net/projects/robolinux/files/
cfgdir: robolinux.d
layout: default
---

# {{ page.title }}

> Robolinux is a user-friendly and intuitive operating system based on the
> latest long term support release of Ubuntu. One of the project's more
> interesting features is the availability of a pre-configured virtual machine
> support pack with Windows XP or Windows 7 - a VirtualBox setup which allows
> the user to install and run the Windows operating system seamlessly alongside
> Robolinux. This is an optional add-on that must be downloaded from the
> project's online store.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=robolinux
