---
title: Tails
homepage: https://tails.boum.org/
download: https://tails.boum.org/install/download/
cfgdir: tails.d
layout: default
---

# {{ page.title }}

> The Amnesic Incognito Live System (Tails) is a Debian-based live CD/USB with
> the goal of providing complete Internet anonymity for the user. The product
> ships with several Internet applications, including web browser, IRC client,
> mail client and instant messenger, all pre-configured with security in mind
> and with all traffic anonymised. To achieve this, Incognito uses the Tor
> network to make Internet traffic very hard to trace.
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
[distrowatch]: https://distrowatch.com/table.php?distribution=tails
[wikipedia]: https://en.wikipedia.org/wiki/TAILS
