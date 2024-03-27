#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como root" 
   exit 1
fi

DISK="/dev/sda"

TOTAL_SECTORS=$(blockdev --getsz "$DISK")

BIOS_BOOT_SIZE=$((1024*1024*2))
ROOT_SIZE=$((1024*1024*20))

REST_SIZE=$(($TOTAL_SECTORS - $BIOS_BOOT_SIZE - $ROOT_SIZE))

sgdisk --clear \
       --new=1:2048:+${BIOS_BOOT_SIZE} --typecode=1:ef02 --change-name=1:"BIOS boot" \
       --new=2:0:+${ROOT_SIZE} --typecode=2:8300 --change-name=2:"Raiz (/)" \
       --new=3:0:+${REST_SIZE} --typecode=3:8300 --change-name=3:"Outros" \
       --print $DISK

partprobe

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
