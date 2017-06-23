---
title: Subgraph OS
homepage: https://subgraph.com/
download: https://subgraph.com/sgos/download/
cfgdir: subgraphos.d
layout: default
---

# {{ page.title }}

> Subgraph OS is a Debian-based Linux distribution which provides several
> security, anonymous web browsing and hardening features. Subgraph OS uses a
> hardened Linux kernel, application firewall to block specific executables from
> accessing the network and forces all Internet traffic through the Tor network.
> The distribution's file manager features tools to remove meta-data from files
> and integrates with the OnionShare file sharing application. The Icedove
> e-mail client is set up to automatically work with Enigmail for encrypting
> e-mails.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=subgraph
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
[wikipedia]: https://en.wikipedia.org/wiki/Subgraph_OS
