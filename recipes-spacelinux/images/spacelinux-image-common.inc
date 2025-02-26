# Ensure that every image has at least a ssh server and package manager like dnf
IMAGE_FEATURES += "ssh-server-openssh package-management"

LICENSE = "MIT"

# Inherit all functionality of an image
inherit core-image

CORE_IMAGE_BASE_INSTALL += "packagegroup-spacelinux-systemd"

# Only install a rootfs, no individual packages (.rpm etc)
inherit nopackages

# Workaround for the fact that the rootfs is owned by the user that built the image
fix_final_ownership () {
    chown -R root:root ${IMAGE_ROOTFS}
}
do_image[postfuncs] += "fix_final_ownership"
