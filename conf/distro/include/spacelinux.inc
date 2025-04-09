DISTRO = "spacelinux"
DISTRO_NAME = "SpaceLinux (Tegra Linux for Space)"
DISTRO_VERSION_BASE = "1.0.3"
DISTRO_VERSION = "${DISTRO_VERSION_BASE}+snapshot-${DATE}"
DISTRO_CODENAME = "master"
SDK_VENDOR = "-slsdk"
SDK_VERSION := "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot')}"

MAINTAINER = "[KU Leuven - Campus Group T] Lander Van Loock & Kobe Michiels"

TARGET_VENDOR = "-oe4t"

# New ${DISTRO}-<version> setting for sanity checks.
# Increment version number (and the corresponding
# setting int the template bblayers.conf.sample file)
# each time the layer settings are changed.
REQUIRED_TD_BBLAYERS_CONF_VERSION = "${DISTRO}-5"

LOCALCONF_VERSION = "2"

# Default: SPACELINUX_DISTRO_FEATURES = "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp largefile opengl ptest multiarch vulkan systemd pam virtualization usrmerge systemd usrmerge pulseaudio gobject-introspection-data ldconfig"
SPACELINUX_DISTRO_FEATURES = "acl ipv4 ipv6 usbgadget usbhost xattr zeroconf pci vfat seccomp largefile ptest systemd pam usrmerge gobject-introspection-data ldconfig"
DISTRO_FEATURES ?= "${SPACELINUX_DISTRO_FEATURES}"

# Remove machine features
MACHINE_FEATURES:remove = "alsa wifi bluetooth ext2 cuda"

# Remove unused machine recommended/depends modules
MACHINE_EXTRA_RDEPENDS:remove = " nvidia-kernel-oot-display"
MACHINE_EXTRA_RRECOMMENDS:remove = " kernel-module-snd-hda-tegra kernel-module-snd-hda-codec-hdmi nvidia-kernel-oot-cameras nvidia-kernel-oot-canbus kernel-module-rtk-btusb kernel-module-rtw88-8822ce linux-firmware-rtl8822"

# CPU 4 and 5 are tickless (adaptive tick mode)
# KERNEL_ARGS:append = " nohz_full=1,3,5 isolcpus=1,3,5 irqaffinity=0,2,4"

# Spacelinux uses the newer linux-yocto kernel
# Prefer the newest kernel if available
PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
PREFERRED_VERSION_linux-yocto ?= "6.12%"
PREFERRED_VERSION_linux-yocto-rt ?= "6.12%"

SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"

PACKAGE_CLASSES ?= "package_rpm"

SANITY_TESTED_DISTROS ?= " \
            fedora-40 \n \
            fedora-41 \n \
            ubuntu-20.04 \n \
            ubuntu-22.04 \n \
            ubuntu-24.04 \n \
            "

# Most NVIDIA-supplied services expect systemd
INIT_MANAGER = "systemd"

require conf/distro/include/no-static-libs.inc
require conf/distro/include/yocto-uninative.inc
require conf/distro/include/security_flags.inc
INHERIT += "uninative"

LICENSE_FLAGS_ACCEPTED += "commercial_faad2 commercial_x264"

# Enable/disable filesystem redundancy
USE_REDUNDANT_FLASH_LAYOUT_DEFAULT = "1"

# Set the filesystem to btrfs
IMAGE_TEGRAFLASH_FS_TYPE = "btrfs"

# Change the commands for the btrfs filesystem generation
EXTRA_IMAGECMD:append:btrfs = " --csum sha256"
EXTRA_IMAGECMD:remove:btrfs = " --shrink"

# Filesystem label (for RAID configurations)
SPACELINUX_FS_LABEL = "raidrootfs"

# Add rootfs kernel args
KERNEL_ARGS:append = " root=/dev/mmcblk0p1 rootfstype=btrfs rootwait"

# Add btrfs progs to the initramfs to allow multi device mouting
TEGRA_INITRD_INSTALL:append = "btrfs-tools"

# Enable swupdate
#IMAGE_INSTALL:append = " swupdate"
#USE_REDUNDANT_FLASH_LAYOUT = "1"
IMAGE_FSTYPES:append = " tar.gz"
#SWUPDATE_CORE_IMAGE_NAME = "spacelinux-image-base"

#CONFIG_BTRFS_FILESYSTEM = "${@'1' if IMAGE_TEGRAFLASH_FS_TYPE == 'btrfs' else "0"}"
#IMAGE_FSTYPES:append = "${@' btrfs' if IMAGE_TEGRAFLASH_FS_TYPE == 'btrfs' else ''}"
#ROOTFS_FILENAME ?= "${@'${SWUPDATE_CORE_IMAGE_NAME}-${MACHINE}.rootfs.btrfs' if IMAGE_TEGRAFLASH_FS_TYPE == 'btrfs' else "${SWUPDATE_CORE_IMAGE_NAME}-${MACHINE}.rootfs.tar.gz"}"

# KERNEL_ARGS:append = " initcall_debug"
KERNEL_ARGS:append = " quiet"