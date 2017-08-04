---
title: Rockstor
homepage: http://rockstor.com/
download: http://rockstor.com/download.html
cfgdir: rockstor.d
layout: default
---

# {{ page.title }}

> Rockstor is a specialist CentOS-based Linux distribution designed for Network
> Attached Storage (NAS) and private cloud storage solutions. It is based on
> popular open-source technologies, such as the Btrfs file system and Docker for
> automating the deployment of applications inside software containers. In
> addition to standard NAS features like file sharing via NFS, Samba, SFTP and
> AFP, advanced features such as online volume management, CoW Snapshots,
> asynchronous replication, compression, and bitrot protection are also
> supported. Rockstor provides additional applications, including ownCloud,
> Syncthing, OpenVPN and Plex. These applications (called "Rock-ons") are
> powered by a Docker-based application hosting framework. The Rockstor user
> interface, written in JavaScript, makes it simple to manage the server from
> within a web browser.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- Standard ISO


## Resources

- [Anaconda Boot Options — Anaconda documentation][bootopt]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=rockstor
[bootopt]: https://rhinstaller.github.io/anaconda/boot-options.html#installation-source
