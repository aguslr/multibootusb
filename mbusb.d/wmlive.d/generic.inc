menuentry "Live Session" {
  bootoptions="findiso=$iso_path boot=live config locales=en_US.UTF-8 keyboard-layouts=us persistence persistence-encryption=luks noprompt noeject vga=791"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
