---
title: SpinRite
homepage: https://www.grc.com/sr/spinrite.htm
download: https://www.grc.com/cs/prepurch.htm
cfgdir: spinrite.d
layout: default
---

# {{ page.title }}

> SpinRite is a computer program for scanning magnetic data storage devices such
> as hard disks, recovering data from them and refreshing their surfaces. The
> first version was released in 1987 by Steve Gibson. Version 6.0, still current
> as of June 2017, was released in 2004. SpinRite is run from a bootable medium
> (such as a CD, DVD or USB memory stick) on a PC-compatible computer, allowing
> it to scan a computer's hard drive and file system.
>
> -- <cite markdown="1">[Wikipedia][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Resources

- [Need a way to run Spinrite 6 via GRUB2. Can do either ISO or image file][spinritegrub]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[wikipedia]: https://en.wikipedia.org/wiki/SpinRite
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
[spinritegrub]: https://www.linuxquestions.org/questions/linux-newbie-8/need-a-way-to-run-spinrite-6-via-grub2-can-do-either-iso-or-image-file-4175546458/
