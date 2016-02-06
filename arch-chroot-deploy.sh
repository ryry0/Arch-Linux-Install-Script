#!/bin/bash
echo "Survivor-Arlnx" > /etc/hostname
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
mkinitcpio -p linux
pacman -S dialog wifi-menu os-prober grub iw wpa_supplicant wpa_actiond --noconfirm
systemctl enable netctl-auto@wlp2s0.service
pacman -S tlp xorg-server xf86-video-intel git vim-minimal tmux --noconfirm
passwd
