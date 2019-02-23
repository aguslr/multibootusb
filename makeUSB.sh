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
clone=0
eficonfig=0
interactive=0
boot_part=3
data_part=1
data_fmt="vfat"
data_size="1G"
iso_part=2
iso_fmt="vfat"
efi_mnt=""
iso_mnt=""
iso_subdir="boot"
repo_dir=""
tmp_dir="${TMPDIR-/tmp}"

# Show usage
showUsage() {
	cat <<- EOF
	Script to prepare multiboot USB drive. 1st Partition 'DATA'. Separate 'ISO'
    partition for grub files and ISO storage.
	Usage: $scriptname [options] device

 device                 	Device to modify (e.g. /dev/sdb)
	  -b,  --hybrid                 Create a hybrid MBR
	  -c,  --clone                  Clone Git repository on the device
	  -df, --data-format            Filesystem type for the DATA partition [ext3|ext4|vfat|exfat|ntfs] (Default vfat)
	  -ds, --data-size              DATA partition size (e.g. 5G). Remainder of drive will be allocated to ISO partition. (Default 1G)
	  -e,  --efi                    Enable EFI compatibility
	  -i,  --interactive            Launch gdisk to create a hybrid MBR
	  -if, --iso-format             Filesystem type for the ISO partition [ext3|ext4|vfat|exfat|ntfs] (Default vfat)
	  -h,  --help                   Display this message
	  -s,  --subdirectory <NAME>    Specify a data subdirectory (default: "boot")

	EOF
}

