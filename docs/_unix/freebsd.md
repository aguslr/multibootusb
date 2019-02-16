---
title: FreeBSD
homepage: https://www.freebsd.org/
download: https://www.freebsd.org/where.html
cfgdir: freebsd.d
layout: default
---

# {{ page.title }}

> FreeBSD is a UNIX-like operating system for the i386, amd64, IA-64, arm, MIPS,
> powerpc, ppc64, PC-98 and UltraSPARC platforms based on U.C. Berkeley's
> "4.4BSD-Lite" release, with some "4.4BSD-Lite2" enhancements. It is also based
> indirectly on William Jolitz's port of U.C. Berkeley's "Net/2" to the i386,
> known as "386BSD", though very little of the 386BSD code remains. FreeBSD is
> used by companies, Internet Service Providers, researchers, computer
> professionals, students and home users all over the world in their work,
> education and recreation. FreeBSD comes with over 20,000 packages
> (pre-compiled software that is bundled for easy installation), covering a wide
> range of areas: from server software, databases and web servers, to desktop
> software, games, web browsers and business software - all free and easy to
> install.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All 64-bit ISOs[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Unsupported on [UEFI][] systems.


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=freebsd
[wikipedia]: https://en.wikipedia.org/wiki/FreeBSD
[uefi]: https://en.wikipedia.org/wiki/UEFI
