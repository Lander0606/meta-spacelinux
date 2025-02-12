# Yocto Spacelinux Distro

Space-applications embedded Linux distribution for **NVIDIA Jetson platforms** using Yocto Project tools and the [meta-tegra](https://github.com/OE4T/meta-tegra) BSP layer. The development of this distribution is part of a master's thesis ["Design and simplification of a Linux Operating System (OS) for space"](https://github.com/michielskobe/thesis-linux-in-space). This research is done in the context of the Master of Science program in the field of Electronics - ICT with specialization in software systems at KU Leuven in Leuven, Belgium.

## Prerequisites
See the [Yocto Project Quick Build documentation](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) for information on setting up a build host.

**Important notes:** 
- This `meta-spacelinux` layer is only compatible with the `scarthgap` and `styhead` release of the Yocto Project/Poky.
- The `spacelinux` distro only supports boards in the **NVIDIA Tegra SoC family**, this choice has been made to reduce the size and complexity of the kernel

## Set up

- Clone this repository into the project directory. It is a good practice to create a folder `layers` and contain all layers in there, including this `meta-spacelinux` layer.

```
$ git clone https://github.com/Lander0606/meta-spacelinux/
```

- Change to a new branch if needed. Other branches feature other versions of the distro. For now, only 2 branches exist: the main branch features a stable distro based on **Linux kernel 6.6**. The _kernel-6.12_ branch features the current testing version of the distro based on the newest LTS release **Linux kernel 6.12**.

## Images

The `spacelinux` distribution includes the following image recipe(s):

| Image name | Description |
| ---------- | ----------- |
| spacelinux-image-base | Base image featuring all device drivers, a cmdline interface and ssh |