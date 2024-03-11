!#/bin/bash

sudo rm -r /boot/loader/loader.conf;

git clone https://aur.archlinux.org/yay.git;

sudo chmod 777 yay;

cd yay;

makepkg -si --noconfirm;

cd ~;

sudo rm -r yay;

yay -S --noconfirm google-chrome pipewire pipewire-pulse mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader vulkan-validation-layers lib32-vulkan-validation-layers vulkan-tools lib32-vulkan-tools vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-headers mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver --save --answerdiff None --answerclean None --removemake;

sudo rm -r /etc/pacman.conf && sudo mv ~/AutoArch/pacman.conf /etc;

sudo rm -r ~/.bashrc && sudo mv ~/AutoArch/.bashrc ~;

sudo rm -r /etc/pacman.d/mirrorlist && sudo mv ~/AutoArch/mirrorlist /etc/pacman.d;

sudo rm -r /etc/pacman.d/mirrorlist-arch && sudo mv ~/AutoArch/mirrorlist-arch /etc/pacman.d;

sudo pacman -Syyu --noconfirm;

sudo nano /boot/loader/entries/*x.conf;

sudo mkinitcpio -p linux;

sudo rm -r ~/AutoArch && reboot
