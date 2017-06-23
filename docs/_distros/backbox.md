---
title: BackBox
homepage: https://backbox.org/
download: https://www.backbox.org/downloads
cfgdir: backbox.d
layout: default
---

# {{ page.title }}

> BackBox Linux is an Ubuntu-based distribution developed to perform penetration
> tests and security assessments. It is designed to be fast and easy to use. It
> provides a minimal yet complete desktop environment, thanks to its own
> software repositories, which are always updated to the latest stable versions
> of the most often used and best-known ethical hacking tools.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=backbox
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/BackBox
