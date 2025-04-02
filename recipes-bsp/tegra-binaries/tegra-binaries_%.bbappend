python do_unpack:append() {
    import subprocess
    import os
    
    s = d.getVar('S')
    filepath = os.path.join(s, "bootloader/tegra234-mb1-bct-misc-common.dtsi")
    
    if os.path.isfile(filepath):
        subprocess.run(['sed', '-i', '3i #define DISABLE_UART_MB1_MB2 1', filepath])
}