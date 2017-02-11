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
efi_mnt="/mnt/MBU-EFI/"
data_mnt="/mnt/MBU-DATA/"
log_file="/dev/null"

# Show usage
showUsage() {
	cat <<- EOF
	Script to prepare multiboot USB drive
	Usage: $scriptname [options] device [fs-type]

	 device                         Device to modify (e.g. /dev/sdb)
	 fs-type                        Filesystem type for the data partition [ext3|ext4|vfat|ntfs]
	  -b,  --hybrid                 Create a hybrid MBR
	  -e,  --efi                    Enable EFI compatibility
	  -i,  --interactive            Launch gdisk to create a hybrid MBR
	  -l,  --log                    Save debug information to log
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

# Try running a command
tryCMD() {
	local msg="$1"
	local cmd="$2"
	printf '%s... ' "$msg"
	if eval "$cmd" >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		return 1
	fi
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
		-l|--log)
			log_file="${scriptname%.*}.log"
			printf '' "$log_file"
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
		*)
			data_fmt="$1"
			shift
			;;
	esac
done

# Check for root
if [ "$(id -u)" -ne 0 ]; then
	printf '%s: This script must be run as root.\n' "$scriptname" >&2
	cleanUp 2
fi

# Check for required arguments
if [ ! "$usb_dev" ]; then
	printf '%s: No device was provided.\n' "$scriptname" >&2
	showUsage
	cleanUp 1
fi

# Check for required binaries
sgdisk_cmd=$(command -v sgdisk)         || cleanUp 3
dd_cmd=$(command -v dd)                 || cleanUp 3
wget_cmd=$(command -v wget)             || cleanUp 3
gunzip_cmd=$(command -v gunzip)         || cleanUp 3
tar_cmd=$(command -v tar)               || cleanUp 3
command -v mkfs."${data_fmt}" >/dev/null  || cleanUp 3

# Check for GRUB installation binary
grub_cmd=$(command -v grub-install) \
    || grub_cmd=$(command -v grub2-install) \
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

# Remove partitions
tryCMD "Removing partitions from $usb_dev" \
    "$sgdisk_cmd --zap-all $usb_dev"

# Create GUID Partition Table
tryCMD "Creating GUID Partition Table on $usb_dev" \
    "$sgdisk_cmd --mbrtogpt $usb_dev" || cleanUp 10

# Create BIOS boot partition (1M)
tryCMD "Creating BIOS boot partition on $usb_dev" \
    "$sgdisk_cmd --new 1::+1M --typecode 1:ef02 \
    --change-name 1:\"BIOS boot partition\" $usb_dev" || cleanUp 10

if [ "$eficonfig" -eq 1 ]; then
	# Create EFI System partition (50M)
	tryCMD "Creating EFI System partition on $usb_dev" \
	    "$sgdisk_cmd --new 2::+50M --typecode 2:ef00 --change-name 2:\"EFI System\" \
	    $usb_dev" || cleanUp 10
fi

# Create data partition
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
tryCMD "Creating data partition on $usb_dev" \
    "$sgdisk_cmd --new ${data_part}::: --typecode ${data_part}:\"$type_code\" \
    --change-name ${data_part}:\"$part_name\" $usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Create hybrid MBR
if [ "$hybrid" -eq 1 ]; then
	if [ "$interactive" -eq 0 ]; then
		if [ "$eficonfig" -eq 1 ]; then
		    tryCMD "Creating hybrid MBR on ${usb_dev}" \
			    "$sgdisk_cmd --hybrid 1:2:3 $usb_dev" || cleanUp 10
		else
		    tryCMD "Creating hybrid MBR on ${usb_dev}" \
			    "$sgdisk_cmd --hybrid 1:2 $usb_dev" || cleanUp 10
		fi
	else
		# Create hybrid MBR manually
		# https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
		gdisk "$usb_dev"
	fi
fi

