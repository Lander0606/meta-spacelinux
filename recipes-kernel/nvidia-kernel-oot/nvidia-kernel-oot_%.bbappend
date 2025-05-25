FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Disable-unused-pcie-devices.patch \
            file://0002-Enable-tegra-security-engine-hashing.patch;patchdir=hardware/nvidia/t23x/nv-public \
            "