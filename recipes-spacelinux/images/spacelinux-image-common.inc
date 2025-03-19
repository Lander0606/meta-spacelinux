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

# Create two identical filesystem files (for the two partitions)
inherit image_types_btrfs_raid1

# Add extra files to tegraflash
inherit image_types_tegra

IMAGE_TEGRAFLASH_ROOTFS = "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}_part1.${IMAGE_TEGRAFLASH_FS_TYPE}"

tegraflash_custom_pre() {    
    # Copy the second rootfs partition
    cp "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}_part2.${IMAGE_TEGRAFLASH_FS_TYPE}" ./${IMAGE_BASENAME}_part2.${IMAGE_TEGRAFLASH_FS_TYPE}

    # Add a raid1 flash script
    cp ${SCRIPTS_DIR}/flash-btrfs-raid-image.sh ./flash-btrfs-raid-image.sh
    chmod +x flash-btrfs-raid-image.sh
}

tegraflash_custom_post() {
    # Rename the first partitions name in the tegraflash tarball
    mv "./${IMAGE_BASENAME}.${IMAGE_TEGRAFLASH_FS_TYPE}" "./${IMAGE_BASENAME}_part1.${IMAGE_TEGRAFLASH_FS_TYPE}"
}