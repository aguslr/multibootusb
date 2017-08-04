---
title: Oracle Linux
homepage: https://www.oracle.com/linux/
download: https://edelivery.oracle.com/linux
cfgdir: oracle.d
layout: default
---

# {{ page.title }}

> Oracle Linux is an enterprise-class Linux distribution supported by Oracle and
> built from source packages for Red Hat Enterprise Linux (RHEL). Some of the
> special features of Oracle Linux include a custom-build and rigorously-tested
> Linux kernel called "Oracle Unbreakable Kernel", tight integration with
> Oracle's hardware and software products including most database applications,
> and "zero downtime patching" - a feature that enables administrators to update
> the kernel without a reboot.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO[^note1]


## Resources

- [Anaconda Boot Options — Anaconda documentation][bootopt]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


## Notes

[^note1]: Rename ISO files (e.g. from `V834394-01.iso` to `oracle-linux-7.3-x86_64-dvd.iso`).


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=oracle
[bootopt]: https://rhinstaller.github.io/anaconda/boot-options.html#installation-source
[wikipedia]: https://en.wikipedia.org/wiki/Oracle_Linux
