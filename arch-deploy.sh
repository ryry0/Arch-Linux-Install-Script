#!/bin/bash

pacman -Syu
pacman -Sy reflector
cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbosee --country 'United States' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base base_devel
genfstab -p /mnt >> /mnt /etc/fstab
cp arch-chroot-deploy.sh /mnt
arch-chroot /mnt arch-chroot-deploy.sh
