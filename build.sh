#!/bin/sh

export ARCH=armhf
export mirror="http://ftp.de.debian.org/debian"
export securitymirror="http://security.debian.org/debian"

mkdir build
cd build

# configure the live-build
lb config \
        --mode debian \
        --distribution buster \
        --binary-images none \
        --memtest none \
        --source false \
        --archive-areas "main" \
        --apt-source-archives true \
        --architectures armhf \
        --bootstrap-qemu-arch armhf \
        --bootstrap-qemu-static /usr/bin/qemu-arm-static \
        --linux-flavours none \
        --bootloader none \
        --initramfs-compression lzma \
        --initsystem systemd \
        --chroot-filesystem plain \
        --apt-options "--yes -o Debug::pkgProblemResolver=true --no-install-recommends" \
        --debootstrap-options='--include="gnupg,ca-certificates"' \
        --compression gzip \
        --system normal \
        --zsync false \
        --linux-packages=none \
        --backports false \
	--security false \
        --apt-recommends false \
        --initramfs=none \
        --debian-installer false \
        --firmware-chroot false \
        --parent-mirror-bootstrap $mirror \
        --mirror-bootstrap $mirror \
        --mirror-binary $mirror \
        --mirror-chroot-security $securitymirror \
        --mirror-binary-security $securitymirror

# Copy the customization
cp -rf ../customization/* config/

# build the rootfs
lb build

# live-build itself is meh, it creates the tarball with directory structure of binary/boot/filesystem.dir
# so we pass --binary-images none to lb config and create tarball on our own
if [ -e "binary/boot/filesystem.dir" ]; then
        (cd "binary/boot/filesystem.dir/" && tar -c *) | gzip -9 --rsyncable >"../halium.rootfs.tar.gz"
        chmod 644 "../halium.rootfs.tar.gz"
fi
