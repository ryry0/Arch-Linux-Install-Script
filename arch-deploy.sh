#!/bin/bash

pacman -S pacman --noconfirm
pacman -S archlinux-keyring --noconfirm
pacstrap /mnt base base-devel
genfstab -p /mnt >> /mnt/etc/fstab
cp arch-chroot-deploy.sh /mnt
arch-chroot /mnt arch-chroot-deploy.sh
