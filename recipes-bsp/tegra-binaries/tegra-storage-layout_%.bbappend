OVERRIDES .= ":${IMAGE_TEGRAFLASH_FS_TYPE}"

FILESEXTRAPATHS:prepend:btrfs := "${THISDIR}/files:"
SRC_URI:btrfs += "file://flash-orin-nano-custom-raid-layout.xml"
PARTITION_LAYOUT_TEMPLATE:btrfs = "flash-orin-nano-custom-raid-layout.xml"

do_compile:prepend:btrfs() {
    cp ${WORKDIR}/flash-orin-nano-custom-raid-layout.xml ${B}/flash-orin-nano-custom-raid-layout.xml || bberror "Kopieerfout!"
}
PARTITION_FILE:btrfs = "${B}/flash-orin-nano-custom-raid-layout.xml"