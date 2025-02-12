SUMMARY = "Standard full-featured SpaceLinux system"
DESCRIPTION = "Packagegroup providing basic functionality for the SpaceLinux images"

LICENSE = "MIT"

inherit packagegroup

# TODO: change the packages where needed, this serves as template from core-image-full-cmdline

PACKAGES = "\
    packagegroup-spacelinux-full-cmdline \
    packagegroup-spacelinux-full-cmdline-utils \
    packagegroup-spacelinux-full-cmdline-extended \
    packagegroup-spacelinux-full-cmdline-dev-utils \
    packagegroup-spacelinux-full-cmdline-multiuser \
    packagegroup-spacelinux-full-cmdline-initscripts \
    packagegroup-spacelinux-full-cmdline-sys-services \
    "

RDEPENDS:${PN} = "\
    packagegroup-spacelinux-full-cmdline-utils \
    packagegroup-spacelinux-full-cmdline-extended \
    packagegroup-spacelinux-full-cmdline-dev-utils \
    packagegroup-spacelinux-full-cmdline-multiuser \
    packagegroup-spacelinux-full-cmdline-initscripts \
    packagegroup-spacelinux-full-cmdline-sys-services \
    strace \
    tegra-tools-tegrastats \
    "

RDEPENDS:packagegroup-spacelinux-full-cmdline-utils = "\
    bash \
    acl \
    attr \
    bc \
    coreutils \
    cpio \
    e2fsprogs \
    ed \
    file \
    findutils \
    gawk \
    grep \
    less \
    makedevs \
    mc \
    mc-shell \
    mc-helpers \
    mc-helpers-perl \
    ncurses \
    net-tools \
    procps \
    psmisc \
    sed \
    tar \
    time \
    util-linux \
    "

RDEPENDS:packagegroup-spacelinux-full-cmdline-extended = "\
    iproute2 \
    iputils \
    iptables \
    module-init-tools \
    openssl \
    "

RDEPENDS:packagegroup-spacelinux-full-cmdline-dev-utils = "\
    diffutils \
    m4 \
    make \
    patch \
    "

VIRTUAL-RUNTIME_syslog ?= "sysklogd"
RDEPENDS:packagegroup-spacelinux-full-cmdline-initscripts = "\
    ${VIRTUAL-RUNTIME_initscripts} \
    ${VIRTUAL-RUNTIME_init_manager} \
    ethtool \
    ${VIRTUAL-RUNTIME_login_manager} \
    ${VIRTUAL-RUNTIME_syslog} \
    "

RDEPENDS:packagegroup-spacelinux-full-cmdline-multiuser = "\
    bzip2 \
    cracklib \
    gzip \
    shadow \
    sudo \
    "

RDEPENDS:packagegroup-spacelinux-full-cmdline-sys-services = "\
    at \
    cronie \
    logrotate \
    ${@bb.utils.contains('DISTRO_FEATURES', 'nfs', 'nfs-utils rpcbind', '', d)} \
    "
