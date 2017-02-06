---
title: CentOS
homepage: https://www.centos.org/
download: https://wiki.centos.org/Download
cfgdir: centos.d
layout: default
---

# {{ page.title }}

> CentOS as a group is a community of open source contributors and users.
> Typical CentOS users are organisations and individuals that do not need strong
> commercial support in order to achieve successful operation. CentOS is 100%
> compatible rebuild of the Red Hat Enterprise Linux, in full compliance with
> Red Hat's redistribution requirements. CentOS is for people who need an
> enterprise class operating system stability without the cost of certification
> and support.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- LiveGNOME ISO
- LiveKDE ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/grub.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=centos
[wikipedia]: https://en.wikipedia.org/wiki/CentOS
