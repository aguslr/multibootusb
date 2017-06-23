---
title: RancherOS
homepage: http://rancher.com/rancher-os/
download: https://github.com/rancher/os/releases
cfgdir: rancheros.d
layout: default
---

# {{ page.title }}

> RancherOS is a tiny Linux distribution that runs the entire operating system
> as Docker containers. This includes system services, such as udev and rsyslog.
> RancherOS includes only the bare minimum amount of software needed to run
> Docker. This keeps the binary download of RancherOS very small. Everything
> else can be pulled in dynamically through Docker.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=rancheros
[wikipedia]: https://en.wikipedia.org/wiki/RancherOS
[bootiso]: https://docs.rancher.com/os/running-rancheros/workstation/boot-from-iso/
