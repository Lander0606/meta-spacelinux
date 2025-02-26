FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"
SRC_URI:append = " file://0001-fstab-btrfs.patch"

do_install:append () {
    chown -R root:root ${D}/root ${D}/home ${D}/mnt ${D}/media ${D}/srv ${D}/var ${D}/etc ${D}/usr
    chmod 700 ${D}/root
    chmod 1777 ${D}/tmp
}