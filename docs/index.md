---
layout: default
---

# MultiBoot USB

This is a project that contains a collection of [GRUB][] files and scripts that will allow you to create a pendrive capable of booting a total of [{{ site.android.size | plus: site.linux.size | plus: site.unix.size | plus: site.misc.size }} supported utilities][isos].

<video width="640" height="480" controls="controls" loop="loop" title="Demo">
  <source src="{{ "/assets/vid/demo.webm" | relative_url }}" type="video/webm" />
  <source src="{{ "/assets/vid/demo.mp4" | relative_url }}" type="video/mp4" />
  <img src="{{ "/assets/img/demo.gif" | relative_url }}" title="Your browser does not support the video tag." alt="Demo" />
</video>


## Documentation

- [List of supported files][isos]
- [Preparing the multiboot USB][install]
- [Contributing to the project][contrib]
- [Adding support for an ISO][howto]


## Similar projects

- [Easy2Boot][]
- [GLIM][]
- [grub-iso-boot][]
- [grub-iso-multiboot][]
- [GRUB2-filemanager][]
- [LiveUSB][]
- [MultiBootUSB][]
- [MultiPass-USB][]
- [SARDU][]
- [SMI][]
- [SystemImageKit][]
- [XBOOT][]
- [YUMI][]


[contrib]: contrib.html
[easy2boot]: http://www.easy2boot.com/
[glim]: https://github.com/thias/glim
[grub-iso-boot]: https://github.com/Jimmy-Z/grub-iso-boot
[grub-iso-multiboot]: https://github.com/mpolitzer/grub-iso-multiboot
[grub2-filemanager]: https://github.com/a1ive/grub2-filemanager
[grub]: https://www.gnu.org/software/grub/
[howto]: howto.html
[install]: install.html
[isos]: isos.html
[liveusb]: http://liveusb.info/dotclear/
[multibootusb]: http://multibootusb.org/
[multipass-usb]: https://github.com/Thermionix/multipass-usb
[sardu]: http://www.sarducd.it/
[smi]: https://github.com/kilbith/smi
[systemimagekit]: https://github.com/probonopd/SystemImageKit
[xboot]: https://sites.google.com/site/shamurxboot/
[yumi]: https://www.pendrivelinux.com/yumi-multiboot-usb-creator/
