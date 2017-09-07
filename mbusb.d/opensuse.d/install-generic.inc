menuentry "Installation" {
  bootoptions="install=hd:$iso_path splash=silent showopts"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
menuentry "Upgrade" {
  bootoptions="install=hd:$iso_path splash=silent upgrade=1 showopts"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
menuentry "Rescue System" {
  bootoptions="install=hd:$iso_path splash=silent rescue=1 showopts"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
menuentry "Check Installation Media" {
  bootoptions="install=hd:$iso_path splash=silent mediacheck=1 showopts"
  linux (loop)/boot/$boot_dir/loader/linux $bootoptions
  initrd (loop)/boot/$boot_dir/loader/initrd
}
