menuentry "Install Oracle Linux" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path quiet"
  linux (loop)/images/pxeboot/vmlinuz $bootoptions
  initrd (loop)/images/pxeboot/initrd.img
}
menuentry "Test this media & install Oracle Linux" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path rd.live.check quiet"
  linux (loop)/images/pxeboot/vmlinuz $bootoptions
  initrd (loop)/images/pxeboot/initrd.img
}
menuentry "Install Oracle Linux in basic graphics mode" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path xdriver=vesa nomodeset quiet"
  linux (loop)/images/pxeboot/vmlinuz $bootoptions
  initrd (loop)/images/pxeboot/initrd.img
}
menuentry "Rescue a Oracle Linux system" {
  bootoptions="inst.repo=hd:UUID=$rootuuid:$iso_path rescue quiet"
  linux (loop)/images/pxeboot/vmlinuz $bootoptions
  initrd (loop)/images/pxeboot/initrd.img
}
