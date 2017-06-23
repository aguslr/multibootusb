---
title: Wifislax
homepage: http://www.wifislax.com/
download: http://www.wifislax.com/category/download/
cfgdir: wifislax.d
layout: default
---

# {{ page.title }}

> Wifislax is a Slackware-based live CD containing a variety of security and
> forensics tools. The distribution's main claim to fame is the integration of
> various unofficial network drivers into the Linux kernel, thus providing
> out-of-the-box support for a large number of wired and wireless network cards.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard 64 bits ISO


## Resources

- [slackware:liveslak - SlackDocs][liveparams]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=wifislax
[liveparams]: https://docs.slackware.com/slackware:liveslak#boot_parameters_explained
