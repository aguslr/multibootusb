menuentry "Pentoo Defaults (verify)" "$isofile" {
  isofile="$2"
  bootoptions="isoboot=$isofile root=/dev/ram0 init=/linuxrc nox nodhcp aufs max_loop=256 dokeymap looptype=squashfs loop=/image.squashfs cdroot video=uvesafb:mtrr:3,ywrap,1024x768-16 usbcore.autosuspend=1 console=tty0 net.ifnames=0 verify"
  linux (loop)/isolinux/pentoo $bootoptions
  initrd (loop)/isolinux/pentoo.igz
}
menuentry "Pentoo Defaults (no verify)" "$isofile" {
  isofile="$2"
  bootoptions="isoboot=$isofile root=/dev/ram0 init=/linuxrc nox nodhcp aufs max_loop=256 dokeymap looptype=squashfs loop=/image.squashfs cdroot video=uvesafb:mtrr:3,ywrap,1024x768-16 usbcore.autosuspend=1 console=tty0 net.ifnames=0"
  linux (loop)/isolinux/pentoo $bootoptions
  initrd (loop)/isolinux/pentoo.igz
}
menuentry "Pentoo (no binary drivers)" "$isofile" {
  isofile="$2"
  bootoptions="isoboot=$isofile root=/dev/ram0 init=/linuxrc nox nodhcp nobindrivers aufs max_loop=256 dokeymap looptype=squashfs loop=/image.squashfs cdroot video=uvesafb:mtrr:3,ywrap,1024x768-16 usbcore.autosuspend=1 console=tty0 net.ifnames=0"
  linux (loop)/isolinux/pentoo $bootoptions
  initrd (loop)/isolinux/pentoo.igz
}
menuentry "Pentoo-nofb" "$isofile" {
  isofile="$2"
  bootoptions="isoboot=$isofile root=/dev/ram0 init=/linuxrc nox nodhcp aufs max_loop=256 dokeymap looptype=squashfs loop=/image.squashfs cdroot video=uvesafb:off usbcore.autosuspend=1 console=tty0 net.ifnames=0"
  linux (loop)/isolinux/pentoo $bootoptions
  initrd (loop)/isolinux/pentoo.igz
}
menuentry "Pentoo-nofb (no binary drivers)" "$isofile" {
  isofile="$2"
  bootoptions="isoboot=$isofile root=/dev/ram0 init=/linuxrc nox nodhcp nobindrivers aufs max_loop=256 dokeymap looptype=squashfs loop=/image.squashfs cdroot video=uvesafb:off usbcore.autosuspend=1 console=tty0 net.ifnames=0"
  linux (loop)/isolinux/pentoo $bootoptions
  initrd (loop)/isolinux/pentoo.igz
}
menuentry "Memtest86" {
  bootoptions=""
  linux16 (loop)/isolinux/memtest86 $bootoptions
}
menuentry "Hardware Detection Toolkit" {
  bootoptions=""
  linux16 (loop)/isolinux/hdt.c32 $bootoptions
}
