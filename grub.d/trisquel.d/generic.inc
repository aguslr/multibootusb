menuentry "Try Trisquel without installing" {
  bootoptions="iso-scan/filename=$iso_path boot=casper splash quiet noprompt --"
  linux (loop)/casper/vmlinuz $bootoptions
  initrd (loop)/casper/initrd
}
menuentry "Install Trisquel" {
  bootoptions="iso-scan/filename=$iso_path boot=casper splash quiet noprompt only-ubiquity --"
  linux (loop)/casper/vmlinuz $bootoptions
  initrd (loop)/casper/initrd
}
