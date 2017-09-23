---
title: NetBSD
homepage: https://www.netbsd.org/
download: https://www.netbsd.org/releases/
cfgdir: netbsd.d
layout: default
---

# {{ page.title }}

> NetBSD is a free, secure, and highly portable UNIX-like Open Source operating
> system available for many platforms, from 64-bit AlphaServers and desktop
> systems to handheld and embedded devices. Its clean design and advanced
> features make it excellent in both production and research environments, and
> it is user-supported with complete source. Many applications are easily
> available through The NetBSD Packages Collection.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO[^note1]


## Resources

- [GNU GRUB Manual: Loopback booting][loopboot]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Installation via network only


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=netbsd
[wikipedia]: https://en.wikipedia.org/wiki/NetBSD
[loopboot]: https://www.gnu.org/software/grub/manual/grub/html_node/Loopback-booting.html
