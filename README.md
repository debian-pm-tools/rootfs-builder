# Reference rootfs builder

This live-build configuration is used to build the reference rootfs

# Dependencies

* qemu-user-static
* live-build

# How to
Please include your public gpg key in customization/package-lists/localhost.key, and add the key ID into repo/conf/distributions.
You can add your own builds of libhybris, android-headers etc into the packages folder. The script will automatically import them into an apt repository and install them inside the rootfs.

Currently live-build in debian stretch and newer has a bug that will prevent you from building this rootfs.
Shadeslayer has created a patch that fixes this problem, so please use live-build from [here](https://github.com/JBBgameich/live-build), or apply [the](https://lists.debian.org/debian-live/2016/12/msg00016.html) patch manually.

Run script `build.sh` to build the live image.

# Rootfs

Current rootfs is based Debian Buster (10), and has systemd as main init system
