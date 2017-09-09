---
title: Hiren's BootCD
homepage: http://www.hirensbootcd.org/
download: http://www.hirensbootcd.org/download/
cfgdir: hbcd.d
layout: default
---

# {{ page.title }}

> Hiren's BootCD (also known as HBCD) is a bootable software CD containing a
> number of diagnostic programs such as partitioning agents, system performance
> benchmarks, disk cloning and imaging tools, data recovery tools, MBR tools,
> BIOS tools, and others for fixing various computer problems.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- 15.2 ISO
- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/Hirens_BootCD
