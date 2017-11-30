---
title: gNewSense
homepage: http://www.gnewsense.org/
download: http://www.gnewsense.org/Main/Download
cfgdir: gnewsense.d
layout: default
---

# {{ page.title }}

> A product sponsored by the Free Software Foundation, gNewSense is a
> Debian-based Linux distribution released without any proprietary and non-free
> components, and several enhancements. Notably, all proprietary firmware,
> restricted modules and Debian logos are removed. The goal of the project is to
> produce a totally free ("libre") Linux distribution.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO
- Netboot ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename Netboot ISO files (e.g. from `mini.iso` to `gnewsense-4.0-i386-mini.iso`).


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=gnewsense
[wikipedia]: https://en.wikipedia.org/wiki/GNewSense
