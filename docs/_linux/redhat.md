---
title: Red Hat Enterprise Linux
homepage: https://www.redhat.com/
download: https://access.redhat.com/downloads/
cfgdir: rhel.d
layout: default
---

# {{ page.title }}

> Red Hat Enterprise Linux (RHEL) is a Linux distribution developed by Red Hat
> and targeted toward the commercial market. Red Hat Enterprise Linux is
> released in server editions for x86, x86_64, Itanium, PowerPC and IBM System z
> architectures, and desktop editions for x86 and x86_64 processors. All of Red
> Hat's official support and training and the Red Hat Certification Program
> centres around the Red Hat Enterprise Linux platform. Red Hat uses strict
> trademark rules to restrict free re-distribution of its officially supported
> versions of Red Hat Enterprise Linux, but still freely provides its source
> code. Third-party derivatives can be built and redistributed by stripping away
> non-free components.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Boot and DVD ISOs


## Resources

- [Anaconda Boot Options — Anaconda documentation][bootopt]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=redhat
[bootopt]: https://rhinstaller.github.io/anaconda/boot-options.html#installation-source
[wikipedia]: https://en.wikipedia.org/wiki/RHEL
