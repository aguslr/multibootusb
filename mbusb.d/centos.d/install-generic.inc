menuentry "Install CentOS Linux" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Test this media & install CentOS Linux" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path rd.live.check quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Install CentOS Linux in basic graphics mode" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path xdriver=vesa nomodeset quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Rescue a CentOS Linux system" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path rescue quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