# Clean up when exiting
cleanUp() {
	# Change ownership of files
	{ [ "$iso_mnt" ] && \
	    chown -R "$normal_user" "${iso_mnt}"/* 2>/dev/null; } \
	    || true
	# Unmount everything
	umount -f "$efi_mnt" 2>/dev/null || true
	umount -f "$iso_mnt" 2>/dev/null || true
	# Delete mountpoints
	[ -d "$efi_mnt" ] && rmdir "$efi_mnt"
	[ -d "$iso_mnt" ] && rmdir "$iso_mnt"
	[ -d "$repo_dir" ] && rmdir "$repo_dir"
	# Exit
	exit "${1-0}"
}

# Make sure USB drive is not mounted
unmountUSB() {
	umount -f "${1}"* 2>/dev/null || true
}

# Trap kill signals (SIGHUP, SIGINT, SIGTERM) to do some cleanup and exit
trap 'cleanUp' 1 2 15

# Show help before checking for root
[ "$#" -eq 0 ] && showUsage && exit 0
case "$1" in
	-h|--help)
		showUsage
		exit 0
		;;
esac

# Check for root
if [ "$(id -u)" -ne 0 ]; then
	printf 'This script must be run as root. Using sudo...\n' "$scriptname" >&2
	exec sudo -k -- /bin/sh "$0" "$@" || cleanUp 2
fi

# Get original user
normal_user="${SUDO_USER-$(who -m | awk '{print $1}')}"

# Check arguments
while [ "$#" -gt 0 ]; do
	case "$1" in
		-b|--hybrid)
			hybrid=1
			;;
		-c|--clone)
			clone=1
			;;
        -df|--data-format)
			shift && data_fmt="$1"
            ;;
        -ds|--data-size)
			shift && data_size="$1"
            ;;
		-e|--efi)
			eficonfig=1
			iso_part=3
            boot_part=4
			;;
		-i|--interactive)
			interactive=1
			;;
        -if|--iso-format)
			shift && iso_fmt="$1"
            ;;
		-s|--subdirectory)
			shift && iso_subdir="$1"
			;;
		/dev/*)
			if [ -b "$1" ]; then
				usb_dev="$1"
			else
				printf '%s: %s is not a valid device.\n' "$scriptname" "$1" >&2
				cleanUp 1
			fi
			;;
		[a-z]*)
			iso_fmt="$1"
			;;
		[a-z]*)
			data_fmt="$1"
			;;
		[0-9]*)
			;;
		*)
			printf '%s: %s is not a valid argument.\n' "$scriptname" "$1" >&2
			cleanUp 1
			;;
	esac
	shift
done

# Check for required arguments
if [ ! "$usb_dev" ]; then
	printf '%s: No device was provided.\n' "$scriptname" >&2
	showUsage
	cleanUp 1
fi

# Check for GRUB installation binary
grub_cmd=$(command -v grub2-install) \
    || grub_cmd=$(command -v grub-install) \
    || cleanUp 3

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

# Set DATA partition size
[ -z "$data_size" ] || \
    data_size="+$data_size"

# Set DATA partition information
case "$data_fmt" in
	ext2|ext3|ext4)
		type_code="8300"
		part_name="Linux filesystem"
		;;
	msdos|fat|vfat|ntfs|exfat)
		type_code="0700"
		part_name="Microsoft basic data"
		;;
	*)
		printf '%s: %s is an invalid filesystem type.\n' "$scriptname" "$iso_fmt" >&2
		showUsage
		cleanUp 1
		;;
esac

# Create DATA partition
sgdisk --new ${data_part}::"${data_size}": --typecode ${data_part}:"$type_code" \
    --change-name ${data_part}:"$part_name" "$usb_dev" || cleanUp 10

# Create EFI System partition (50M)
[ "$eficonfig" -eq 1 ] && \
    { sgdisk --new 0::+50M --typecode 0:ef00 \
    --change-name 0:"EFI System" "$usb_dev" || cleanUp 10; }

# Set ISO partition information
case "$iso_fmt" in
	ext2|ext3|ext4)
		type_code="8300"
		part_name="Linux filesystem"
		;;
	msdos|fat|vfat|ntfs|exfat)
		type_code="0700"
		part_name="Microsoft basic data"
		;;
	*)
		printf '%s: %s is an invalid filesystem type.\n' "$scriptname" "$iso_fmt" >&2
		showUsage
		cleanUp 1
		;;
esac

# Create ISO partition
sgdisk --new 0::: --typecode 0:"$type_code" \
    --change-name 0:"$part_name" "$usb_dev" || cleanUp 10

# Create BIOS boot partition (1M)
sgdisk --new 0::: --typecode 0:ef02 \
    --change-name 0:"BIOS boot partition" "$usb_dev" || cleanUp 10

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
		sgdisk --hybrid 2:3:4 "$usb_dev" || cleanUp 10
	else
		sgdisk --hybrid 2:3 "$usb_dev" || cleanUp 10
	fi
fi

# Set bootable flag for ISO partion
sgdisk --attributes ${iso_part}:set:2 "$usb_dev" || cleanUp 10

# Unmount device
unmountUSB "$usb_dev"

# Wipe BIOS boot partition
wipefs -af "${usb_dev}${boot_part}" || true

# Format EFI System partition
if [ "$eficonfig" -eq 1 ]; then
	wipefs -af "${usb_dev}2" || true
	mkfs.vfat -v -n "EFI" -F 32 "${usb_dev}2" || cleanUp 10
fi

# Wipe DATA and ISO partitions
wipefs -af "${usb_dev}1" || true
wipefs -af "${usb_dev}${iso_part}" || true

# Format DATA partition
if [ "$data_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	mkfs -t "$data_fmt" -f -L "DATA" "${usb_dev}1" || cleanUp 10
else
    if [ "$data_fmt" = "vfat" ] || [ "$data_fmt" = "exfat" ]; then
        label="-n DATA"
    else
        label="-L DATA"
    fi
	eval mkfs -t "$data_fmt" "${label}" "${usb_dev}1"    || cleanUp 10
fi
# Format ISO partition
if [ "$iso_fmt" = "ntfs" ]; then
	# Use mkntfs quick format
	mkfs -t "$iso_fmt" -f -L "DATA" "${usb_dev}${iso_part}" || cleanUp 10
else
    if [ "$iso_fmt" = "vfat" ] || [ "$iso_fmt" = "exfat" ]; then
        label="-n ISO"
    else
        label="-L ISO"
    fi
	eval mkfs -t "$iso_fmt" "${label}" "${usb_dev}${iso_part}"    || cleanUp 10
fi

# Unmount device
unmountUSB "$usb_dev"

# Create temporary directories
efi_mnt=$(mktemp -p "$tmp_dir" -d efi.XXXX)   || cleanUp 10
iso_mnt=$(mktemp -p "$tmp_dir" -d data.XXXX) || cleanUp 10
repo_dir=$(mktemp -p "$tmp_dir" -d repo.XXXX) || cleanUp 10

# Mount EFI System partition
[ "$eficonfig" -eq 1 ] && \
    { mount "${usb_dev}2" "$efi_mnt" || cleanUp 10; }

# Mount ISO partition
mount "${usb_dev}${iso_part}" "$iso_mnt" || cleanUp 10

# Install GRUB for EFI
[ "$eficonfig" -eq 1 ] && \
    { $grub_cmd --target=x86_64-efi --efi-directory="$efi_mnt" \
    --boot-directory="${iso_mnt}/${iso_subdir}" --removable --recheck \
    || cleanUp 10; }

# Install GRUB for BIOS
$grub_cmd --force --target=i386-pc \
    --boot-directory="${iso_mnt}/${iso_subdir}" --recheck "$usb_dev" \
    || cleanUp 10

# Install fallback GRUB
$grub_cmd --force --target=i386-pc \
    --boot-directory="${iso_mnt}/${iso_subdir}" --recheck "${usb_dev}${iso_part}" \
    || true

# Create necessary directories
mkdir -p "${iso_mnt}/${iso_subdir}/isos" || cleanUp 10

if [ "$clone" -eq 1 ]; then
	# Clone Git repository
	(cd "$repo_dir" && \
		git clone https://github.com/aguslr/multibootusb . && \
		# Move all visible and hidden files and folders except '.' and '..'
		for x in * .[!.]* ..?*; do if [ -e "$x" ]; then mv -- "$x" \
			"${iso_mnt}/${iso_subdir}"/grub*/; fi; done) \
	    || cleanUp 10
else
	# Copy files
	cp -R ./mbusb.* "${iso_mnt}/${iso_subdir}"/grub*/ \
	    || cleanUp 10
	# Copy example configuration for GRUB
	cp ./grub.cfg.example "${iso_mnt}/${iso_subdir}"/grub*/ \
	    || cleanUp 10
fi

# Rename example configuration
( cd "${iso_mnt}/${iso_subdir}"/grub*/ && cp grub.cfg.example grub.cfg ) \
    || cleanUp 10

# Download memdisk
syslinux_url='https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz'
{ wget -qO - "$syslinux_url" 2>/dev/null || curl -sL "$syslinux_url" 2>/dev/null; } \
    | tar -xz -C "${iso_mnt}/${iso_subdir}"/grub*/ --no-same-owner --strip-components 3 \
    'syslinux-6.03/bios/memdisk/memdisk' \
    || cleanUp 10

# Clean up and exit
cleanUp
