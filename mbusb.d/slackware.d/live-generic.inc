menuentry "Start SLACKWARE Live" {
  bootoptions="livemedia=/dev/disk/by-uuid/$rootuuid:$iso_path load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 kbd=us tz=localtime locale=us_EN.utf8"
  linux (loop)/boot/generic $bootoptions
  initrd (loop)/boot/initrd.img
}
