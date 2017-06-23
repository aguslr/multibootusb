---
title: PCLinuxOS
homepage: http://www.pclinuxos.com/
download: http://www.pclinuxos.com/get-pclinuxos/
cfgdir: pclinuxos.d
layout: default
---

# {{ page.title }}

> PCLinuxOS is a user-friendly Linux distribution with out-of-the-box support
> for many popular graphics and sound cards, as well as other peripheral
> devices. The bootable live DVD provides an easy-to-use graphical installer and
> the distribution sports a wide range of popular applications for the typical
> desktop user, including browser plugins and full multimedia playback. The
> intuitive system configuration tools include Synaptic for package management,
> Addlocale to add support to many languages and Mylivecd to create a customised
> live CD.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- KDE Desktop ISO
- Mate Desktop ISO


## Resources

- [How to create a USB which boots multiple .iso files using Grub2 - Linux Mint Community][howto]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=pclinuxos
[wikipedia]: https://en.wikipedia.org/wiki/PCLinuxOS
[howto]: https://community.linuxmint.com/tutorial/view/1846
