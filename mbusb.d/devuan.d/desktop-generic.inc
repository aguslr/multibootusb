menuentry "devuan-live" {
  bootoptions="findiso=$iso_path boot=live username=devuan"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "devuan-live (load to RAM)" {
  bootoptions="findiso=$iso_path boot=live username=devuan toram"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "devuan-live (failsafe)" {
  bootoptions="findiso=$iso_path boot=live username=devuan noapic noapm nodma nomce nolapic nosmp nomodeset vga=normal"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
