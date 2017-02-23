menuentry "SparkyLinux" {
  bootoptions="root=UUID=$rootuuid findiso=$iso_path boot=live live-config live-media-path=/live splash -- quiet"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "SparkyLinux (failsafe mode)" {
  bootoptions="root=UUID=$rootuuid findiso=$iso_path boot=live live-config live-media-path=/live noapic noapm nodma nomce nolapic pci=nomsi nomodeset radeon.modeset=0 nouveau.modeset=0 nosmp vga=normal noapci nosplash irqpoll --"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
