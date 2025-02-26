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
SPACELINUX_DISTRO_FEATURES = "acl ext2 ipv4 ipv6 usbgadget usbhost xattr nfs zeroconf pci 3g vfat seccomp largefile opengl ptest vulkan systemd pam virtualization usrmerge gobject-introspection-data ldconfig"
DISTRO_FEATURES ?= "${SPACELINUX_DISTRO_FEATURES}"

# Remove machine features
MACHINE_FEATURES:remove = "alsa wifi bluetooth"

# CPU 4 and 5 are tickless (adaptive tick mode)
KERNEL_ARGS:append = " nohz_full=4,5"

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
USE_REDUNDANT_FLASH_LAYOUT_DEFAULT ?= "1"

# Set the filesystem to btrfs (EXPERIMENTAL)
IMAGE_TEGRAFLASH_FS_TYPE = "btrfs"

# Enable RAID to enable data scrubbing with NVIDIA filesystem redundancy
#EXTRA_IMAGECMD:append:btrfs = "-d raid1 -m raid1 /dev/mmcblk0p1 /dev/mmcblk0p2"