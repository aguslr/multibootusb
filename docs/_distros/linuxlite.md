---
title: Linux Lite
homepage: https://www.linuxliteos.com/
download: https://www.linuxliteos.com/download.php
cfgdir: linuxlite.d
layout: default
---

# {{ page.title }}

> Linux Lite is a beginner-friendly Linux distribution based on Ubuntu's
> long-term support (LTS) release and featuring the Xfce desktop. Linux Lite
> primarily targets Windows users. It aims to provide a complete set of
> applications to assist users with their everyday computing needs, including a
> full office suite, media players and other essential daily software.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=lite
[wikipedia]: https://en.wikipedia.org/wiki/Linux_Lite
