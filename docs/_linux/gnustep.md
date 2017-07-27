---
title: GNUstep Live CD
homepage: http://livecd.gnustep.org/
download: http://livecd.gnustep.org/
cfgdir: gnustep.d
layout: default
---

# {{ page.title }}

> GNUstep live CD is a Debian-based Linux distribution containing GNUstep,
> network tools, multimedia software and games. GNUstep is an implementation of
> the OPENSTEP and Cocoa frameworks.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard 64 bits ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=gnustep
