FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"
SRC_URI:append = " file://0001-fstab-btrfs.patch"

fix_permissions_basefiles() {
    for d in /root /home /mnt /media /srv /var /etc /usr; do
        [ -d ${D}$d ] || mkdir -p ${D}$d
    done
    chown -R root:root ${D}/root ${D}/home ${D}/mnt ${D}/media ${D}/srv ${D}/var ${D}/etc ${D}/usr
    chmod 700 ${D}/root
    chmod 1777 ${D}/tmp
}

do_install[postfuncs] += "fix_permissions_basefiles"