python do_unpack:append() {
    import os
    import subprocess

    s = d.getVar('UNPACKDIR')
    filepath = os.path.join(s, "init-boot.sh")

    if os.path.isfile(filepath):
        subprocess.run(['sed', '-i', '14i btrfs device scan', filepath])
}