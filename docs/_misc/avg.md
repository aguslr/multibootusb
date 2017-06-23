---
title: AVG Rescue CD
homepage: http://www.avg.com/rescue-cd-business-edition
download: http://www.avg.com/download.prd-arl
cfgdir: avg.d
layout: default
---

# {{ page.title }}

> AVG Rescue CD repairs system crashes and returns your systems to operating at
> full capacity. If malware gets past your security software, you can quickly
> get your PC back up and running smoothly. AVG resellers have been using this
> same solution to recover their customers' infected systems and now it's
> available to your business, free of charge. It's a clean bill of health for
> your system — without the bill.
>
> -- <cite markdown="1">[Official homepage]({{ page.homepage }})</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO (using [MEMDISK][])


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[memdisk]: http://www.syslinux.org/wiki/index.php?title=MEMDISK
