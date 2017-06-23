---
title: netboot.xyz
homepage: https://netboot.xyz/
download: https://netboot.xyz/
cfgdir: netboot.xyz.d
layout: default
---

# {{ page.title }}

> netboot.xyz is a way to select various operating system installers or
> utilities from one place within the BIOS without the need of having to go
> retrieve the media to run the tool. iPXE is used to provide a user friendly
> menu from within the BIOS that lets you easily choose the operating system you
> want along with any specific types of versions or bootable flags.
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
