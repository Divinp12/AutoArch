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

arch-chroot /mnt /bin/bash <<END

echo arch >> /etc/hostname;

passwd root;

useradd -m -g users -G wheel arch;

passwd arch;

mkinitcpio -P;

pacman -S networkmanager grub efibootmgr xf86-video-intel sudo mesa fastfetch lxdm nano xfwm4 xfce4-panel xfdesktop thunar xfce4-session xfce4-settings xfce4-terminal xfconf pipewire pipewire-pulse pipewire-media-session pavucontrol;

systemctl enable lxdm;

systemctl enable NetworkManager;

systemctl disable NetworkManager-wait-online.service;

systemctl disable systemd-timesyncd.service;

grub-install --target=x86_64-efi --bootloader-id=arch --recheck;

grub-mkconfig -o /boot/grub/grub.cfg;

nano /etc/sudoers;

END

reboot
