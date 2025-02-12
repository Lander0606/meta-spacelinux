DESCRIPTION = "SpaceLinux base image"

require spacelinux-image-common.inc

CORE_IMAGE_BASE_INSTALL += "packagegroup-spacelinux-base"
CORE_IMAGE_BASE_INSTALL += "${@'packagegroup-spacelinux-systemd' if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'systemd' else ''}"
#TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-cuda-sdk-host"