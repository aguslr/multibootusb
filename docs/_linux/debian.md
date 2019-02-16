---
title: Debian
homepage: https://www.debian.org/
download: https://www.debian.org/CD/
cfgdir: debian.d
layout: default
---

# {{ page.title }}

> The Debian Project is an association of individuals who have made common cause
> to create a free operating system. This operating system is called Debian.
> Debian systems currently use the Linux kernel. Linux is a completely free
> piece of software started by Linus Torvalds and supported by thousands of
> programmers worldwide. Of course, the thing that people want is application
> software: programs to help them get what they want to do done, from editing
> documents to running a business to playing games to writing more software.
> Debian comes with over 50,000 packages (precompiled software that is bundled
> up in a nice format for easy installation on your machine) - all of it free.
> It's a bit like a tower. At the base is the kernel. On top of that are all the
> basic tools. Next is all the software that you run on the computer. At the top
> of the tower is Debian -- carefully organizing and fitting everything so it
> all works together.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live ISO[^note1]
- Netboot ISO[^note2]


## Resources

- [#724931 - ISO loopback support for Debian installer - Debian Bug report
logs][issue724931]
- [#866183 - debian-live: loopback.cfg is not working - Debian Bug report
logs][issue866183]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [Official download page
(Netboot)](https://www.debian.org/distrib/netinst#netboot)
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Only Live environment; installer not supported (use Netboot ISO).
[^note2]: Rename Netboot ISO files (e.g. from `mini.iso` to `debian-8.6.0-i386-mini.iso`).


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=debian
[wikipedia]: https://en.wikipedia.org/wiki/Debian
[issue724931]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=724931
[issue866183]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=866183
