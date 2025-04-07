FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Disable-unused-pcie-devices.patch;patchdir=hardware/nvidia/t23x/nv-public"

