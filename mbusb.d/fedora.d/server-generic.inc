menuentry "Install Fedora Server" {
  bootoptions="iso-scan/filename=$iso_path inst.stage2=hd:LABEL=$cd_label quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Test this media & install Fedora Server" {
  bootoptions="iso-scan/filename=$iso_path inst.stage2=hd:LABEL=$cd_label rd.live.check quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Install Fedora in basic graphics mode" {
  bootoptions="iso-scan/filename=$iso_path inst.stage2=hd:LABEL=$cd_label nomodeset quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Rescue a Fedora system" {
  bootoptions="iso-scan/filename=$iso_path inst.stage2=hd:LABEL=$cd_label rescue quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Run a memory test" {
  bootoptions=""
  linux16 (loop)/isolinux/memtest $bootoptions
}
