menuentry "Start Manjaro Linux" "$isofile" "$cdlabel" "$bootdir" {
  isofile="$2"
  cdlabel="$3"
  bootdir="$4"
  bootoptions="img_dev=$imgdevpath img_loop=$isofile earlymodules=loop misobasedir=manjaro misolabel=$cdlabel nouveau.modeset=1 i915.modeset=1 radeon.modeset=1 logo.nologo overlay=free quiet splash showopts"
  linux (loop)/manjaro/boot/$bootdir/manjaro $bootoptions
  initrd (loop)/manjaro/boot/$bootdir/manjaro.img
}
menuentry "Start (non-free drivers)" "$isofile" "$cdlabel" "$bootdir" {
  isofile="$2"
  cdlabel="$3"
  bootdir="$4"
  bootoptions="img_dev=$imgdevpath img_loop=$isofile earlymodules=loop misobasedir=manjaro misolabel=$cdlabel nouveau.modeset=0 i915.modeset=1 radeon.modeset=0 nonfree=yes logo.nologo overlay=nonfree quiet splash showopts"
  linux (loop)/manjaro/boot/$bootdir/manjaro $bootoptions
  initrd (loop)/manjaro/boot/$bootdir/manjaro.img
}
