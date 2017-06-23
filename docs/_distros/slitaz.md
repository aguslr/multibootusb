---
title: SliTaz
homepage: http://www.slitaz.org/
download: http://www.slitaz.org/en/get/
cfgdir: slitaz.d
layout: default
---

# {{ page.title }}

> SliTaz GNU/Linux is a mini distribution and live CD designed to run speedily
> on hardware with 256 MB of RAM. SliTaz uses BusyBox, a recent Linux kernel and
> GNU software. It boots with Syslinux and provides more than 200 Linux
> commands, the lighttpd web server, SQLite database, rescue tools, IRC client,
> SSH client and server powered by Dropbear, X window system, JWM (Joe's Window
> Manager), gFTP, Geany IDE, Mozilla Firefox, AlsaPlayer, GParted, a sound file
> editor and more. The SliTaz ISO image fits on a less than 30 MB media and
> takes just 80 MB of hard disk space.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All LiveCD ISOs (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=slitaz
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/SliTaz
