FILESEXTRAPATHS:prepend := "${TOPDIR}/../layers/meta-tegra/recipes-kernel/linux/linux-yocto:"
FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"

require ${@'${TOPDIR}/../layers/meta-tegra/recipes-kernel/linux/tegra-kernel.inc' if 'tegra' in d.getVar('MACHINEOVERRIDES').split(':') else ''}

SRC_URI:append:tegra = " \
    file://0001-memory-tegra-Add-Tegra234-clients-for-RCE-and-VI.patch \
    file://0002-hwmon-ina3221-Add-support-for-channel-summation-disa.patch \
    file://0003-cpufreq-tegra194-save-CPU-data-to-avoid-repeated-SMP.patch \
    file://0004-cpufreq-tegra194-use-refclk-delta-based-loop-instead.patch \
    file://0005-cpufreq-tegra194-remove-redundant-AND-with-cpu_onlin.patch \
    file://0006-fbdev-simplefb-Support-memory-region-property.patch \
    file://0007-fbdev-simplefb-Add-support-for-generic-power-domains.patch \
    file://0008-UBUNTU-SAUCE-PCI-endpoint-Add-core_deinit-callback-s.patch \
    file://0009-NVIDIA-SAUCE-soc-tegra-pmc-Add-sysfs-nodes-to-select.patch \
    file://tegra.cfg \
    file://tegra-drm.cfg \
    file://tegra-governors.cfg \
    file://tegra-pcie.cfg \
    file://tegra-scsi-ufs.cfg \
    file://tegra-usb.cfg \
    file://r8169.cfg \
"

SRC_URI:append:tegra = " \
    file://0001-Add-Kconfig-prompt-for-MMU-NOTIFIER.patch \
    file://0002-Disable-broadcast-ticks-via-IPI-to-core-4-and-5.patch \
    file://remove_other_platforms.cfg \
    file://enable_full_preemptible.cfg \
    file://remove_unneccessary_drivers.cfg \
    file://enable_crypto_and_integrity.cfg \
    file://remove_bt_wifi.cfg \
    file://disable_unneccessary_filesystems.cfg \
    file://fix_nvidia_oot.cfg \
"

COMPATIBLE_MACHINE:tegra = "(tegra)"
KMACHINE:tegra = "genericarm64"

KERNEL_FEATURES:append:tegra = " \
    features/i2c/i2c.scc \
    features/usb/serial.scc \
    features/usb/usb-raw-gadget.scc \
    features/usb/xhci-hcd.scc \
"