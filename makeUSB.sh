#!/bin/sh

# Description: Script to prepare multiboot USB drive

# Exit if there is an unbound variable or an error
set -o nounset
set -o errexit

# show line number when execute by bash -x makeUSB.sh
export PS4='        +\t $BASH_SOURCE:$LINENO: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

# Defaults
scriptname=$(basename "$0")
hybrid=0
eficonfig=0
interactive=0
data_part=2
data_fmt="vfat"
data_size=""
efi_mnt=""
data_mnt=""
tmp_dir="${TMPDIR-/tmp}"

# Show usage
showUsage() {
	cat <<- EOF
	Script to prepare multiboot USB drive
	Usage: $scriptname [options] device [fs-type] [data-size]

	 device                         Device to modify (e.g. /dev/sdb)
	 fs-type                        Filesystem type for the data partition [ext3|ext4|vfat|ntfs]
	 data-size                      Data partition size (e.g. 5G)
	  -b,  --hybrid                 Create a hybrid MBR
	  -e,  --efi                    Enable EFI compatibility
	  -i,  --interactive            Launch gdisk to create a hybrid MBR
	  -h,  --help                   Display this message

	EOF
}

# Clean up when exiting
cleanUp() {
	# Unmount everything
	umount --force "$efi_mnt" 2>/dev/null || true
	umount --force "$data_mnt" 2>/dev/null || true
	# Delete mountpoints
	[ -d "$efi_mnt" ] && rmdir "$efi_mnt"
	[ -d "$data_mnt" ] && rmdir "$data_mnt"
	# Exit
	exit "${1-0}"
}

# Make sure USB drive is not mounted
unmountUSB() {
	umount --force "${1}"* 2>/dev/null || true
}

# Trap kill signals (SIGHUP, SIGINT, SIGTERM) to do some cleanup and exit
trap 'cleanUp' 1 2 15

