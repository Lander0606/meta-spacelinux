FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"
SRC_URI:append = "${@' file://0001-fstab-btrfs.patch' if IMAGE_TEGRAFLASH_FS_TYPE == 'btrfs' else ''}"