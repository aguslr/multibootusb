---
title: Boot-Repair-Disk
homepage: https://sourceforge.net/projects/boot-repair-cd/
download: https://sourceforge.net/projects/boot-repair-cd/files/
cfgdir: boot-repair-disk.d
layout: default
---

# {{ page.title }}

> Boot-Repair-Disk, the 'must-have' rescue CD!
> Here is THE Rescue Disk that you should keep close to your computer!
> runs automatically Boot-Repair rescue tool at start-up;
> also contains the OS-Uninstaller and Boot-Info tools;
> repairs recent (UEFI) computers as well as old PCs
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [loopback.cfg][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[loopback.cfg]: http://www.supergrubdisk.org/wiki/Loopback.cfg
