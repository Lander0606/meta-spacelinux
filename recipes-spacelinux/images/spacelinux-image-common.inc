# Ensure that every image has at least a ssh server and package manager like dnf
IMAGE_FEATURES += "ssh-server-openssh package-management"

LICENSE = "MIT"

# Inherit all functionality of an image
inherit core-image

CORE_IMAGE_BASE_INSTALL += "packagegroup-spacelinux-systemd"

# Only install a rootfs, no individual packages (.rpm etc)
inherit nopackages

# Add some extra packages to the images
IMAGE_INSTALL:append = " htop btrfs-tools gptfdisk"

# IMAGE_CMD:btrfs:override () {
# 	size=${ROOTFS_SIZE}
# 	if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
# 		size=${MIN_BTRFS_SIZE}
# 		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
# 	fi
# 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.btrfs seek=${size} count=0 bs=1024
# 	mkfs.btrfs -d raid1 -m raid1 -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}_part1.btrfs ${IMGDEPLOYDIR}/${IMAGE_NAME}_part2.btrfs
# }