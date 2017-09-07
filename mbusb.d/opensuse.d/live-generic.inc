menuentry "openSUSE Tumbleweed Live" {
  bootoptions="isofrom_device=$imgdevpath isofrom_system=$iso_path ramdisk_size=512000 ramdisk_blocksize=4096 splash=silent quiet showopts"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
menuentry "Failsafe --- openSUSE Tumbleweed Live" {
  bootoptions="isofrom_device=$imgdevpath isofrom_system=$iso_path ramdisk_size=512000 ramdisk_blocksize=4096 splash=silent quiet showopts ide=nodma apm=off noresume edd=off powersaved=off nohz=off highres=off processsor.max+cstate=1 nomodeset x11failsafe"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
