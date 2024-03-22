#!/bin/bash

echo arch > /etc/hostname;
yes arch | passwd root;

useradd -m -g users -G wheel arch;
yes arch | passwd arch;

mkinitcpio -P;

pacman -S git mesa fastfetch xfwm4 xfce4-panel xfdesktop thunar xfce4-session xfce4-settings xfce4-terminal xfconf intel-ucode amd-ucode --noconfirm;

systemctl disable systemd-timesyncd;

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime;
echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen;
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf;
hwclock --systohc;
locale-gen;

rm -rf /etc/pacman.d/mirrorlist;
rm -rf /etc/pacman.d/mirrorlist;
echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist;

rm -rf /etc/pacman.d/mirrorlist-arch;
rm -rf /etc/pacman.d/mirrorlist-arch;
echo 'Server=https://mirror.ufscar.br/archlinux/'$'$repo/os/'$'$arch' > /etc/pacman.d/mirrorlist-arch;

rm -rf /home/arch/.bashrc;
rm -rf /home/arch/.bashrc;
echo "alias i='yay -Ss --noconfirm'" > /home/arch/.bashrc;
echo "alias d='sudo pacman -Rsc'" >> /home/arch/.bashrc;
echo "alias nano='sudo nano'" >> /home/arch/.bashrc;
echo "alias addsuporte-bluetooth='yay -S --noconfirm bluez bluez-tools bluez-utils blueman; sudo systemctl start bluetooth.service; sudo systemctl enable bluetooth.service'" >> /home/arch/.bashrc;
echo "sudo pacman-key --refresh-keys;" >> /home/arch/.bashrc;
echo "sudo rm -rf ~/.bash_history;" >> /home/arch/.bashrc;
echo "sudo rm -rf ~/.cache;" >> /home/arch/.bashrc;
echo "sudo pacman -Syyu --noconfirm;" >> /home/arch/.bashrc;
echo "sudo pacman -Scc --noconfirm;" >> /home/arch/.bashrc;
echo "sudo history -c;" >> /home/arch/.bashrc;
echo "clear;" >> /home/arch/.bashrc;
echo "fastfetch" >> /home/arch/.bashrc;

rm -rf /etc/pacmam.conf;
rm -rf /etc/pacman.conf;
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

pacman -Syyu --noconfirm;

pacmam -S sudo --noconfirm;
echo "arch ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers;

pacman -S xorg-xinit --noconfirm;
echo "exec xfce4-session" >> /home/arch/.xinitrc;

pacman -S networkmanager --noconfirm;
systemctl enable NetworkManager;
systemctl disable NetworkManager-wait-online;

pacman -S pipewire pipewire-pulse pipewire-media-session pavucontrol --noconfirm;

pacman -S grub efibootmgr --noconfirm;
grub-install --target=x86_64-efi --bootloader-id=arch --recheck;
grub-mkconfig -o /boot/grub/grub.cfg
