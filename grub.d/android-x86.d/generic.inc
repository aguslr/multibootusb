menuentry "android-x86" {
  bootoptions="iso-scan/filename=$iso_path androidboot.selinux=permissive"
  linux (loop)/kernel $bootoptions
  initrd (loop)/initrd.img
}
