#!/bin/bash
echo "Atlas" > /etc/hostname
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
mkinitcpio -p linux
systemctl enable dhcpcd@enp2s0.service
grub-install --target=i386-pc --recheck /dev/sdd
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S xorg-server git vim-minimal --noconfirm
passwd
