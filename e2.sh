#!/bin/bash

pacman -Syyu --noconfirm > /dev/null;
pacman -Scc --noconfirm > /dev/null;

echo arch > /etc/hostname > /dev/null;
yes arch | passwd root > /dev/null;

useradd -m -g users -G wheel arch > /dev/null;
yes arch | passwd arch > /dev/null;

mkinitcpio -P > /dev/null;

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null;
echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen;
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf;
hwclock --systohc > /dev/null;
locale-gen > /dev/null;

rm -rf /etc/pacman.d/mirrorlist > /dev/null;
rm -rf /etc/pacman.d/mirrorlist > /dev/null;
rm -rf /etc/pacman.d/mirrorlist > /dev/null;
echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist;

rm -rf /etc/pacman.d/mirrorlist-arch > /dev/null;
rm -rf /etc/pacman.d/mirrorlist-arch > /dev/null;
rm -rf /etc/pacman.d/mirrorlist-arch > /dev/null;
echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist-arch;

rm -rf ~/.bashrc > /dev/null;
rm -rf ~/.bashrc > /dev/null;
rm -rf ~/.bashrc > /dev/null;
echo "alias i='yay -S --noconfirm'" > ~/.bashrc;
echo "alias d='sudo pacman -Rsc'" >> ~/.bashrc;
echo "alias nano='sudo nano'" >> ~/.bashrc;
echo "alias addsuporte-bluetooth='yay -S --noconfirm bluez bluez-tools bluez-utils blueman; sudo systemctl start bluetooth.service; sudo systemctl enable bluetooth.service'" >> ~/.bashrc;
echo "sudo pacman-key --refresh-keys > /dev/null;" >> ~/.bashrc;
echo "sudo rm -rf ~/.bash_history > /dev/null; sudo rm -rf ~/.cache > /dev/null;" >> ~/.bashrc;
echo "sudo pacman -Syyu --noconfirm > /dev/null;" >> ~/.bashrc;
echo "sudo pacman -Scc --noconfirm > /dev/null;" >> ~/.bashrc;
echo "sudo history -c > /dev/null;" >> ~/.bashrc;
echo "clear;" >> ~/.bashrc;
echo "fastfetch" >> ~/.bashrc;
echo "git clone https://aur.archlinux.org/yay.git; sudo chmod 777 yay; cd yay; makepkg -si --noconfirm; cd ..; sudo rm -rf yay; yay -S --noconfirm google-chrome lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader vulkan-validation-layers lib32-vulkan-validation-layers vulkan-tools lib32-vulkan-tools vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-headers mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver --save --answerdiff None --answerclean None --removemake; sed -i '$ d' ~/.bashrc" >> ~/.bashrc;

rm -rf /etc/pacmam.conf > /dev/null;
rm -rf /etc/pacman.conf > /dev/null;
rm -rf /etc/pacman.conf > /dev/null;
echo "[options]" > /etc/pacman.conf;
echo "HoldPkg=pacman glibc" >> /etc/pacman.conf;
echo "Architecture=auto" >> /etc/pacman.conf;
echo "CheckSpace" >> /etc/pacman.conf;
echo "ParallelDownloads=2" >> /etc/pacman.conf;
echo "SigLevel=Required DatabaseOptional" >> /etc/pacman.conf;
echo "LocalFileSigLevel=Optional" >> /etc/pacman.conf;
echo "[core]" >> /etc/pacman.conf;
echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf;
echo "[extra]" >> /etc/pacman.conf;
echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf;
echo "[multilib]" >> /etc/pacman.conf;
echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf;
echo "[community]" >> /etc/pacman.conf;
echo "Include=/etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf;

pacman -Syyu --noconfirm > /dev/null;
pacman -Scc --noconfirm > /dev/null;

pacman -S git mesa fastfetch intel-ucode amd-ucode --noconfirm > /dev/null;

systemctl disable systemd-timesyncd > /dev/null;

pacman -S plasma --noconfirm > /dev/null;

pacman -S gdm --noconfirm > /dev/null;
systemctl enable gdm > /dev/null;

pacmam -S sudo --noconfirm > /dev/null;
echo "arch ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers;

pacman -S networkmanager --noconfirm > /dev/null;
systemctl enable NetworkManager > /dev/null;
systemctl disable NetworkManager-wait-online > /dev/null;

pacman -S pipewire pipewire-pulse pipewire-media-session pavucontrol --noconfirm > /dev/null;

pacman -S grub-efi-x86_64 efibootmgr > /dev/null;
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=z --recheck > /dev/null;
grub-mkconfig -o /boot/grub/grub.cfg > /dev/null;
