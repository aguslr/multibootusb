---
title: CoreOS
homepage: https://coreos.com
download: https://coreos.com/docs/running-coreos/platforms/iso/
cfgdir: coreos.d
layout: default
---

# {{ page.title }}

> Container Linux (formerly CoreOS) is a Linux-based operating system for
> servers. Built from the ground up and designed primarily for the modern data
> centre, Container Linux provides specialist tools for making the system
> secure, reliable and up-to-date. Some of the more interesting features of the
> distribution include reliable updates and patches via FastPatch, a dashboard
> for managing rolling updates via CoreUpdate, a docker for packaging
> applications, as well as support for bare metal and many cloud providers.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [Booting from ISO][bootiso]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=container
[wikipedia]: https://en.wikipedia.org/wiki/Container_Linux_by_CoreOS
[bootiso]: https://coreos.com/os/docs/latest/booting-with-iso.html
