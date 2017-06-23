---
title: Qubes OS
homepage: https://www.qubes-os.org/
download: https://www.qubes-os.org/downloads/
cfgdir: qubesos.d
layout: default
---

# {{ page.title }}

> Qubes OS is a security-oriented, Fedora-based desktop Linux distribution whose
> main concept is "security by isolation" by using domains implemented as
> lightweight Xen virtual machines. It attempts to combine two contradictory
> goals: how to make the isolation between domains as strong as possible, mainly
> due to clever architecture that minimises the amount of trusted code, and how
> to make this isolation as seamless and easy as possible.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [How to multiboot xen with grub2 on Ubuntu][xengrub]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=qubes
[wikipedia]: https://en.wikipedia.org/wiki/Qubes_OS
[xengrub]: https://lists.gnu.org/archive/html/help-grub/2011-03/msg00009.html
