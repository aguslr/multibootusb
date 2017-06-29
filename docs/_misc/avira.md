---
title: Avira Rescue System
homepage: https://www.avira.com/en/support-download-avira-antivir-rescue-system/product/
download: https://www.avira.com/en/download/product/avira-rescue-system
cfgdir: avira.d
layout: default
---

# {{ page.title }}

> The Avira AntiVir Rescue System a linux-based application that allows
> accessing computers that cannot be booted anymore. Thus it is possible to
> repair a damaged system, to rescue data or to scan the system for virus
> infections. Just double-click on the rescue system package to burn it to a
> CD/DVD. You can then use this CD/DVD to boot your computer.
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


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
