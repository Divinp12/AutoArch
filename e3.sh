#!/bin/bash

git clone https://aur.archlinux.org/yay.git;
sudo chmod 777 yay;
cd yay;
makepkg -si --noconfirm;
cd ..;
sudo rm -rf yay;
yay -S --noconfirm google-chrome lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader vulkan-validation-layers lib32-vulkan-validation-layers vulkan-tools lib32-vulkan-tools vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-headers mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver --save --answerdiff None --answerclean None --removemake
