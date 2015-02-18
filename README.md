# Multiboot USB

## About

This repository stores the files needed to create a pendrive capable of booting
different ISO files using GRUB2.

## Getting the files

### Using Git

If we have Git installed on the system, we can get the files directly from the
repository and then use the `install.sh` script:

```sh
git clone git://github.com/aguslr/multiboot.git
```

After this, every time we want to update the files we do:

```sh
cd multiboot && git pull
```

### Without Git

If Git is not installed, we can still get the files as long as we have a basic Unix environment available:

```sh
wget https://github.com/aguslr/multiboot/tarball/master -O - | tar -xzv --strip-components 1 --exclude={README.md}
```

## References

- [Thermionix/multipass-usb](https://github.com/Thermionix/multipass-usb)
- [Transform a USB stick into a boot device packing multiple Linux distros](http://www.circuidipity.com/multi-boot-usb.html)
- [MultiBoot USB with Grub2 (boot directly from iso files)](http://www.panticz.de/MultiBootUSB)
- [Grub2 Loop Boot Solution](http://forums.kali.org/showthread.php?1025-Grub2-Loop-Boot-Solution)
