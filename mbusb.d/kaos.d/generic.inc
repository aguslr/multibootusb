menuentry "KaOS" {
  bootoptions="img_dev=$imgdevpath img_loop=$iso_path kdeosisodevice=/dev/loop0 earlymodules=loop kdeisolabel=$cd_label"
  linux (loop)/kdeos/boot/$arch/kdeosiso $bootoptions
  initrd (loop)/kdeos/boot/$arch/kdeosiso.img
}
