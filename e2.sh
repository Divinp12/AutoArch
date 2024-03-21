#!/bin/bash

echo arch > /etc/hostname && yes arch | passwd root

&& useradd -m -g users -G wheel arch && yes arch | passwd arch

&& mkinitcpio -P

&& pacman -S networkmanager git grub efibootmgr sudo mesa fastfetch lightdm xfwm4 xfce4-panel xfdesktop thunar xfce4-session xfce4-settings xfce4-terminal xfconf pipewire pipewire-pulse pipewire-media-session pavucontrol intel-ucode amd-ucode --noconfirm

&& systemctl enable lightdm && systemctl enable NetworkManager

&& systemctl disable NetworkManager-wait-online && systemctl disable systemd-timesyncd

&& ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && echo "LANG=pt_BR.UTF-8" > /etc/locale.conf && hwclock --systohc && locale-gen

&& sed -i '/^\[Seat:\*]/a autologin-user=arch' /etc/lightdm/lightdm.conf && groupadd -r autologin && gpasswd -a arch autologin

&& echo "arch ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

&& rm -rf /etc/pacman.d/mirrorlist && rm -rf /etc/pacman.d/mirrorlist && echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist

&& rm -rf /etc/pacman.d/mirrorlist-arch && rm -rf /etc/pacman.d/mirrorlist-arch && echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist-arch

&& rm -rf /home/arch/.bashrc && rm -rf /home/arch/.bashrc
&& echo "alias i='yay -Ss --noconfirm'" > /home/arch/.bashrc
&& echo "alias d='sudo pacman -Rsc'" >> /home/arch/.bashrc
&& echo "alias nano='sudo nano'" >> /home/arch/.bashrc
&& echo "alias addsuporte-bluetooth='yay -S --noconfirm bluez bluez-tools bluez-utils blueman; sudo systemctl start bluetooth.service; sudo systemctl enable bluetooth.service'" >> /home/arch/.bashrc
&& echo "sudo pacman-key --refresh-keys;" >> /home/arch/.bashrc
&& echo "sudo rm -rf ~/.bash_history;" >> /home/arch/.bashrc
&& echo "sudo rm -rf ~/.cache;" >> /home/arch/.bashrc
&& echo "sudo pacman -Syyu --noconfirm;" >> /home/arch/.bashrc
&& echo "sudo pacman -Scc --noconfirm;" >> /home/arch/.bashrc
&& echo "sudo history -c;" >> /home/arch/.bashrc
&& echo "clear;" >> /home/arch/.bashrc
&& echo "fastfetch" >> /home/arch/.bashrc

&& rm -rf /etc/pacmam.conf && rm -rf /etc/pacman.conf
&& echo "[options]" > /etc/pacman.conf
&& echo "HoldPkg=pacman glibc" >> /etc/pacman.conf
&& echo "Architecture=auto" >> /etc/pacman.conf
&& echo "CheckSpace" >> /etc/pacman.conf
&& echo "ParallelDownloads=2" >> /etc/pacman.conf
&& echo "SigLevel=Required DatabaseOptional" >> /etc/pacman.conf
&& echo "LocalFileSigLevel=Optional" >> /etc/pacman.conf
&& echo "[core]" >> /etc/pacman.conf
&& echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf
&& echo "[extra]" >> /etc/pacman.conf
&& echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf
&& echo "[multilib]" >> /etc/pacman.conf
&& echo "Include=/etc/pacman.d/mirrorlist" >> /etc/pacman.conf
&& echo "[community]" >> /etc/pacman.conf
&& echo "Include=/etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

&& pacman -Syyu --noconfirm

&& git clone https://aur.archlinux.org/yay.git; chmod 777 yay; cd yay; makepkg -si --noconfirm; cd ..; rm -rf yay;
&& yay -S --noconfirm google-chrome lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader vulkan-validation-layers lib32-vulkan-validation-layers vulkan-tools lib32-vulkan-tools vulkan-mesa-layers lib32-vulkan-mesa-layers vulkan-headers mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver --save --answerdiff None --answerclean None --removemake;

&& grub-install --target=x86_64-efi --bootloader-id=arch --recheck && grub-mkconfig -o /boot/grub/grub.cfg
