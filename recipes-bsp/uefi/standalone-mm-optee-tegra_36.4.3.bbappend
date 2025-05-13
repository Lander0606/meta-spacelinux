FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://0001-Makefile-fix-for-GCC14.patch"

python do_convert_crlf () {
    import glob, os
    for fn in glob.glob(os.path.join(d.getVar('S'),
        'BaseTools/Source/C/VfrCompile/Pccts', '*', 'makefile')):
        with open(fn, 'rb') as f:
            data = f.read().replace(b'\r\n', b'\n')
        with open(fn, 'wb') as f:
            f.write(data)
}
addtask convert_crlf before do_patch after do_unpack