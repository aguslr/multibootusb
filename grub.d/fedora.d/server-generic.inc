menuentry "Install Fedora Server" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile inst.stage2=hd:LABEL=$cdlabel quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Test this media & install Fedora Server" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile inst.stage2=hd:LABEL=$cdlabel quiet"
  linux (loop)/isolinux/vmlinuz $bootoptions
  initrd (loop)/isolinux/initrd.img
}
menuentry "Run a memory test" {
  bootoptions=""
  linux16 (loop)/isolinux/memtest $bootoptions
}
