#!/bin/bash
echo "cronus" > /etc/hostname
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
mkinitcpio -p linux
pacman -Sy reflector --noconfirm
cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose --country 'United States' -p http -l 20 --sort rate --save /etc/pacman.d/mirrorlist
pacman -S iw wpa_supplicant --noconfirm
pacman -S tlp git vim tmux --noconfirm
passwd
