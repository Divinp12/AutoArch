!#/bin/bash

sudo rm -r /boot/loader/loader.conf;

git clone https://aur.archlinux.org/yay.git;

sudo chmod 777 yay;

cd yay;

makepkg -si --noconfirm;

cd ~;

sudo rm -r yay;

yay -S --noconfirm nano --save --answerdiff None --answerclean None --removemake;

sudo rm -r /etc/pacman.conf && sudo mv ~/AutoArch/pacman.conf /etc;

sudo rm -r ~/.bashrc && sudo mv ~/AutoArch/.bashrc ~;

sudo rm -r /etc/pacman.d/mirrorlist && sudo mv ~/AutoArch/mirrorlist /etc/pacman.d;

sudo rm -r /etc/pacman.d/mirrorlist-arch && sudo mv ~/AutoArch/mirrorlist-arch /etc/pacman.d;

sudo pacman -Syyu --noconfirm;