# Set bootable flag for data partion
tryCMD "Setting bootable flag on ${usb_dev}${data_part}" \
   "$sgdisk_cmd --attributes ${data_part}:set:2 $usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Format BIOS boot partition
tryCMD "Formatting BIOS boot partition on ${usb_dev}1" \
    "$dd_cmd if=/dev/zero of=${usb_dev}1 bs=1M count=1" || cleanUp 10

if [ "$eficonfig" -eq 1 ]; then
	# Format EFI System partition
	tryCMD "Formatting EFI System partition on ${usb_dev}2" \
	    "mkfs.vfat -v -F 32 ${usb_dev}2" || cleanUp 10
fi

# Format data partition
if [ "$data_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	mkfs_args="-t $data_fmt -f"
else
	mkfs_args="-t $data_fmt"
fi
tryCMD "Formatting data partition as $data_fmt on ${usb_dev}${data_part}" \
    "mkfs $mkfs_args ${usb_dev}${data_part}" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

if [ "$eficonfig" -eq 1 ]; then
	# Mount EFI System partition
	tryCMD "Mounting EFI System partition on $efi_mnt" \
	    "mkdir -p $efi_mnt \
	    && mount -v ${usb_dev}2 $efi_mnt" || cleanUp 10
fi

# Mount data partition
tryCMD "Mounting data partition on $data_mnt" \
    "mkdir -p $data_mnt \
    && mount -v ${usb_dev}${data_part} $data_mnt" || cleanUp 10

if [ "$eficonfig" -eq 1 ]; then
	# Install GRUB for EFI
	tryCMD "Installing GRUB for EFI on $usb_dev" \
	    "$grub_cmd --target=x86_64-efi --efi-directory=$efi_mnt \
	    --boot-directory=${data_mnt}boot --removable --recheck" || cleanUp 10

	# Unmount EFI System partition
	tryCMD "Unmounting EFI System partition on $efi_mnt" "umount -v $efi_mnt" \
	    || cleanUp 10
fi

# Install GRUB for BIOS
tryCMD "Installing GRUB for BIOS on $usb_dev" \
    "$grub_cmd --force --target=i386-pc \
    --boot-directory=${data_mnt}boot \
    --recheck $usb_dev" || cleanUp 10

# Install fallback GRUB
tryCMD "Installing fallback GRUB on ${usb_dev}${data_part}" \
    "$grub_cmd --force --target=i386-pc \
    --boot-directory=${data_mnt}boot \
    --recheck ${usb_dev}${data_part}"

# Create necessary directories
tryCMD "Creating directories on ${data_mnt}boot" \
    "mkdir -p ${data_mnt}boot/bin ${data_mnt}boot/isos" || cleanUp 10

# Detect GRUB directory name
if [ -d "${data_mnt}boot/grub" ]; then
	grub_dir="${data_mnt}boot/grub/"
elif [ -d "${data_mnt}boot/grub2" ]; then
	grub_dir="${data_mnt}boot/grub2/"
else
	cleanUp 10
fi

# Copy files
tryCMD "Copying files to ${data_mnt}boot" \
    "cp -rf ./grub.* $grub_dir" || cleanUp 10

# Download memdisk
tryCMD "Downloading memdisk to ${data_mnt}boot/grub" \
    "$wget_cmd -qO - \
    'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' \
    | $tar_cmd -xz -C $grub_dir --no-same-owner --strip-components 3 \
    'syslinux-6.03/bios/memdisk/memdisk'"

# Download Memtest86+
tryCMD "Downloading Memtest86+ to ${data_mnt}boot/bin" \
    "$wget_cmd -qO - 'http://www.memtest.org/download/5.01/memtest86+-5.01.bin.gz' \
    | $gunzip_cmd -c > ${data_mnt}boot/bin/memtest86+.bin"

# Unmount data partition
tryCMD "Unmounting data partition on $data_mnt" "umount -v $data_mnt" \
    || cleanUp 10

# Clean up and exit
cleanUp
