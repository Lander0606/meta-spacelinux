SUMMARY = "Standard full-featured SpaceLinux system"
DESCRIPTION = "Packagegroup providing basic functionality for the SpaceLinux images"

LICENSE = "MIT"

inherit packagegroup

# TODO: change the packages where needed, this serves as template from core-image-full-cmdline
# Maybe have a look at the poky packagegroup-base to see which packages we want to include

PACKAGES = "\
    packagegroup-spacelinux-base \
    packagegroup-spacelinux-base-utils \
    packagegroup-spacelinux-base-extended \
    packagegroup-spacelinux-base-dev-utils \
    packagegroup-spacelinux-base-multiuser \
    packagegroup-spacelinux-base-initscripts \
    packagegroup-spacelinux-base-sys-services \
    "

RDEPENDS:${PN} = "\
    packagegroup-spacelinux-base-utils \
    packagegroup-spacelinux-base-extended \
    packagegroup-spacelinux-base-dev-utils \
    packagegroup-spacelinux-base-multiuser \
    packagegroup-spacelinux-base-initscripts \
    packagegroup-spacelinux-base-sys-services \
    strace \
    tegra-tools-tegrastats \
    ${MACHINE_EXTRA_RDEPENDS} \
    "

RRECOMMENDS:${PN} = "${MACHINE_EXTRA_RRECOMMENDS}"

RDEPENDS:packagegroup-spacelinux-base-utils = "\
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

RDEPENDS:packagegroup-spacelinux-base-extended = "\
    iproute2 \
    iputils \
    iptables \
    module-init-tools \
    openssl \
    "

RDEPENDS:packagegroup-spacelinux-base-dev-utils = "\
    diffutils \
    m4 \
    make \
    patch \
    "

VIRTUAL-RUNTIME_syslog ?= "sysklogd"
RDEPENDS:packagegroup-spacelinux-base-initscripts = "\
    ${VIRTUAL-RUNTIME_initscripts} \
    ${VIRTUAL-RUNTIME_init_manager} \
    ethtool \
    ${VIRTUAL-RUNTIME_login_manager} \
    ${VIRTUAL-RUNTIME_syslog} \
    "

RDEPENDS:packagegroup-spacelinux-base-multiuser = "\
    bzip2 \
    cracklib \
    gzip \
    shadow \
    sudo \
    "

RDEPENDS:packagegroup-spacelinux-base-sys-services = "\
    at \
    cronie \
    logrotate \
    ${@bb.utils.contains('DISTRO_FEATURES', 'nfs', 'nfs-utils rpcbind', '', d)} \
    "
