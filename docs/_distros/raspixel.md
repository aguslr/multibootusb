---
title: Raspberry PIXEL
homepage: https://www.raspberrypi.org/blog/pixel-pc-mac/
download: https://downloads.raspberrypi.org/pixel_x86/
cfgdir: pixel.d
layout: default
---

# {{ page.title }}

> PIXEL represents our best guess as to what the majority of users are looking
> for in a desktop environment: a clean, modern user interface; a curated suite
> of productivity software and programming tools, both free and proprietary; and
> the Chromium web browser with useful plugins, including Adobe Flash,
> preinstalled. And all of this is built on top of Debian, providing instant
> access to thousands of free applications.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
