#!/bin/bash

# Additional packages in the ISO
PKGS="bzip2 cryptsetup curl dialog ddrescue gnupg2 git gptfdisk gzip efibootmgr lvm2 makepasswd mdadm mosh nano p7zip rsync wget emacs unzip xz zip usb-modeswitch ModemManager mobile-broadband-provider-info grub-x86_64-efi xrandr nyxt linux-firmware-network NetworkManager network-manager-applet ntp xterm void-repo-multilib xorg-minimal xorg-input-drivers xorg-video-drivers setxkbmap xauth vdpauinfo libvdpau-va-gl font-misc-misc terminus-font dejavu-fonts-ttf dbus-elogind-x11 dkms void-repo-nonfree dmenu"

yes y | xbps-install -Su xbps
yes y | xbps-install -Su
yes y | xbps-install -S git make
cd /root
[ ! -d 'void-mklive' ] && git clone 'https://github.com/void-linux/void-mklive.git'
cd 'void-mklive/'
make clean
make
./mklive.sh -a x86_64 -r 'https://mirrors.dotsrc.org/voidlinux/current' -p "$PKGS"
