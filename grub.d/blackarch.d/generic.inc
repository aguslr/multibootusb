menuentry "Boot BlackArch Linux" "$isofile" "$cdlabel" "$bootdir" {
  isofile="$2"
  cdlabel="$3"
  bootdir="$4"
  bootoptions="img_dev=$imgdevpath img_loop=$isofile earlymodules=loop archisodevice=/dev/loop0 archisobasedir=blackarch archisolabel=$cdlabel"
  linux (loop)/blackarch/boot/$bootdir/vmlinuz $bootoptions
  initrd (loop)/blackarch/boot/$bootdir/archiso.img
}
