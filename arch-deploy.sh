#!/bin/bash

#pacman -Syu --noconfirm
pacman -Sy reflector --noconfirm
cp -vf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose --country 'United States' -p http -l 20 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel
genfstab -p /mnt >> /mnt/etc/fstab
cp arch-chroot-deploy.sh /mnt
arch-chroot /mnt /bin/bash arch-chroot-deploy.sh
