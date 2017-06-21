menuentry "Boot Apricity OS live medium" {
  bootoptions="img_dev=$imgdevpath img_loop=$iso_path earlymodules=loop archisobasedir=arch archisolabel=$cd_label"
  linux (loop)/arch/boot/$boot_dir/vmlinuz $bootoptions
  initrd (loop)/arch/boot/$boot_dir/archiso.img
}
