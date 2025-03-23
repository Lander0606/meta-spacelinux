# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://github.com/michielskobe/sw_ecc_protection.git;protocol=https;branch=main \
           file://0001-Updated-Makefile.patch \
           "

# Modify these as desired
PV = "1.0+git"
SRCREV = "613236bda489010943ff4a528c3baa93902466dc"

S = "${WORKDIR}/git"

inherit module

EXTRA_OEMAKE:append:task-install = " -C ${STAGING_KERNEL_DIR} M=${S}"
# Kernel path in install makefile is hardcoded - you will need to patch the makefile. Note that the variable KERNEL_SRC will be passed in as the kernel source path.
