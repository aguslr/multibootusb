---
title: Slackware Linux
homepage: http://www.slackware.com/
download: http://www.slackware.com/getslack/
cfgdir: slackware.d
layout: default
---

# {{ page.title }}

> The Official Release of Slackware Linux by Patrick Volkerding is an advanced
> Linux operating system, designed with the twin goals of ease of use and
> stability as top priorities. Including the latest popular software while
> retaining a sense of tradition, providing simplicity and ease of use alongside
> flexibility and power, Slackware brings the best of all worlds to the table.
> Originally developed by Linus Torvalds in 1991, the UNIX-like Linux operating
> system now benefits from the contributions of millions of users and developers
> around the world. Slackware Linux provides new and experienced users alike
> with a fully-featured system, equipped to serve in any capacity from desktop
> workstation to machine-room server. Web, ftp, and email servers are ready to
> go out of the box, as are a wide selection of popular desktop environments. A
> full range of development tools, editors, and current libraries is included
> for users who wish to develop or compile additional software.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Install ISO
- Live ISO


## Resources

- [howtos:slackware_admin:booting_install_from_hdd - SlackDocs][installfromiso]
- [slackware:liveslak - SlackDocs][liveparams]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=slackware
[wikipedia]: https://en.wikipedia.org/wiki/Slackware
[installfromiso]: https://docs.slackware.com/howtos:slackware_admin:booting_install_from_hdd#boot_iso_with_grub2
[liveparams]: https://docs.slackware.com/slackware:liveslak#boot_parameters_explained
