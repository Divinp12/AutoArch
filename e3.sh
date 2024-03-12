!#/bin/bash

sudo rm -r /etc/pacman.conf && sudo mv ~/AutoArch/pacman.conf /etc;
sudo rm -r ~/.bashrc && sudo mv ~/AutoArch/.bashrc ~;
sudo rm -r /etc/pacman.d/mirrorlist && sudo su root echo "Server=https://mirror.ufscar.br/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist;
sudo rm -r /etc/pacman.d/mirrorlist-arch && sudo su root echo "Server=https://mirror.ufscar.br/archlinux/$repo/os/$arch" >> /etc/pacman.d/mirrorlist-arch;

sudo su arch pacman -Syyu --noconfirm;

git clone https://aur.archlinux.org/yay.git; sudo chmod 777 yay; cd yay; makepkg -si --noconfirm; cd ~; sudo rm -r yay;
yay -S --noconfirm google-chrome pipewire pipewire-pulse pipewire-media-session pavucontrol mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader vulkan-validation-layers lib32-vulkan-validation-layers vulkan-tools lib32-vulkan-tools vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-headers mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver --save --answerdiff None --answerclean None --removemake;

sudo rm -r ~/AutoArch && reboot
