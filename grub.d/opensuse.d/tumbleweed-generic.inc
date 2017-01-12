menuentry "openSUSE Tumbleweed Live" "$isofile" "$bootdir" {
  isofile="$2"
  bootdir="$3"
  bootoptions="isofrom_device=$imgdevpath isofrom_system=$isofile ramdisk_size=512000 ramdisk_blocksize=4096 splash=silent quiet showopts"
  linux (loop)/boot/$bootdir/loader/linux $bootoptions
  initrd (loop)/boot/$bootdir/loader/initrd
}
menuentry "Failsafe --- openSUSE Tumbleweed Live" "$isofile" "$bootdir" {
  isofile="$2"
  bootdir="$3"
  bootoptions="isofrom_device=$imgdevpath isofrom_system=$isofile ramdisk_size=512000 ramdisk_blocksize=4096 splash=silent quiet showopts ide=nodma apm=off noresume edd=off powersaved=off nohz=off highres=off processsor.max+cstate=1 nomodeset x11failsafe"
  linux (loop)/boot/$bootdir/loader/linux $bootoptions
  initrd (loop)/boot/$bootdir/loader/initrd
}
