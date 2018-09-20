---
title: Android-x86
homepage: http://www.android-x86.org/
download: http://www.android-x86.org/download
cfgdir: android.d
layout: default
---

# {{ page.title }}

> Android-x86 is an unofficial initiative to port Google's Android mobile
> operating system to run on devices powered by Intel and AMD x86 processors,
> rather than RISC-based ARM chips. The project began as a series of patches to
> the Android source code to enable Android to run on various netbooks and
> ultra-mobile PCs, particularly the ASUS Eee PC.
>
> -- <cite markdown="1">[DistroWatch][]</cite>


{% if page.cfgdir %}
## Configuration

- [Project's files for {{ page.title }}][config]
{% endif %}


## Supported releases

- 6.0+ ISO
- CyanogenMod ISO


## References

- [android-x86 / bootable/newinstaller / Commit (24dd71)][bootable]


## Links

- [Official homepage]({{ page.homepage }})
- [Official download page]({{ page.download }})
- [{{ page.title }} at DistroWatch][distrowatch]
- [{{ page.title }} at Wikipedia][wikipedia]


[config]: {{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: page.cfgdir }}
[distrowatch]: https://distrowatch.com/table.php?distribution=androidx86
[wikipedia]: https://en.wikipedia.org/wiki/Android-x86
[bootable]: https://sourceforge.net/p/android-x86/bootable_newinstaller/ci/24dd719b53c25d0a3825d8bae29ce43cfa305c77/
