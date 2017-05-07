menuentry "gentoo" {
  bootoptions="isoboot=$iso_path root=/dev/ram0 init=/linuxrc dokeymap looptype=squashfs loop=/image.squashfs cdroot vga=791"
  linux (loop)/isolinux/gentoo $bootoptions
  initrd (loop)/isolinux/gentoo.igz
}
menuentry "gentoo-nofb" {
  bootoptions="isoboot=$iso_path root=/dev/ram0 init=/linuxrc dokeymap looptype=squashfs loop=/image.squashfs cdroot"
  linux (loop)/isolinux/gentoo $bootoptions
  initrd (loop)/isolinux/gentoo.igz
}
