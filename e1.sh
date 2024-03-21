#!/bin/bash

parted /dev/sdX mkpart primary 1MiB 1GB
sudo parted /dev/sdX set 1 bios_grub on
sudo parted /dev/sdX mkpart primary 1GB 21GB
sudo parted /dev/sdX mkpart primary 21GB -1

mkfs.fat -F32 /dev/sda1;
mkfs.ext4 /dev/sda2;
mkfs.ext4 /dev/sda3;

mount /dev/sda2 /mnt;

mkdir /mnt/boot;
mkdir /mnt/boot/EFI;
mkdir /mnt/home;

mount /dev/sda1 /mnt/boot/EFI;
mount /dev/sda3 /mnt/home;

pacstrap /mnt base base-devel linux linux-firmware;

genfstab -U -p /mnt >> /mnt/etc/fstab;

mv AutoArch/e2.sh ~; chmod 777 e2.sh; cp e2.sh /mnt; arch-chroot /mnt /e2.sh && reboot
