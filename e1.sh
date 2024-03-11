#!/bin/bash

cfdisk /dev/sda;

mkfs.fat -F32 /dev/sda1;
mkfs.ext4 /dev/sda2;
mkfs.ext4 /dev/sda3;

mount /dev/sda2 /mnt;

mkdir /mnt/boot;
mkdir /mnt/boot/EFI;

mkdir /mnt/home;

mount /dev/sda1 /mnt/boot/EFI;

mount /dev/sda3 /mnt/home;

pacstrap /mnt base linux linux-firmware;

genfstab -U -p /mnt >> /mnt/etc/fstab;

cp e2.sh /mnt;

arch-chroot /mnt /e2.sh && reboot
