---
title: Anarchy-Linux
homepage: https://anarchy-linux.org/
download: https://anarchy-linux.org/download/
cfgdir: anarchy-linux.d
layout: default
---

# {{ page.title }}

> Anarchy Linux is a distribution aimed at bringing the Linux revolution to the
> world. We believe that Linux is the way of the future for desktop computing and
> provide you with a platform to install a custom Arch based operating system
> just the way you like. Anarchy Linux is intended for both novice and advanced
> users alike. Simply write the Anarchy Linux ISO to a CD or USB and boot from
> your computer or VirtualBox.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Live GUI
- Minimal CLI


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})

[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
