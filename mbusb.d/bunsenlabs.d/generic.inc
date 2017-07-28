menuentry "Live" {
  bootoptions="findiso=$iso_path boot=live components quiet splash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "Live (failsafe)" {
  bootoptions="findiso=$iso_path boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
