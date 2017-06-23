---
title: antiX
homepage: http://antix.mepis.org/
download: http://antix.mepis.org/index.php?title=Main_Page#Downloads
cfgdir: antix.d
layout: default
---

# {{ page.title }}

> antiX is a fast, lightweight and easy-to-install Linux live CD distribution
> based on Debian's "Stable" branch for x86 compatible systems. antiX offers
> users the "antiX Magic" in an environment suitable for old computers. The goal
> of antiX is to provide a light, but fully functional and flexible free
> operating system for both newcomers and experienced users of Linux. It should
> run on most computers, ranging from 256 MB old PIII systems with
> pre-configured swap to the latest powerful boxes. 256 MB RAM is recommended
> minimum for antiX. The installer needs minimum 2.7 GB hard disk size. antiX
> can also be used as a fast-booting rescue CD. A special Xfce edition made in
> collaboration with the MEPIS Community called "MX" is also available.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- All ISOs


## Resources

- [Installation Tips - antiX][tips]
- [RMPrepUSB, Easy2Boot and USB booting: Add antiX 15 with persistence to
Easy2Boot][persistence]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=antix
[wikipedia]: https://en.wikipedia.org/wiki/AntiX
[tips]: http://antix.mepis.org/index.php?title=Installation_Tips
[persistence]: https://rmprepusb.blogspot.com.es/2015/10/add-antix-15-with-persistence-to.html
