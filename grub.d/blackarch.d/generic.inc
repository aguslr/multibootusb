menuentry "Boot BlackArch Linux" {
  bootoptions="img_dev=$imgdevpath img_loop=$iso_path earlymodules=loop archisodevice=/dev/loop0 archisobasedir=blackarch archisolabel=$cd_label"
  linux (loop)/blackarch/boot/$boot_dir/vmlinuz $bootoptions
  initrd (loop)/blackarch/boot/$boot_dir/archiso.img
}
