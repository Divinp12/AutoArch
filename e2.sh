#!/bin/bash

echo arch >> /etc/hostname;

passwd root;

useradd -m -g users -G wheel arch;

passwd arch;

mkinitcpio -P;

pacman -S networkmanager git grub efibootmgr sudo mesa fastfetch lxdm nano xfwm4 xfce4-panel xfdesktop thunar xfce4-session xfce4-settings xfce4-terminal xfconf intel-ucode amd-ucode --noconfirm;

systemctl enable lxdm;
systemctl enable NetworkManager;

systemctl disable NetworkManager-wait-online.service;
systemctl disable systemd-timesyncd.service;

ln -sf /usr/share/zoneinfo/America/Sao_paulo /etc/localtime;
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen;
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf;
hwclock --systohc && locale-gen;

echo "arch ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers;

grub-install --target=x86_64-efi --bootloader-id=arch --recheck;
grub-mkconfig -o /boot/grub/grub.cfg
