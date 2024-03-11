#!/bin/bash

echo arch >> /etc/hostname;

passwd root;

useradd -m -g users -G wheel arch;

passwd arch;

mkinitcpio -P;

pacman -S networkmanager git grub efibootmgr sudo mesa fastfetch lxdm nano xfwm4 xfce4-panel xfdesktop thunar xfce4-session xfce4-settings xfce4-terminal xfconf pipewire pipewire-pulse pipewire-media-session pavucontrol intel-ucode amd-ucode --noconfirm;

systemctl enable lxdm;

systemctl enable NetworkManager;

systemctl disable NetworkManager-wait-online.service;

systemctl disable systemd-timesyncd.service;

echo Defaults:arch !authenticate >> /etc/sudoers;

echo 

grub-install --target=x86_64-efi --bootloader-id=arch --recheck;

grub-mkconfig -o /boot/grub/grub.cfg