# Ensure that every image has at least a ssh server
IMAGE_FEATURES += "ssh-server-openssh"

LICENSE = "MIT"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-spacelinux-base \
    packagegroup-spacelinux-systemd \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

# Inherit all functionality of an image
inherit core-image

# Only install a rootfs, no individual packages (.rpm etc)
inherit nopackages