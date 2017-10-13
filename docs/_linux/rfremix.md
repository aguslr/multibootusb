---
title: RFRemix
homepage: http://russianfedora.pro/stories/rfremix/
download: http://russianfedora.pro/stories/download/
cfgdir: rfremix.d
layout: default
---

# {{ page.title }}

> Russian Fedora Remix is a remix of the Fedora Linux distribution adapted for
> Russia. However, it is neither a copy of the original Fedora nor a new
> GNU/Linux distribution. The project aims to ensure that Fedora fully satisfies
> the needs of Russian users with many additional features provided out of the
> box (e.g., specific software packages, pre-installed drivers for popular
> graphics processors, manuals in Russian).
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Server ISO
- Workstation ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[wikipedia]: https://en.wikipedia.org/wiki/Russian_Fedora_Remix
