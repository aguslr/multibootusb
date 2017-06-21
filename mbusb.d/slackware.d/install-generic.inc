menuentry "Slackware install" {
  bootoptions="load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 SLACK_KERNEL=huge.s"
  linux (loop)/kernels/huge.s/bzImage $bootoptions
  initrd (loop)/isolinux/initrd.img
}
