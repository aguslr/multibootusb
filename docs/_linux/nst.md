---
title: Network Security Toolkit
homepage: https://www.networksecuritytoolkit.org/
download: https://sourceforge.net/projects/nst/files/
cfgdir: nst.d
layout: default
---

# {{ page.title }}

> Network Security Toolkit (NST) is a bootable live CD based on the Fedora
> distribution. The toolkit was designed to provide easy access to best-of-breed
> open source network security applications and should run on most x86
> platforms. The main intent of developing this toolkit was to provide the
> network security administrator with a comprehensive set of open source network
> security tools. What we find rather fascinating with NST is that we can
> transform most x86 systems (Pentium II and above) into a system designed for
> network traffic analysis, intrusion detection, network packet generation,
> wireless network monitoring, a virtual system service server, or a
> sophisticated network/host scanner.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: http://distrowatch.com/table.php?distribution=nst
[wikipedia]: https://en.wikipedia.org/wiki/Network_Security_Toolkit
