menuentry "Void Linux" "$isofile" {
  isofile="$2"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=VOID_LIVE init=/sbin/init ro rd.luks=0 rd.md=0 rd.dm=0 loglevel=4 vconsole.unicode=1 vconsole.keymap=us locale.LANG=en_US.UTF-8"
  linux (loop)/boot/vmlinuz $bootoptions
  initrd (loop)/boot/initrd
}
menuentry "Void Linux (RAM)" "$isofile" {
  isofile="$2"
  bootoptions="iso-scan/filename=$isofile root=live:CDLABEL=VOID_LIVE init=/sbin/init ro rd.luks=0 rd.md=0 rd.dm=0 loglevel=4 vconsole.unicode=1 vconsole.keymap=us locale.LANG=en_US.UTF-8  rd.live.ram"
  linux (loop)/boot/vmlinuz $bootoptions
  initrd (loop)/boot/initrd
}
