menuentry "Start Manjaro Linux" {
  bootoptions="img_dev=$imgdevpath img_loop=$iso_path earlymodules=loop misobasedir=manjaro misolabel=$cd_label nouveau.modeset=1 i915.modeset=1 radeon.modeset=1 logo.nologo overlay=free quiet splash showopts"
  linux (loop)/boot/vmlinuz-$arch $bootoptions
  initrd (loop)/boot/initramfs-${arch}.img
}
menuentry "Start (non-free drivers)" {
  bootoptions="img_dev=$imgdevpath img_loop=$iso_path earlymodules=loop misobasedir=manjaro misolabel=$cd_label nouveau.modeset=0 i915.modeset=1 radeon.modeset=0 nonfree=yes logo.nologo overlay=nonfree quiet splash showopts"
  linux (loop)/boot/vmlinuz-$arch $bootoptions
  initrd (loop)/boot/initramfs-${arch}.img
}
