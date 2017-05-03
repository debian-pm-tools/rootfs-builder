# Reference rootfs builder

This live-build configuration is used to build the reference rootfs

# Dependencies

* qemu-user-static
* live-build

# How to

Currently live-build in debian stretch and newer has a bug that will prevent you from building this rootfs.
Shadeslayer has created a patch that fixes this problem, so please use live-build from [here](https://github.com/JBBgameich/live-build), or apply [the](https://lists.debian.org/debian-live/2016/12/msg00016.html) patch manually.

Run script `build.sh` to build the live image.

# Rootfs

Current rootfs is based Debian Stretch (9), and has systemd as main init system
