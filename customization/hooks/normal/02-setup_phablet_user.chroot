#!/bin/sh -x

USER=phablet
GECOS=Phablet
UGID=32011

DEFGROUPS="tty,sudo,adm,dialout,cdrom,plugdev,audio,dip,video,gps,radio,bluetooth,android_net,android_net2,android_net3,android_graphics,android_input,sdcard_rw,android_media,android_nvram,android_cache"

echo "I: creating default user $USER"
adduser --gecos $GECOS --disabled-login $USER --uid $UGID

mkdir -p /home/$USER/Music
mkdir -p /home/$USER/Pictures
mkdir -p /home/$USER/Videos
mkdir -p /home/$USER/Downloads
mkdir -p /home/$USER/Documents
chown -R $UGID:$UGID /home/$USER

usermod -a -G ${DEFGROUPS} ${USER}

echo phablet:1234 | chpasswd
