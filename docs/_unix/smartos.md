---
title: SmartOS
homepage: https://smartos.org/
download: https://wiki.smartos.org/display/DOC/Download+SmartOS
cfgdir: smartos.d
layout: default
---

# {{ page.title }}

> SmartOS is an open-source UNIX-like operating system based on illumos, a
> community fork of OpenSolaris. It features four technologies - ZFS (a combined
> file system and logical volume manager), DTrace (a dynamic tracing framework
> for troubleshooting kernel and application problems), Zones (a lightweight
> virtualisation solution) and KVM (a full virtualisation solution for running a
> variety of guest operating systems, including Linux, Windows, BSD and Plan9).
> SmartOS is designed to be particularly suitable for building clouds and
> generating appliances.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [Booting SmartOS from GRUB2 -  SmartOS Wiki][smartosboot]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=smartos
[smartosboot]: https://wiki.smartos.org/display/DOC/Booting+SmartOS+from+GRUB2
[wikipedia]: https://en.wikipedia.org/wiki/SmartOS
