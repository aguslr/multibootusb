---
title: Runtu
homepage: http://runtu.org/
download: http://runtu.org/runtu/download.html
cfgdir: runtu.d
layout: default
---

# {{ page.title }}

> Runtu is a Russian desktop Linux distribution based on Ubuntu's LTS
> (long-ter support) releases. It features full support for Russian and a
> variety of extra applications, tools and media codecs. There are two separate
> editions that are produced with a varying degree of frequency; the "Xfce"
> edition tend to get more attention while the "Lite" edition, featuring the
> LXDE desktop, is also released and updated from time to time.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO

## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=runtu
