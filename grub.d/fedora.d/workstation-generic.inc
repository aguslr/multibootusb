menuentry "Start Fedora Workstation Live" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rd.live.image quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Start Fedora Workstation Live in basic graphics mode" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rd.live.image nomodeset quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Test this media & start Fedora Workstation Live" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rd.live.image rd.live.check quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Run a memory test" {
  bootoptions=""
  linux16 (loop)/isolinux/memtest $bootoptions
}
