---
title: Byzantium
homepage: http://project-byzantium.org/
download: http://project-byzantium.org/download/
cfgdir: byzantium.d
layout: default
---

# {{ page.title }}

> Byzantium is a live Linux distribution that delivers easy-to-use, secure, and
> robust mesh networking capabilities.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/grub.d/" | append: page.cfgdir }}
[wikipedia]: https://en.wikipedia.org/wiki/Byzantium_(Linux_distribution)
