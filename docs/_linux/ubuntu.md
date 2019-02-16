---
title: Ubuntu
homepage: https://www.ubuntu.com/
download: https://www.ubuntu.com/download
cfgdir: ubuntu.d
layout: default
---

# {{ page.title }}

> Ubuntu is a complete desktop Linux operating system, freely available with
> both community and professional support. The Ubuntu community is built on the
> ideas enshrined in the Ubuntu Manifesto: that software should be available
> free of charge, that software tools should be usable by people in their local
> language and despite any disabilities, and that people should have the freedom
> to customise and alter their software in whatever way they see fit. "Ubuntu"
> is an ancient African word, meaning "humanity to others". The Ubuntu
> distribution brings the spirit of Ubuntu to the software world.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Desktop ISO (using [loopback.cfg][])
- Netboot ISO[^note1]
- Server ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [Official download page (Netboot)](http://cdimage.ubuntu.com/netboot/)
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename Netboot ISO files (e.g. from `mini.iso` to `ubuntu-16.04.1-mini-i386.iso`)


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=ubuntu
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Ubuntu_Linux
