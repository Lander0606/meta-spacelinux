FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:tegra = " \
    file://0001-Add-Kconfig-prompt-for-MMU-NOTIFIER.patch \
    file://remove_other_platforms.cfg \
    file://enable_full_preemptible.cfg \
    file://remove_unneccessary_drivers.cfg \
    file://enable_crypto_and_integrity.cfg \
    file://remove_bt_wifi.cfg \
    file://disable_unneccessary_filesystems.cfg \
    file://fix_nvidia_oot.cfg \
"

# Note: tegra-drm.cfg could be deleted, but due to it's
# many dependencies it's better to just let it enabled.
# Virtualization has a much bigger influence on the kernel
# performance than tegra-drm and the build modules are
# excluded in the final image.

SRC_URI:remove:tegra = " \
    file://tegra-virtualization.cfg \
    file://tegra-sound.cfg \
    file://tegra-v4l2.cfg \
    file://rtw8822ce-wifi.cfg \
"

KERNEL_FEATURES:remove:tegra = " \
    features/bluetooth/bluetooth.scc \
    features/bluetooth/bluetooth-usb.scc \
    features/input/touchscreen.scc \
    features/media/media.scc \
    features/media/media-platform.scc \
    features/media/media-usb-webcams.scc \
"
