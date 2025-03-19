SUMMARY = "GPT partition table utility scripts"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://part-table-backup.sh \
           file://part-table-repair.sh \
           file://part-table-check.sh \
           file://partition-check.service \
           file://partition-check.timer"

inherit systemd

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

RDEPENDS:${PN} += "bash gptfdisk"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/part-table-backup.sh ${D}${bindir}/part-table-backup.sh
    install -m 0755 ${S}/part-table-repair.sh ${D}${bindir}/part-table-repair.sh
    install -m 0755 ${S}/part-table-check.sh ${D}${bindir}/part-table-check.sh

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${S}/partition-check.service ${D}${systemd_unitdir}/system/partition-check.service
    install -m 0644 ${S}/partition-check.timer ${D}${systemd_unitdir}/system/partition-check.timer
}

FILES:${PN} += "${bindir}/part-table-backup.sh"
FILES:${PN} += "${bindir}/part-table-repair.sh"
FILES:${PN} += "${bindir}/part-table-check.sh"
FILES:${PN} += "${systemd_unitdir}/system/partition-check.service"
FILES:${PN} += "${systemd_unitdir}/system/partition-check.timer"

SYSTEMD_SERVICE:${PN} = "partition-check.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"