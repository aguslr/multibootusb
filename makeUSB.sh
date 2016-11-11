#!/bin/sh

# Description: Script to prepare multiboot USB drive

# Exit if any variable is not set
set -o nounset

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
command -v sgdisk >/dev/null || cleanUp 3
command -v dd >/dev/null || cleanUp 3
command -v mkfs.${data_fmt} >/dev/null || cleanUp 3
command -v mount >/dev/null || cleanUp 3

# Check for GRUB installation binary
grub_cmd=$(command -v grub-install) \
    || grub_cmd=$(command -v grub2-install) \
    || cleanUp 3

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

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
printf 'Removing partitions from %s... ' "$usb_dev"
if sgdisk --zap-all "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
fi

# Create GUID Partition Table
printf 'Creating GUID Partition Table on %s... ' "$usb_dev"
if sgdisk --mbrtogpt "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Create BIOS boot partition (1M)
printf 'Creating BIOS boot partition on %s... ' "$usb_dev"
if sgdisk --new 1::+1M --typecode 1:ef02 \
    --change-name 1:"BIOS boot partition" "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

if [ "$eficonfig" -eq 1 ]; then
	# Create EFI System partition (50M)
	printf 'Creating EFI System partition on %s... ' "$usb_dev"
	if sgdisk --new 2::+50M --typecode 2:ef00 --change-name 2:"EFI System" \
	    "$usb_dev" >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		cleanUp 10
	fi
fi

# Create data partition
printf 'Creating data partition on %s... ' "$usb_dev"
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
if sgdisk --new ${data_part}::: --typecode ${data_part}:"$type_code" \
    --change-name ${data_part}:"$part_name" "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Create hybrid MBR
if [ "$hybrid" -eq 1 ]; then
	if [ "$interactive" -eq 0 ]; then
		printf 'Creating hybrid MBR on %s... ' "${usb_dev}"
		if [ "$eficonfig" -eq 1 ]; then
			if sgdisk --hybrid 1:2:3 "$usb_dev" >> "$log_file" 2>&1; then
				printf 'OK\n'
			else
				printf 'FAILED\n'
				cleanUp 10
			fi
		else
			if sgdisk --hybrid 1:2 "$usb_dev" >> "$log_file" 2>&1; then
				printf 'OK\n'
			else
				printf 'FAILED\n'
				cleanUp 10
			fi
		fi
	else
		# Create hybrid MBR manually
		# https://wiki.archlinux.org/index.php/Multiboot_USB_drive#Hybrid_UEFI_GPT_.2B_BIOS_GPT.2FMBR_boot
		gdisk "$usb_dev"
	fi
fi

# Set bootable flag for data partion
printf 'Setting bootable flag on %s... ' "${usb_dev}${data_part}"
if sgdisk --attributes ${data_part}:set:2 "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

# Format BIOS boot partition
printf 'Formatting BIOS boot partition on %s... ' "${usb_dev}1"
if dd if=/dev/zero of=${usb_dev}1 bs=1M count=1 >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

if [ "$eficonfig" -eq 1 ]; then
	# Format EFI System partition
	printf 'Formatting EFI System partition on %s... ' "${usb_dev}2"
	if mkfs.vfat -v -F 32 "${usb_dev}2" >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		cleanUp 10
	fi
fi

# Format data partition
printf 'Formatting data partition as %s on %s... ' \
    "$data_fmt" "${usb_dev}${data_part}"
if [ "$data_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	data_fmt="ntfs -f"
fi
if mkfs.${data_fmt} "${usb_dev}${data_part}" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount device
umount --force ${usb_dev}* 2>/dev/null

if [ "$eficonfig" -eq 1 ]; then
	# Mount EFI System partition
	printf 'Mounting EFI System partition on %s... ' "$efi_mnt"
	if mkdir -p "$efi_mnt" \
	    && mount -v "${usb_dev}2" "$efi_mnt" >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		cleanUp 10
	fi
fi

# Mount data partition
printf 'Mounting data partition on %s... ' "$data_mnt"
if mkdir -p "$data_mnt" \
    && mount -v "${usb_dev}${data_part}" "$data_mnt" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

if [ "$eficonfig" -eq 1 ]; then
	# Install GRUB for EFI
	printf 'Installing GRUB for EFI on %s... ' "$usb_dev"
	if $grub_cmd --target=x86_64-efi --efi-directory=$efi_mnt \
	    --boot-directory=${data_mnt}boot --removable --recheck >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		cleanUp 10
	fi

	# Unmount EFI System partition
	printf 'Unmounting EFI System partition on %s... ' "$efi_mnt"
	if umount -v $efi_mnt >> "$log_file" 2>&1; then
		printf 'OK\n'
	else
		printf 'FAILED\n'
		cleanUp 10
	fi
fi

# Install GRUB for BIOS
printf 'Installing GRUB for BIOS on %s... ' "$usb_dev"
if $grub_cmd --force --target=i386-pc \
    --boot-directory=${data_mnt}boot \
    --recheck "$usb_dev" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Install fallback GRUB
printf 'Installing fallback GRUB on %s... ' "${usb_dev}${data_part}"
if $grub_cmd --force --target=i386-pc \
    --boot-directory=${data_mnt}boot \
    --recheck "${usb_dev}${data_part}" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
fi

# Create necesary directories
printf 'Creating directories on %s... ' "${data_mnt}boot"
if mkdir -p ${data_mnt}boot/bin ${data_mnt}boot/krnl \
    ${data_mnt}boot/isos >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Detect GRUB directory name
if [ -d "${data_mnt}boot/grub" ]; then
	grub_dir="${data_mnt}boot/grub/"
elif [ -d "${data_mnt}boot/grub2" ]; then
	grub_dir="${data_mnt}boot/grub2/"
else
	cleanUp 10
fi

# Copy files
printf 'Copying files to %s... ' "${data_mnt}boot"
if cp -rf ./grub.cfg ./grub.d ./multiboot.* "$grub_dir" >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Unmount data partition
printf 'Unmounting data partition on %s... ' "$data_mnt"
if umount -v $data_mnt >> "$log_file" 2>&1; then
	printf 'OK\n'
else
	printf 'FAILED\n'
	cleanUp 10
fi

# Clean up and exit
cleanUp
