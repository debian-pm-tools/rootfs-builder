#!/bin/sh

export ARCH=armhf

# configure the live-build
lb config \
        --mode debian \
        --distribution stretch \
        --binary-images none \
        --memtest none \
        --source false \
        --archive-areas "main contrib non-free" \
        --apt-source-archives true \
        --architectures armhf \
        --bootstrap-qemu-arch armhf \
        --bootstrap-qemu-static /usr/bin/qemu-arm-static \
        --linux-flavours none \
        --bootloader none \
        --initramfs-compression lzma \
        --initsystem systemd \
        --chroot-filesystem plain \
        --apt-options "--yes -o Debug::pkgProblemResolver=true" \
        --compression gzip \
        --system normal \
        --zsync false \
        --linux-packages=none \
        --backports true \
        --apt-recommends false \
        --initramfs=none \
        --debian-installer false \
        --debootstrap-options="--include=apt-transport-https" \
        --firmware-chroot false

# Copy the customization
cp -rf customization/* config/

# build the rootfs
lb build

# live-build itself is meh, it creates the tarball with directory structure of binary/boot/filesystem.dir
# so we pass --binary-images none to lb config and create tarball on our own
if [ -e "binary/boot/filesystem.dir" ]; then
        (cd "binary/boot/filesystem.dir/" && tar -c *) | gzip -9 --rsyncable > "halium.rootfs.tar.gz"
        chmod 644 "halium.rootfs.tar.gz"
fi
