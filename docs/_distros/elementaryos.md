---
title: elementary OS
homepage: https://elementary.io/
download: https://elementary.io/
cfgdir: elementaryos.d
layout: default
---

# {{ page.title }}

> elementary OS is an Ubuntu-based desktop distribution. Some of its more
> interesting features include a custom desktop environment called Pantheon and
> many custom apps including Photos, Music, Videos, Calendar, Terminal, Files,
> and more. It also comes with some familiar apps like the Epiphany web browser
> and a fork of Geary mail.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=elementary
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Elementary_OS
