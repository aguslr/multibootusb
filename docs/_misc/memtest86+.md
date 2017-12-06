---
title: Memtest86+
homepage: http://www.memtest.org/
download: http://www.memtest.org/#downiso
cfgdir: memtest86+.d
layout: default
---

# {{ page.title }}

> Memtest86 and Memtest86+ are memory test software programs designed to test
> and stress test an x86 architecture computer's random access memory (RAM) for
> errors, by writing a series of test patterns to most memory addresses, then
> reading back the data written, and comparing for errors. Each tries to verify
> that the RAM will accept and correctly retain arbitrary patterns of data
> written to it, that there are no errors where different bits of memory
> interact, and that there are no conflicts between memory addresses.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Bootable ISO (using [MEMDISK][])
- Bootable binary


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/Memtest86
