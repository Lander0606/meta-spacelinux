python do_unpack:append() {
    import subprocess
    import os
    
    s = d.getVar('S')
    
    if os.path.isfile(os.path.join(s, "bootloader/tegra234-mb1-bct-misc-common.dtsi")):
        subprocess.run(['sed', '-i', '3i #define DISABLE_UART_MB1_MB2 1', os.path.join(s, "bootloader/tegra234-mb1-bct-misc-common.dtsi")])

    if os.path.isfile(os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dtb")):
        subprocess.run(['dtc', '-I', 'dtb', '-O', 'dts', '-o', os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dts"), os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dtb")])
        subprocess.run(['sed', '-i', '1028,1033d', os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dts")])
        subprocess.run(['dtc', '-I', 'dts', '-O', 'dtb', '-o', os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dtb"), os.path.join(s, "bootloader/generic/tegra234-bpmp-3701-0000-as-3767-0000-3737-0000.dts")])
}