#!/bin/bash

dd if=/dev/zero of=/dev/sda status=progress

parted /dev/sda mklabel gpt \
mkpart "B" fat32 1MB 1GB \
set 1 bios_grub on \
mkpart "/" ext4 1GB 21GB \
mkpart "H" ext4 21GB 100%;

mount /dev/sda2 /mnt;

mkdir /mnt/boot;
mkdir /mnt/boot/EFI;
mkdir /mnt/home;

mount /dev/sda1 /mnt/boot/EFI;
mount /dev/sda3 /mnt/home;

pacstrap /mnt base base-devel linux linux-firmware;

genfstab -U -p /mnt >> /mnt/etc/fstab;

cp e2.sh /mnt;

arch-chroot /mnt /e2.sh && reboot
