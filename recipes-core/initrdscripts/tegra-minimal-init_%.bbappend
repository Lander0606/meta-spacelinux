python do_unpack:append() {
    import os
    import subprocess

    s = d.getVar('UNPACKDIR')
    filepath = os.path.join(s, "init-boot.sh")

    if os.path.isfile(filepath):
        subprocess.run(['sed', '-i', r's|    if mount -t "${fstype}" -o "${opt}" "${rootdev}" /mnt; then|    if mount -t "${fstype}" -o degraded,"${opt}" "${rootdev}" /mnt; then|', filepath])
}