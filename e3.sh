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
