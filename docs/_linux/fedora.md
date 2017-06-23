---
title: Fedora
homepage: https://getfedora.org/
download: https://getfedora.org/
cfgdir: fedora.d
layout: default
---

# {{ page.title }}

> Fedora (formerly Fedora Core) is a Linux distribution developed by the
> community-supported Fedora Project and owned by Red Hat. Fedora contains
> software distributed under a free and open-source license and aims to be on
> the leading edge of such technologies. Fedora has a reputation for focusing on
> innovation, integrating new technologies early on and working closely with
> upstream Linux communities. The default desktop in Fedora is the GNOME desktop
> environment and the default interface is the GNOME Shell. Other desktop
> environments, including KDE, Xfce, LXDE, MATE and Cinnamon, are available.
> Fedora Project also distributes custom variations of Fedora called Fedora
> spins. These are built with specific sets of software packages, offering
> alternative desktop environments or targeting specific interests such as
> gaming, security, design, scientific computing and robotics.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


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
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=fedora
[wikipedia]: https://en.wikipedia.org/wiki/Fedora_(operating_system)
