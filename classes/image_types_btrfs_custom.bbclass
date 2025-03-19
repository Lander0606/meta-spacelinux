inherit image_types

IMAGE_CMD:btrfs() {
    size=${ROOTFS_SIZE}
    if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
        size=${MIN_BTRFS_SIZE}
        bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
    fi
    
    # Create two .btrfs files with same size
    dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}_part1.btrfs seek=${size} count=0 bs=1024
    dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}_part2.btrfs seek=${size} count=0 bs=1024
    
    # Create btrfs filesystems from the previous created files
    mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}_part1.btrfs
    mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}_part2.btrfs
    
    # Create symlinks for the two btrfs partitions (like the Yocto convention)
    cd ${IMGDEPLOYDIR}
    ln -sf ${IMAGE_NAME}_part1.btrfs ${IMAGE_LINK_NAME}_part1.btrfs
    ln -sf ${IMAGE_NAME}_part2.btrfs ${IMAGE_LINK_NAME}_part2.btrfs
}