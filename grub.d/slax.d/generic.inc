menuentry "Run Slax - Persistent changes, Graphical desktop, Copy to RAM, Act as PXE server" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=perch,xmode,toram,pxe"
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
menuentry "Run Slax" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags="
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
menuentry "Run Slax - Persistent changes" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=perch"
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
menuentry "Run Slax - Graphical desktop" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=xmode"
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
menuentry "Run Slax - Copy to RAM" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=toram"
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
menuentry "Run Slax - Act as PXE server" "$isofile" {
  isofile="$2"
  bootoptions="from=$isofile vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=pxe"
  linux (loop)/slax/boot/vmlinuz $bootoptions
  initrd (loop)/slax/boot/initrfs.img
}