# Check arguments
[ $# -eq 0 ] && showUsage && exit 0
while [ "$#" -gt 0 ]; do
	case "$1" in
		# Show help
		-h|--help)
			showUsage
			exit 0
			;;
		-b|--hybrid)
			hybrid=1
			shift
			;;
		-e|--efi)
			eficonfig=1
			data_part=3
			shift
			;;
		-i|--interactive)
			interactive=1
			shift
			;;
		/dev/*)
			if [ -b "$1" ]; then
				usb_dev="$1"
			else
				printf '%s: %s is not a valid device.\n' "$scriptname" "$1" >&2
				cleanUp 1
			fi
			shift
			;;
		[a-z]*)
			data_fmt="$1"
			shift
			;;
		[0-9]*)
			data_size="$1"
			shift
			;;
	esac
done

# Check for root
if [ "$(id -u)" -ne 0 ]; then
	printf '%s: This script must be run as root.\n' "$scriptname" >&2
	cleanUp 2
fi

# Get original user
normal_user="${SUDO_USER-$(who am i | awk '{print $1}')}"

# Check for required arguments
if [ ! "$usb_dev" ]; then
	printf '%s: No device was provided.\n' "$scriptname" >&2
	showUsage
	cleanUp 1
fi

# Check for required binaries
sgdisk_cmd=$(command -v sgdisk)         || cleanUp 3
wipefs_cmd=$(command -v wipefs)         || cleanUp 3
wget_cmd=$(command -v wget)             || cleanUp 3
tar_cmd=$(command -v tar)               || cleanUp 3
command -v mkfs."${data_fmt}" >/dev/null  || cleanUp 3

# Check for GRUB installation binary
grub_cmd=$(command -v grub2-install) \
    || grub_cmd=$(command -v grub-install) \
    || cleanUp 3

# Unmount device
unmountUSB "$usb_dev"

# Confirm the device
read -r -p "Are you sure you want to use $usb_dev? [y/N] " answer1
case "$answer1" in
	[yY][eE][sS]|[yY])
		read -r -p "THIS WILL DELETE ALL DATA ON THE DEVICE. Are you sure? [y/N] " answer2
		case $answer2 in
			[yY][eE][sS]|[yY])
				true
				;;
			*)
				cleanUp 3
				;;
		esac
		;;
	*)
		cleanUp 3
		;;
esac

# Print all steps
set -o verbose

# Remove partitions
$sgdisk_cmd --zap-all "$usb_dev"

# Create GUID Partition Table
$sgdisk_cmd --mbrtogpt "$usb_dev" || cleanUp 10

# Create BIOS boot partition (1M)
$sgdisk_cmd --new 1::+1M --typecode 1:ef02 \
    --change-name 1:"BIOS boot partition" "$usb_dev" || cleanUp 10

# Create EFI System partition (50M)
if [ "$eficonfig" -eq 1 ]; then
	$sgdisk_cmd --new 2::+50M --typecode 2:ef00 --change-name 2:"EFI System" \
	    "$usb_dev" || cleanUp 10
fi

# Create data partition
if [ ! -z "$data_size" ]; then
	data_size="+$data_size"
fi
case "$data_fmt" in
	ext2|ext3|ext4)
		type_code="8300"
		part_name="Linux filesystem"
		;;
	msdos|fat|vfat|ntfs)
		type_code="0700"
		part_name="Microsoft basic data"
		;;
	*)
		printf '%s: %s is an invalid filesystem type.\n' "$scriptname" "$data_fmt" >&2
		showUsage
		cleanUp 1
		;;
esac
$sgdisk_cmd --new ${data_part}::${data_size}: --typecode ${data_part}:"$type_code" \
    --change-name ${data_part}:"$part_name" "$usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Create hybrid MBR
if [ "$hybrid" -eq 1 ]; then
	if [ "$interactive" -eq 0 ]; then
		if [ "$eficonfig" -eq 1 ]; then
			$sgdisk_cmd --hybrid 1:2:3 "$usb_dev" || cleanUp 10
		else
			$sgdisk_cmd --hybrid 1:2 "$usb_dev" || cleanUp 10
		fi
	else
		# Create hybrid MBR manually
		# https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
		gdisk "$usb_dev"
	fi
fi

# Set bootable flag for data partion
$sgdisk_cmd --attributes ${data_part}:set:2 "$usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Format BIOS boot partition
$wipefs_cmd -af "${usb_dev}1" || cleanup 10

if [ "$eficonfig" -eq 1 ]; then
	# Format EFI System partition
	$wipefs_cmd -af "${usb_dev}2" || cleanup 10
	mkfs.vfat -v -F 32 "${usb_dev}2" || cleanUp 10
fi

# Format data partition
if [ "$data_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	mkfs_args="-t $data_fmt -f"
else
	mkfs_args="-t $data_fmt"
fi
$wipefs_cmd -af "${usb_dev}${data_part}" || cleanup 10
mkfs $mkfs_args "${usb_dev}${data_part}" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Create temporary mountpoints
efi_mnt=$(mktemp -p "$tmp_dir" -d efi.XXXX)
data_mnt=$(mktemp -p "$tmp_dir" -d data.XXXX)

if [ "$eficonfig" -eq 1 ]; then
	# Mount EFI System partition
	mount -v "${usb_dev}2" "$efi_mnt" || cleanUp 10
fi

# Mount data partition
mount -v "${usb_dev}${data_part}" "$data_mnt" || cleanUp 10

if [ "$eficonfig" -eq 1 ]; then
	# Install GRUB for EFI
	$grub_cmd --target=x86_64-efi --efi-directory="$efi_mnt" \
	    --boot-directory="${data_mnt}/boot" --removable --recheck || cleanUp 10
fi

# Install GRUB for BIOS
$grub_cmd --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" \
    --recheck "$usb_dev" || cleanUp 10

# Install fallback GRUB
$grub_cmd --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" \
    --recheck "${usb_dev}${data_part}"

# Create necessary directories
mkdir -p "${data_mnt}/boot/isos" || cleanUp 10

# Detect GRUB directory name
if [ -d "${data_mnt}boot/grub2" ]; then
	grub_dir="${data_mnt}boot/grub2/"
elif [ -d "${data_mnt}boot/grub" ]; then
	grub_dir="${data_mnt}boot/grub/"
else
	cleanUp 10
fi

# Copy files
cp -rf ./mbusb.* "$grub_dir" || cleanUp 10

# Copy example configuration for GRUB
cp -f ./grub.cfg.example "${grub_dir}/grub.cfg" || cleanUp 10

# Download memdisk
$wget_cmd -qO - \
    'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' \
    | $tar_cmd -xz -C "$grub_dir" --no-same-owner --strip-components 3 \
    'syslinux-6.03/bios/memdisk/memdisk'

# Change ownership of files
chown --recursive "$normal_user" "${data_mnt}"/* 2>/dev/null || true

# Unmount partitions
umount -v "$efi_mnt" "$data_mnt" || cleanUp 10

# Clean up and exit
cleanUp
