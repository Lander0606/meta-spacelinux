DESCRIPTION = "Packagegroup for inclusion in all SpaceLinux images"

LICENSE = "MIT"

inherit packagegroup

RDEPENDS:${PN} = " \
    procps \
    strace \
    tegra-tools-tegrastats \
"