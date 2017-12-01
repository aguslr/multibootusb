---
title: feren OS
homepage: https://ferenos.weebly.com/
download: https://ferenos.weebly.com/get-it.html
cfgdir: ferenos.d
layout: default
---

# {{ page.title }}

> feren OS is a desktop Linux distribution based on Linux Mint's main edition.
> The feren OS distribution ships with the Cinnamon desktop environment and
> includes the WINE compatibility layer for running Windows applications. The
> distribution also ships with the WPS productivity software, which is mostly
> compatible with Microsoft Office, and the Vivaldi web browser.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO[^note1]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


## Notes

[^note1]: Rename ISO files to remove spaces (e.g. from `feren OS x64.iso` to `feren_OS-x64.iso`).


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=ferenos
