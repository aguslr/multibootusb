---
title: Parrot OS
homepage: https://www.parrotsec.org/
download: https://www.parrotsec.org/download.fx
cfgdir: parrot.d
layout: default
---

# {{ page.title }}

> Parrot Security OS is a Debian-based, security-oriented distribution featuring
> a collection of utilities designed for penetration testing, computer
> forensics, reverse engineering, hacking, privacy, anonymity and cryptography.
> The product, developed by Frozenbox, comes with MATE as the default desktop
> environment.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISOs
- Netboot ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename Netboot ISO files (e.g. from `mini.iso` to `Parrot-i386-mini.iso`).


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=parrotsecurity
[wikipedia]: https://en.wikipedia.org/wiki/Parrot_Security_OS
