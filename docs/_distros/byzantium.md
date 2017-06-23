---
title: Byzantium
homepage: http://project-byzantium.org/
download: http://project-byzantium.org/download/
cfgdir: byzantium.d
layout: default
---

# {{ page.title }}

> Byzantium is a live Linux distribution based on Porteus Linux that delivers
> easy-to-use, secure, and robust mesh networking capabilities. The goal of
> Project Byzantium is to develop a communication system by which users can
> connect to each other and share information in the absence of convenient
> access to the Internet. This is done by setting up an ad-hoc wireless mesh
> network that offers services which replace popular websites often used for
> this purpose, such as Twitter and IRC.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


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


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[wikipedia]: https://en.wikipedia.org/wiki/Byzantium_(Linux_distribution)
