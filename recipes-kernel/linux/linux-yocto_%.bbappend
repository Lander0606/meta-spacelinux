FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://remove_other_platforms.cfg \
            file://enable_full_preemptible.cfg \
            file://remove_unneccessary_drivers.cfg \
            file://enable_crypto_and_integrity.cfg \
            "