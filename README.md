# Multiboot USB

<https://mbusb.aguslr.com/>

## About

This is a project that contains a collection of [GRUB][] files and scripts that
will allow you to create a pendrive capable of booting [different ISO
files][isos].

![Demo
GIF](https://gitlab.com/aguslr/multibootusb/raw/master/docs/assets/img/demo.gif
"Demo")


## NOTES about this fork

* Make 2 data partitions - one for DATA (partition 1, Fixes #217), one for boot/ISOs
* Set size for DATA partition. ISO part will take up remainder of drive.
* Set filesystem type separately for DATA and ISO partitions.
* Change command line arguments/parameters. Set defaults for everything.

        $ ./makeUSB.sh --help
        Script to prepare multiboot USB drive. 1st Partition 'DATA'. Separate 'ISO'                                                            
            partition for grub files and ISO storage.
        Usage: makeUSB.sh [options] device

         device                         Device to modify (e.g. /dev/sdb)
          -b,  --hybrid                 Create a hybrid MBR
          -c,  --clone                  Clone Git repository on the device
          -df, --data-format            Filesystem type for the DATA partition [ext3|ext4|vfat|exfat|ntfs] (Default vfat)                      
          -ds, --data-size              DATA partition size (e.g. 5G). Remainder of drive will be allocated to ISO partition. (Default 1G)     
          -e,  --efi                    Enable EFI compatibility
          -i,  --interactive            Launch gdisk to create a hybrid MBR
          -if, --iso-format             Filesystem type for the ISO partition [ext3|ext4|vfat|exfat|ntfs] (Default vfat)                       
          -h,  --help                   Display this message
          -s,  --subdirectory <NAME>    Specify a data subdirectory (default: "boot")                 

## Documentation

Visit the [project's website for more information][website].


[grub]: https://www.gnu.org/software/grub/
[isos]: https://mbusb.aguslr.com/isos.html
[website]: https://mbusb.aguslr.com/
