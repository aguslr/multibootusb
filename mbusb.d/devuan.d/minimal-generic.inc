menuentry "Devuan Live Minimal (std)" {
  bootoptions="findiso=$iso_path boot=live union=aufs vga=auto"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd_devuan_micro.img
}
menuentry "Devuan Live Minimal (access)" {
  bootoptions="findiso=$iso_path boot=live 4 union=aufs vga=normal"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd_devuan_micro.img
}
menuentry "Devuan Live Minimal (std-toram)" {
  bootoptions="findiso=$iso_path boot=live union=aufs vga=auto toram"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd_devuan_micro.img
}
menuentry "Devuan Live Minimal (access-toram)" {
  bootoptions="findiso=$iso_path boot=live 4 union=aufs vga=normal toram"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd_devuan_micro.img
}
menuentry "Devuan Live Minimal (no probe)" {
  bootoptions="findiso=$iso_path boot=live union=aufs noapic noapm nodma nomce nolapic nosmp vga=normal"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd_devuan_micro.img
}
