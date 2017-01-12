menuentry "Try Trisquel without installing" "$isofile" {
  isofile="$2"
  bootoptions="iso-scan/filename=$isofile boot=casper splash quiet noprompt --"
  linux (loop)/casper/vmlinuz $bootoptions
  initrd (loop)/casper/initrd
}
menuentry "Install Trisquel" "$isofile" {
  isofile="$2"
  bootoptions="iso-scan/filename=$isofile boot=casper splash quiet noprompt only-ubiquity --"
  linux (loop)/casper/vmlinuz $bootoptions
  initrd (loop)/casper/initrd
}
