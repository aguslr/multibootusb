menuentry "Android-x86 Live" {
  bootoptions="iso-scan/filename=$iso_path androidboot.selinux=permissive quiet"
  linux (loop)/kernel $bootoptions
  initrd (loop)/initrd.img
}
menuentry "Android-x86 DEBUG" {
  bootoptions="iso-scan/filename=$iso_path androidboot.selinux=permissive DEBUG=2"
  linux (loop)/kernel $bootoptions
  initrd (loop)/initrd.img
}
menuentry "Android-x86 Installation" {
  bootoptions="iso-scan/filename=$iso_path androidboot.selinux=permissive INSTALL=1"
  linux (loop)/kernel $bootoptions
  initrd (loop)/initrd.img
}
