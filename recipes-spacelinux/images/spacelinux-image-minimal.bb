DESCRIPTION = "SpaceLinux minimal image"

# Add ethernet drivers to the minimal image
# CORE_IMAGE_EXTRA_INSTALL contains packages defined in the builds local.conf
IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} kernel-module-r8168 kernel-module-r8169 kernel-module-realtek linux-firmware-rtl8168"

require spacelinux-image-common.inc
