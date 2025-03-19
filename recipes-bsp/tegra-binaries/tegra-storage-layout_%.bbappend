FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://flash-orin-nano-custom-raid-layout.xml"
PARTITION_LAYOUT_TEMPLATE = "flash-orin-nano-custom-raid-layout.xml"

do_compile:prepend() {
    cp ${WORKDIR}/sources-unpack/flash-orin-nano-custom-raid-layout.xml ${B}/flash-orin-nano-custom-raid-layout.xml || bberror "Kopieerfout!"
}
PARTITION_FILE = "${B}/flash-orin-nano-custom-raid-layout.xml"