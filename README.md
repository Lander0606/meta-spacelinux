# Yocto Spacelinux Distro

Space-applications embedded Linux distribution for **NVIDIA Jetson platforms** using Yocto Project tools and the [meta-tegra](https://github.com/OE4T/meta-tegra) BSP layer. The development of this distribution is part of a master's thesis ["Design and simplification of a Linux Operating System (OS) for space"](https://github.com/michielskobe/thesis-linux-in-space). This research is done in the context of the Master of Science program in the field of Electronics - ICT with specialization in software systems at KU Leuven in Leuven, Belgium.

## Features
- Stripped and lightweight version of Linux LTS kernel 6.6
- Optimizations for realtime applications (see wiki)
- Optimized, RAID1-enabled `btrfs` filesystem
- GPT partition table protection
- Extremely fast boottimes to keep uptime high
- swupdate-ready

## Prerequisites
See the [Yocto Project Quick Build documentation](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) for information on setting up a build host. This layer has been tested with Ubuntu (22.04 / 24.04) and Fedora (40 / 41 / 42) as build host.

Since this distribution is created for NVIDIA Jetson platforms, the `meta-tegra` layer containing the BSP for the NVIDIA Tegra SoC family also needs to be cloned. Refer to the [meta-tegra repository](https://github.com/OE4T/meta-tegra) for information on how to properly install this layer. Ensure that the cloned branch of `meta-tegra` is the same as the installed release of the Yocto Project and is supported by this distro.

**Important notes:** 
- This `meta-spacelinux` layer is only compatible with the `scarthgap`, `styhead` and `walnascar` release of the Yocto Project/Poky.
- The `spacelinux` distro only supports boards in the **NVIDIA Tegra SoC family**, this choice has been made to reduce the size and complexity of the kernel in the context of the [research](https://github.com/michielskobe/thesis-linux-in-space) this distro originates from.

## Set up

- Clone this repository into the project directory. It is a good practice to create a folder `layers` and contain all layers in there, including this `meta-spacelinux` layer.

```bash
$ git clone https://github.com/Lander0606/meta-spacelinux/
```

- Change to a new branch if needed. Other branches support other versions of the Yocto Project.

- Clone the `meta-openembedded` layer into the `layers` directory of the project. Some handy applications from this layer are used in the distro. From `meta-openembedded`, only `meta-oe` is required.

- Add the `meta-spacelinux` and `meta-oe` layer to `bblayers.conf` in the `build` directory.

``` diff
BBLAYERS ?= " \
  <project-dir>/poky/meta \
  <project-dir>/poky/meta-poky \
  <project-dir>/poky/meta-yocto-bsp \
  <project-dir>/layers/meta-tegra \
+ <project-dir>/layers/meta-openembedded/meta-oe \ 
+ <project-dir>/layers/meta-spacelinux \
  "
```

## Images

The `spacelinux` distribution includes the following image recipe:

| Image name | Description |
| ---------- | ----------- |
| spacelinux-image-base | Base image featuring all device drivers, a cmdline interface and ssh |

## Issues

Use the [Issues](https://github.com/Lander0606/meta-spacelinux/issues) tab for reporting build or runtime issues with Spacelinux Yocto build targets. When reporting build or runtime issues, please include as much information about your environment as you can. For example, the target hardware you are building for, branch/version information, etc.