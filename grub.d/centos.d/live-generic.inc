menuentry "Start CentOS Linux" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rootfstype=auto ro rd.live.image quiet  rhgb rd.luks=0 rd.md=0 rd.dm=0"
  linux (loop)/isolinux/vmlinuz0 $bootoptions
  initrd (loop)/isolinux/initrd0.img
}
menuentry "Start CentOS Linux in basic graphics mode" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rootfstype=auto ro rd.live.image quiet  rhgb rd.luks=0 rd.md=0 rd.dm=0 nomodeset"
  linux (loop)/isolinux/vmlinuz0 $bootoptions
  initrd (loop)/isolinux/initrd0.img
}
menuentry "Test this media & start CentOS Linux" "$isofile" "$cdlabel" {
  isofile="$2"
  cdlabel="$3"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=$cdlabel rootfstype=auto ro rd.live.image quiet  rhgb rd.luks=0 rd.md=0 rd.dm=0 rd.live.check"
  linux (loop)/isolinux/vmlinuz0 $bootoptions
  initrd (loop)/isolinux/initrd0.img
}
