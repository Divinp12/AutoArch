#!/bin/bash
# Limpar a tabela de partições existente no dispositivo
echo "o
w
" | fdisk /dev/sda

# Criar partição para /boot (1GB)
echo "n
p
1

+1G
" | fdisk /dev/sda

# Criar partição para /
echo "n
p
2

+20G
" | fdisk /dev/sda

# Criar partição para /home (usando o restante do espaço disponível)
echo "n
p
3


w
" | fdisk /dev/sda

mkfs.fat -F32 /dev/sda1 > /dev/null;
mkfs.ext4 -F /dev/sda2 > /dev/null;
mkfs.ext4 -F /dev/sda3 > /dev/null;

mount /dev/sda2 /mnt > /dev/null;

mkdir /mnt/boot > /dev/null;
mkdir /mnt/boot/EFI > /dev/null;
mkdir /mnt/home > /dev/null;

mount /dev/sda1 /mnt/boot/EFI > /dev/null;
mount /dev/sda3 /mnt/home > /dev/null;

pacstrap /mnt base base-devel linux linux-firmware > /dev/null;

genfstab -U -p /mnt >> /mnt/etc/fstab;

mv AutoArch/e2.sh ~ > /dev/null;
chmod 777 e2.sh > /dev/null;
cp e2.sh /mnt > /dev/null;
arch-chroot /mnt /e2.sh;

reboot;
