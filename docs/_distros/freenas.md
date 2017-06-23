---
title: FreeNAS
homepage: http://www.freenas.org/
download: http://www.freenas.org/download/
cfgdir: freenas.d
layout: default
---

# {{ page.title }}

> FreeNAS is a tiny FreeBSD-based operating system which provides free
> Network-Attached Storage (NAS) services (CIFS, FTP and NFS).
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Unsupported on [UEFI][] systems.


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=freenas
[wikipedia]: https://en.wikipedia.org/wiki/FreeNAS
[uefi]: https://en.wikipedia.org/wiki/UEFI
