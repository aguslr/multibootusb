---
title: Arch-Anywhere
homepage: https://arch-anywhere.org/
download: https://arch-anywhere.org/download/
cfgdir: arch-anywhere.d
layout: default
---

# {{ page.title }}

> The Arch Anywhere ISO contains an automated install script giving you the
> ability to install a fully custom Arch Linux system in minutes. Write the Arch
> Anywhere ISO to a CD or USB, boot it up from your computer or VirtualBox, and
> type 'arch-anywhere'. This will invoke the built-in dialog installer allowing
> you to install Arch Linux with a simple menu system.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Dual ISO


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})

[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
