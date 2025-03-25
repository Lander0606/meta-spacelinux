FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:tegra = " \
    file://remove_other_platforms.cfg \
    file://enable_full_preemptible.cfg \
    file://remove_unneccessary_drivers.cfg \
    file://enable_crypto_and_integrity.cfg \
    file://remove_bt_wifi.cfg \
    file://disable_unneccessary_filesystems.cfg \
"

SRC_URI:remove:tegra = " \
    file://tegra-sound.cfg \
    file://tegra-v4l2.cfg \
    file://rtw8822ce-wifi.cfg \
"