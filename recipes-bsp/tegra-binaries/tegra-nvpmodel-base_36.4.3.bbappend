FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://nvpmodel_p3767_0003_super_custom.conf"

do_install:append() {
    install -m 0644 ${WORKDIR}/sources-unpack/nvpmodel_p3767_0003_super_custom.conf ${D}${sysconfdir}/nvpmodel.conf
}