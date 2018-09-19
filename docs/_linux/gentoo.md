---
title: Gentoo Linux
homepage: https://www.gentoo.org/
download: https://www.gentoo.org/downloads/
cfgdir: gentoo.d
layout: default
---

# {{ page.title }}

> Gentoo Linux is a versatile and fast, completely free Linux distribution
> geared towards developers and network professionals. Unlike other distros,
> Gentoo Linux has an advanced package management system called Portage. Portage
> is a true ports system in the tradition of BSD ports, but is Python-based and
> sports a number of advanced features including dependencies, fine-grained
> package management, "fake" (OpenBSD-style) installs, safe unmerging, system
> profiles, virtual packages, config file management, and more.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- LiveDVD ISO[^note1]
- Installation ISO[^note2]
- Admin CD ISO[^note3]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename LiveDVD ISO files (e.g. from `livedvd-x86-amd64-32ul.iso` to `gentoo-livedvd-x86-amd64-32ul.iso`)
[^note2]: Rename Installation ISO files (e.g. from `install-x86-minimal.iso` to `gentoo-install-x86-minimal.iso`)
[^note3]: Rename Admin CD ISO files (e.g. from `admincd-amd64.iso` to `gentoo-admincd-amd64.iso`)


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=gentoo
[wikipedia]: https://en.wikipedia.org/wiki/Gentoo_Linux
