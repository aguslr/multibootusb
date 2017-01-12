menuentry "GParted Live (Default settings)" "$isofile" {
  isofile="$2"
  bootoptions="findiso=$isofile boot=live union=overlay username=user config components quiet noswap  ip= net.ifnames=0  nosplash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "GParted Live (Default settings, KMS)" "$isofile" {
  isofile="$2"
  bootoptions="findiso=$isofile boot=live union=overlay username=user config components quiet noswap vga=791 ip= net.ifnames=0  nosplash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "GParted Live (To RAM. Boot media can be removed later)" "$isofile" {
  isofile="$2"
  bootoptions="findiso=$isofile boot=live union=overlay username=user config components quiet noswap  toram=filesystem.squashfs ip= net.ifnames=0  nosplash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "GParted Live (Safe graphic settings)" "$isofile" {
  isofile="$2"
  bootoptions="findiso=$isofile boot=live union=overlay username=user config components quiet noswap ip= net.ifnames=0 nomodeset vga=normal nosplash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "GParted Live (Failsafe mode)" "$isofile" {
  isofile="$2"
  bootoptions="findiso=$isofile boot=live union=overlay username=user config components quiet noswap acpi=off irqpoll noapic noapm nodma nomce nolapic nosmpip= net.ifnames=0 nomodeset vga=normal nosplash"
  linux (loop)/live/vmlinuz $bootoptions
  initrd (loop)/live/initrd.img
}
menuentry "Memory test using Memtest86+" {
  bootoptions=""
  linux16 (loop)/live/memtest $bootoptions
}
