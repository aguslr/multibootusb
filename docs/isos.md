---
title: List of supported files
layout: default
---

# {{ page.title }}

* auto-gen TOC:
{:toc}

These are [ISO][] or [kernel][] utilities that can either boot a [LiveCD][] or allow for the installation of the OS onto a hard drive.

<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="cfg-icon" viewBox="0 0 24 24">
    <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>
  </symbol>
</svg>
<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="dl-icon" viewBox="0 0 24 24">
    <path d="M3 17v3a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-3"/>
    <polyline points="8 12 12 16 16 12"/>
    <line x1="12" y1="2" x2="12" y2="16"/>
  </symbol>
</svg>
<svg style="display: none;" xmlns="http://www.w3.org/2000/svg">
  <symbol id="home-icon" viewBox="0 0 24 24">
    <circle cx="12" cy="12" r="10"/>
    <line x1="2" y1="12" x2="22" y2="12"/>
    <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
  </symbol>
</svg>


## Android

The following table cotains a list of supported [Android][]-based operating systems ({{ site.android.size }} items):

{% if site.android %}
<table class="item-list">
  <tbody>
  {% for item in site.android %}
  <tr>
  <td markdown="1">
  [{{ item.title }}]({{ item.url | relative_url }})
  </td>
  <td markdown="1">
  {% if item.download %}<a href="{{ item.download }}" title="Download"><svg class="icon"><use xlink:href="#dl-icon"/></svg></a>{% endif %}
  {% if item.homepage %}<a href="{{ item.homepage }}" title="Homepage"><svg class="icon"><use xlink:href="#home-icon"/></svg></a>{% endif %}
  {% if item.cfgdir %}<a href="{{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: item.cfgdir }}" title="Configuration"><svg class="icon"><use xlink:href="#cfg-icon"/></svg></a>{% endif %}
  </td>
  </tr>
  {% endfor %}
  </tbody>
</table>
{% endif %}


## Linux

This table cotains a list of supported [Linux][]-based [distributions][distro] ({{ site.linux.size }} items):

{% if site.linux %}
<table class="item-list">
  <tbody>
  {% for item in site.linux %}
  <tr>
  <td markdown="1">
  [{{ item.title }}]({{ item.url | relative_url }})
  </td>
  <td markdown="1">
  {% if item.download %}<a href="{{ item.download }}" title="Download"><svg class="icon"><use xlink:href="#dl-icon"/></svg></a>{% endif %}
  {% if item.homepage %}<a href="{{ item.homepage }}" title="Homepage"><svg class="icon"><use xlink:href="#home-icon"/></svg></a>{% endif %}
  {% if item.cfgdir %}<a href="{{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: item.cfgdir }}" title="Configuration"><svg class="icon"><use xlink:href="#cfg-icon"/></svg></a>{% endif %}
  </td>
  </tr>
  {% endfor %}
  </tbody>
</table>
{% endif %}


## Unix

This table contains a list of supported [Unix-like][] OS's ({{ site.unix.size }} items):

{% if site.unix %}
<table class="item-list">
  <tbody>
  {% for item in site.unix %}
  <tr>
  <td markdown="1">
  [{{ item.title }}]({{ item.url | relative_url }})
  </td>
  <td markdown="1">
  {% if item.download %}<a href="{{ item.download }}" title="Download"><svg class="icon"><use xlink:href="#dl-icon"/></svg></a>{% endif %}
  {% if item.homepage %}<a href="{{ item.homepage }}" title="Homepage"><svg class="icon"><use xlink:href="#home-icon"/></svg></a>{% endif %}
  {% if item.cfgdir %}<a href="{{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: item.cfgdir }}" title="Configuration"><svg class="icon"><use xlink:href="#cfg-icon"/></svg></a>{% endif %}
  </td>
  </tr>
  {% endfor %}
  </tbody>
</table>
{% endif %}


## Misc

Lastly, this table contains a list of miscellaneous utilities ({{ site.misc.size }} items):

{% if site.misc %}
<table class="item-list">
  <tbody>
  {% for item in site.misc %}
  <tr>
  <td markdown="1">
  [{{ item.title }}]({{ item.url | relative_url }})
  </td>
  <td markdown="1">
  {% if item.download %}<a href="{{ item.download }}" title="Download"><svg class="icon"><use xlink:href="#dl-icon"/></svg></a>{% endif %}
  {% if item.homepage %}<a href="{{ item.homepage }}" title="Homepage"><svg class="icon"><use xlink:href="#home-icon"/></svg></a>{% endif %}
  {% if item.cfgdir %}<a href="{{ site.github.repository_url | append: "/tree/master/mbusb.d/" | append: item.cfgdir }}" title="Configuration"><svg class="icon"><use xlink:href="#cfg-icon"/></svg></a>{% endif %}
  </td>
  </tr>
  {% endfor %}
  </tbody>
</table>
{% endif %}


[android]: https://en.wikipedia.org/wiki/Android_(operating_system)
[distro]: https://en.wikipedia.org/wiki/Linux_distribution
[iso]: https://en.wikipedia.org/wiki/ISO_image
[kernel]: https://en.wikipedia.org/wiki/Kernel_(operating_system)
[linux]: https://en.wikipedia.org/wiki/Linux
[livecd]: https://en.wikipedia.org/wiki/Live_CD
[unix-like]: https://en.wikipedia.org/wiki/Unix-like
