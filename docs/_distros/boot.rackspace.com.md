---
title: boot.rackspace.com
homepage: http://boot.rackspace.com/
download: http://boot.rackspace.com/
cfgdir: boot.rackspace.com.d
layout: default
---

# {{ page.title }}

> boot.rackspace.com is a collection of iPXE scripts that allow you to rapidly
> network boot Operating Systems, Utilities and other tools very easily. It
> allows you the flexibility of booting installations without having to go track
> down and download installation media. It's especially useful for remote access
> environments when you don't want to utilize remote attach CD in a Dell DRAC,
> HP iLO or some other type of remote tool. It's especially awesome for
> bootstrapping your own custom installation on a Cloud Server!
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])
- Standard kernel


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
