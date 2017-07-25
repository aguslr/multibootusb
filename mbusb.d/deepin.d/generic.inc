menuentry "Install Deepin" {
  bootoptions="findiso=$iso_path boot=live components quiet splash union=overlay livecd-installer"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.lz
}
menuentry "Deepin failsafe" {
  bootoptions="findiso=$iso_path boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal union=overlay"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.lz
}
