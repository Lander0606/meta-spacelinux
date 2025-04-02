PACKAGECONFIG:append = " networkd resolved"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://00-eth0.network \
    file://systemd-networkd-wait-online.service \
"


FILES_${PN} += " \
    ${sysconfdir}/systemd/network/eth0.network \
"

do_install:append(){
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/sources-unpack/00-eth0.network ${D}${sysconfdir}/systemd/network

    install -d ${D}/${systemd_unitdir}/system/ 
    install -m 0644 ${WORKDIR}/sources-unpack/systemd-networkd-wait-online.service ${D}/${systemd_unitdir}/system/ 
}

