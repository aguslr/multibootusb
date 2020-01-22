---
title: ReactOS
homepage: https://reactos.org/
download: https://reactos.org/download
cfgdir: reactos.d
layout: default
---

# {{ page.title }}

> ReactOS is a free and open-source operating system based on the best design
> principles found in the Windows NT architecture. Written completely from
> scratch, ReactOS is not a Linux-based system and it shares none of the UNIX
> architecture. The main goal of the ReactOS project is to provide an operating
> system which is binary compatible with Windows. This will allow Windows
> applications and drivers to run as they would on a Windows system. Additionally,
> the look and feel of the Windows operating system is used, such that people
> accustomed to the familiar user interface of Windows would find using ReactOS
> straightforward. The ultimate goal of ReactOS is to allow people to use it as
> an alternative to Windows without the need to change software they are used to.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- BootCD ISO for installation (using [MEMDISK][])
- LoveCD ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=reactos
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/ReactOS
