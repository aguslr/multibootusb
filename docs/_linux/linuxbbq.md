---
title: LinuxBBQ
homepage: http://linuxbbq.org/
download: http://sourceforge.net/p/linuxbbq/
cfgdir: linuxbbq.d
layout: default
---

# {{ page.title }}

> LinuxBBQ is a multi-purpose operating system based on Debian's "unstable"
> branch and spiced up with kernels and tools from siduction, Grml and Linux
> Mint. LinuxBBQ offers different flavours and desktops which are released as
> "editions" (with no version numbers) and which can be customised and remixed
> by the user. The individual editions are built to include most major desktop
> environments (with the exception of GNOME) and there is a special edition
> offering a choice of no fewer than 53 window managers - everything from aewm
> to xmonad.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- 2016+ ISOs that use [OverlayFS][]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=linuxbbq
[overlayfs]: https://en.wikipedia.org/wiki/OverlayFS
[wikipedia]: https://en.wikipedia.org/wiki/LinuxBBQ
