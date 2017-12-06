---
title: Korora
homepage: https://kororaproject.org
download: https://kororaproject.org/download
cfgdir: korora.d
layout: default
---

# {{ page.title }}

> Korora was born out of a desire to make Linux easier for new users, while
> still being useful for experts. The main goal of Korora is to provide a
> complete, easy-to-use system for general computing. Originally based on Gentoo
> Linux in 2005, Korora was re-born in 2010 as a Fedora Remix with tweaks and
> extras to make the system "just work" out of the box.
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
[distrowatch]: http://distrowatch.com/table.php?distribution=korora
[wikipedia]: https://en.wikipedia.org/wiki/Korora_(operating_system)
