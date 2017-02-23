menuentry "antiX" {
  bootoptions="from=hd root=UUID=$rootuuid fromiso=$iso_path quiet splash=v disable=lx"
  linux (loop)/antiX/vmlinuz $bootoptions
  initrd (loop)/antiX/initrd.gz
}
menuentry "antiX Customize Boot (text menus)" {
  bootoptions="from=hd root=UUID=$rootuuid fromiso=$iso_path quiet splash=v disable=lx menus"
  linux (loop)/antiX/vmlinuz $bootoptions
  initrd (loop)/antiX/initrd.gz
}
menuentry "antiX Failsafe" {
  bootoptions="from=hd root=UUID=$rootuuid fromiso=$iso_path quiet splash=v disable=lx nomodeset failsafe"
  linux (loop)/antiX/vmlinuz $bootoptions
  initrd (loop)/antiX/initrd.gz
}
menuentry "antiX Create Bootchart" {
  bootoptions="from=hd root=UUID=$rootuuid fromiso=$iso_path quiet splash=v disable=lx bootchart initcall_debug printk.time=y"
  linux (loop)/antiX/vmlinuz $bootoptions
  initrd (loop)/antiX/initrd.gz
}
