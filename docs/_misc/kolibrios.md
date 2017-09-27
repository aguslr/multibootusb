---
title: KolibriOS
homepage: http://kolibrios.org/
download: http://kolibrios.org/download
cfgdir: kolibrios.d
layout: default
---

# {{ page.title }}

> KolibriOS is a tiny open-source operating system with a monolithic preemptive
> kernel and video drivers for 32-bit x86 architecture computers. KolibriOS is a
> fork of MenuetOS, written entirely in FASM (assembly language). However, C,
> C++, Free Pascal, Forth, among other high-level languages and compilers, can
> also be used in application development. KolibriOS features a rich set of
> applications that include a word processor, image viewer, graphical editor,
> web browser, and over 30 games.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=kolibri
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/KolibriOS
