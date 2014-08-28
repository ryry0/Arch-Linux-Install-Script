#!/bin/bash
echo "Survivor-Arlnx" > /etc/hostname
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
mkinitcpio -p linux
pacman -S dialog wifi-menu os-prober grub iw wpa_supplicant wpa_actiond
systemctl enable netctl-auto@wlp2s0.service
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S laptop-mode-tools xorg-server xf86-video-intel git
passwd
