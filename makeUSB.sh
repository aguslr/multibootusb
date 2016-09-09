#!/bin/sh

# Description: Script to prepare multiboot USB drive

# Defaults
scriptname=$(basename "$0")
data_fmt="vfat"
efi_mnt="/mnt/MBU-EFI"
data_mnt="/mnt/MBU-DATA"

# Clean up when exiting
cleanUp() {
	# Unmount everything
	umount --force "$efi_mnt" 2>/dev/null
	umount --force "$data_mnt" 2>/dev/null
	# Delete mountpoints
	[ -d "$efi_mnt" ] && rmdir "$efi_mnt"
	[ -d "$data_mnt" ] && rmdir "$data_mnt"
	# Exit
	exit "${1-0}"
}

# Trap kill signals (SIGHUP, SIGINT, SIGTERM) to do some cleanup and exit
trap 'cleanUp' 1 2 15

# Check arguments
while [ "$#" -gt 0 ]; do
	case "$1" in
		/dev/*)
			if [ -e "$1" ]; then
				usb_dev="$1"
			else
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
[ "$(id -u)" -ne 0 ] && {
	printf '%s: This script must be run as root.\n' "$scriptname" >&2
	cleanUp 2
}

# Check for required arguments
[ "$usb_dev" ] || {
	printf '%s: No device was provided.\n' "$scriptname" >&2
	cleanUp 1
}

# Check for required binaries
command -v sgdisk >/dev/null || cleanUp 3
command -v dd >/dev/null || cleanUp 3
command -v mkfs.${data_fmt} >/dev/null || cleanUp 3
command -v mount >/dev/null || cleanUp 3
command -v grub-install >/dev/null || cleanUp 3

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Remove partitions
printf 'Removing partitions from %s... ' "$usb_dev"
if sgdisk --zap-all "$usb_dev" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
fi

# Create GUID Partition Table
printf 'Creating GUID Partition Table on %s... ' "$usb_dev"
if sgdisk --mbrtogpt "$usb_dev" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Create BIOS boot partition (1M)
printf 'Creating BIOS boot partition on %s... ' "$usb_dev"
if sgdisk --new 1::+1M --typecode 1:ef02 \
    --change-name 1:"BIOS boot partition" "$usb_dev" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Create EFI System partition (50M)
printf 'Creating EFI System partition on %s... ' "$usb_dev"
if sgdisk --new 2::+50M --typecode 2:ef00 --change-name 2:"EFI System" \
    "$usb_dev" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Create data partition
printf 'Creating data partition on %s... ' "$usb_dev"
case "$data_fmt" in
	ext2|ext3|ext4)
		if sgdisk --new 3::: --typecode 3:8300 \
		    --change-name 3:"Linux filesystem" \
		    "$usb_dev" >/dev/null 2>&1; then
			printf 'OK\n'
		else
			printf 'FAILED\n'
			cleanUp 10
		fi
		;;
	msdos|fat|vfat|ntfs)
		if sgdisk --new 3::: --typecode 3:0700 \
		    --change-name 3:"Microsoft basic data" \
		    "$usb_dev" >/dev/null 2>&1; then
			printf 'OK\n'
		else
			printf 'FAILED\n'
			cleanUp 10
		fi
		;;
esac

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Open gdisk
gdisk $usb_dev

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Format BIOS boot partition
printf 'Formatting BIOS boot partition on %s... ' "${usb_dev}1"
if dd if=/dev/zero of=${usb_dev}1 bs=512 count=1 >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Format EFI System partition
printf 'Formatting EFI System partition on %s... ' "${usb_dev}2"
if mkfs.vfat "${usb_dev}2" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Format data partition
printf 'Formatting data partition as %s on %s... ' "$data_fmt" "${usb_dev}3"
case "$data_fmt" in
	ext2|ext3|ext4|msdos|fat|vfat|ntfs)
		if mkfs.${data_fmt} "${usb_dev}3" >/dev/null 2>&1; then
			printf 'OK\n'
		else
			printf 'FAILED\n'
			cleanUp 10
		fi
		;;
esac

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Mount EFI System partition
printf 'Mounting EFI System partition on %s... ' "$efi_mnt"
if mkdir -p "$efi_mnt" && mount "${usb_dev}2" "$efi_mnt"; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Mount data partition
printf 'Mounting data partition on %s... ' "$data_mnt"
if mkdir -p "$data_mnt" && mount "${usb_dev}3" "$data_mnt"; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Install GRUB for EFI
printf 'Installing GRUB for EFI on %s... ' "$usb_dev"
if grub-install --target=x86_64-efi --efi-directory=$efi_mnt \
    --boot-directory=${data_mnt}/boot --removable --recheck >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount EFI System partition
printf 'Unmounting EFI System partition on %s... ' "$efi_mnt"
if umount $efi_mnt; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Install GRUB for BIOS
printf 'Installing GRUB for BIOS on %s... ' "$usb_dev"
if grub-install --target=i386-pc --boot-directory=${data_mnt}/boot \
    --recheck "$usb_dev" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Install fallback GRUB
printf 'Installing fallback GRUB on %s... ' "${usb_dev}3"
if grub-install --force --target=i386-pc \
    --boot-directory=${data_mnt}/boot \
    --recheck "${usb_dev}3" >/dev/null 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Create necesary directories
printf 'Creating directories on %s... ' "${data_mnt}/boot"
if mkdir -p ${data_mnt}/boot/grub ${data_mnt}/boot/bin ${data_mnt}/boot/krnl \
    ${data_mnt}/boot/isos; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Copy files
printf 'Copying files to %s... ' "${data_mnt}/boot"
if cp -rf ./grub.cfg ./grub.d ./multiboot.* "${data_mnt}/boot/grub/"; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount data partition
printf 'Unmounting data partition on %s... ' "$data_mnt"
if umount $data_mnt; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Clean up and exit
cleanUp
