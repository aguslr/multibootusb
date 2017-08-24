---
title: OpenBSD
homepage: https://www.openbsd.org/
download: https://www.openbsd.org/ftp.html
cfgdir: openbsd.d
layout: default
---

# {{ page.title }}

> The OpenBSD project produces a free, multi-platform BSD 4.4-based UNIX-like
> operating system. Its efforts emphasize portability, standardisation,
> correctness, proactive security and integrated cryptography. The project also
> develops the widely-used and popular OpenSSH (OpenBSD Secure Shell) software,
> which provides encrypted communication sessions over a computer network using
> the SSH protocol.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- CD ISO[^note1]
- Install ISO[^note2]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename CD ISO files (e.g. from `cd60.iso` to `openbsd-cd60-i386.iso`)
[^note2]: Rename install ISO files (e.g. from `install60.iso` to `openbsd-install60-i386.iso`)


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=openbsd
[wikipedia]: https://en.wikipedia.org/wiki/OpenBSD
