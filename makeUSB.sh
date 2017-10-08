#!/bin/sh

# Description: Script to prepare multiboot USB drive

# show line number when execute by bash -x makeUSB.sh
[ "$BASH" ] && \
    export PS4='    +\t $BASH_SOURCE:$LINENO: ${FUNCNAME[0]:+${FUNCNAME[0]}():}'

# Exit if there is an unbound variable or an error
set -o nounset
set -o errexit

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
	umount -f "$efi_mnt" 2>/dev/null || true
	umount -f "$data_mnt" 2>/dev/null || true
	# Delete mountpoints
	[ -d "$efi_mnt" ] && rmdir "$efi_mnt"
	[ -d "$data_mnt" ] && rmdir "$data_mnt"
	# Exit
	exit "${1-0}"
}

# Make sure USB drive is not mounted
unmountUSB() {
	umount -f "${1}"* 2>/dev/null || true
}

# Trap kill signals (SIGHUP, SIGINT, SIGTERM) to do some cleanup and exit
trap 'cleanUp' 1 2 15

# Check for root
if [ "$(id -u)" -ne 0 ]; then
	printf 'This script must be run as root. Using sudo...\n' "$scriptname" >&2
	exec sudo -k -- /bin/sh "$0" "$@" || cleanUp 2
fi

# Get original user
normal_user="${SUDO_USER-$(who -m | awk '{print $1}')}"

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

# Check for required arguments
if [ ! "$usb_dev" ]; then
	printf '%s: No device was provided.\n' "$scriptname" >&2
	showUsage
	cleanUp 1
fi

# Unmount device
unmountUSB "$usb_dev"

# Confirm the device
printf 'Are you sure you want to use %s? [y/N] ' "$usb_dev"
read -r answer1
case "$answer1" in
	[yY][eE][sS]|[yY])
		printf 'THIS WILL DELETE ALL DATA ON THE DEVICE. Are you sure? [y/N] '
		read -r answer2
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
sgdisk --zap-all "$usb_dev"

# Create GUID Partition Table
sgdisk --mbrtogpt "$usb_dev" || cleanUp 10

# Create BIOS boot partition (1M)
sgdisk --new 1::+1M --typecode 1:ef02 \
    --change-name 1:"BIOS boot partition" "$usb_dev" || cleanUp 10

# Create EFI System partition (50M)
[ "$eficonfig" -eq 1 ] && \
    { sgdisk --new 2::+50M --typecode 2:ef00 \
    --change-name 2:"EFI System" "$usb_dev" || cleanUp 10; }

# Set data partition size
[ -z "$data_size" ] || \
    data_size="+$data_size"

# Set data partition information
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

# Create data partition
sgdisk --new ${data_part}::"${data_size}": --typecode ${data_part}:"$type_code" \
    --change-name ${data_part}:"$part_name" "$usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Interactive configuration?
if [ "$interactive" -eq 1 ]; then
	# Create hybrid MBR manually
	# https://bit.ly/2z7HBrP
	gdisk "$usb_dev"
elif [ "$hybrid" -eq 1 ]; then
	# Create hybrid MBR
	if [ "$eficonfig" -eq 1 ]; then
		sgdisk --hybrid 1:2:3 "$usb_dev" || cleanUp 10
	else
		sgdisk --hybrid 1:2 "$usb_dev" || cleanUp 10
	fi
fi

# Set bootable flag for data partion
sgdisk --attributes ${data_part}:set:2 "$usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Wipe BIOS boot partition
wipefs -af "${usb_dev}1" || true

# Format EFI System partition
if [ "$eficonfig" -eq 1 ]; then
	wipefs -af "${usb_dev}2" || true
	mkfs.vfat -v -F 32 "${usb_dev}2" || cleanUp 10
fi

# Wipe data partition
wipefs -af "${usb_dev}${data_part}" || true

# Format data partition
if [ "$data_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	mkfs -t "$data_fmt" -f "${usb_dev}${data_part}" || cleanUp 10
else
	mkfs -t "$data_fmt" "${usb_dev}${data_part}" || cleanUp 10
fi

# Unmount device
unmountUSB "$usb_dev"

# Create temporary mountpoints
efi_mnt=$(mktemp -p "$tmp_dir" -d efi.XXXX)
data_mnt=$(mktemp -p "$tmp_dir" -d data.XXXX)

# Mount EFI System partition
[ "$eficonfig" -eq 1 ] && \
    { mount "${usb_dev}2" "$efi_mnt" || cleanUp 10; }

# Mount data partition
mount "${usb_dev}${data_part}" "$data_mnt" || cleanUp 10

# Install GRUB for EFI
[ "$eficonfig" -eq 1 ] && \
    { grub2-install --target=x86_64-efi --efi-directory="$efi_mnt" \
    --boot-directory="${data_mnt}/boot" --removable --recheck \
    || grub-install --target=x86_64-efi --efi-directory="$efi_mnt" \
    --boot-directory="${data_mnt}/boot" --removable --recheck \
    || cleanUp 10; }

# Install GRUB for BIOS
grub2-install --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" --recheck "$usb_dev" \
    || grub-install --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" --recheck "$usb_dev" \
    || cleanUp 10

# Install fallback GRUB
grub2-install --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" --recheck "${usb_dev}${data_part}" \
    || grub-install --force --target=i386-pc \
    --boot-directory="${data_mnt}/boot" --recheck "${usb_dev}${data_part}" \

# Create necessary directories
mkdir -p "${data_mnt}/boot/isos" || cleanUp 10

# Copy files
cp -R -f ./mbusb.* "${data_mnt}/boot/grub2/" \
    || cp -R -f ./mbusb.* "${data_mnt}/boot/grub/" \
    || cleanUp 10

# Copy example configuration for GRUB
cp -f ./grub.cfg.example "${data_mnt}/boot/grub2/grub.cfg" \
    || cp -f ./grub.cfg.example "${data_mnt}/boot/grub/grub.cfg" \
    || cleanUp 10

# Download memdisk
wget -qO - \
    'https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz' \
    | tar -xz -C "$tmp_dir" --no-same-owner --strip-components 3 \
    'syslinux-6.03/bios/memdisk/memdisk' \
    || cleanUp 10

# Copy memdisk to pendrive
cp -p "${tmp_dir}/memdisk" "${data_mnt}/boot/grub2/" \
    || cp -p "${tmp_dir}/memdisk" "${data_mnt}/boot/grub/" \
    || cleanUp 10

# Remove downloaded memdisk
rm -f "${tmp_dir}/memdisk" || true

# Change ownership of files
chown -R "$normal_user" "${data_mnt}"/* 2>/dev/null || true

# Unmount partitions
umount "$efi_mnt" "$data_mnt" || cleanUp 10

# Clean up and exit
cleanUp
