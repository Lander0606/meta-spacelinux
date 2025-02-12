# Ensure that every image has at least a ssh server
IMAGE_FEATURES += "ssh-server-openssh"

LICENSE = "MIT"

inherit core-image

inherit nopackages

CORE_IMAGE_BASE_INSTALL += "packagegroup-spacelinux-base"
CORE_IMAGE_BASE_INSTALL += "${@'packagegroup-spacelinux-systemd' if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'systemd' else ''}"
#TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-cuda-sdk-host"