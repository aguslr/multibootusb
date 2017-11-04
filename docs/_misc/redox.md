---
title: Redox
homepage: https://www.redox-os.org/
download: https://github.com/redox-os/redox/releases
cfgdir: redox.d
layout: default
---

# {{ page.title }}

> Redox is a Unix-like microkernel operating system written in the programming
> language Rust, a language with focus on safety and high performance.
> Redox aims to be secure, usable, and free. Redox is inspired by previous
> kernels and operating systems, such as SeL4, Minix, Plan 9, and BSD. It is
> similar to the GNU or BSD ecosystem, but in a memory safe language and with
> modern technology. It is free and open-source software distributed under
> an MIT License.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[wikipedia]: https://en.wikipedia.org/wiki/Redox_(operating_system)
