#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como root" 
   exit 1
fi

# Determina o dispositivo de bloco para particionamento
DISK="/dev/sda"

# Calcula o tamanho total do disco em MB
TOTAL_SIZE=$(blockdev --getsz "$DISK")
TOTAL_SIZE_MB=$((TOTAL_SIZE / 2048)) # 1 setor = 512 bytes

# Calcula o tamanho das partições
BIOS_BOOT_SIZE_MB=2048   # 1GB em MB
ROOT_SIZE_MB=20480       # 20GB em MB

# Calcula o tamanho da partição home (restante do disco)
HOME_SIZE_MB=$((TOTAL_SIZE_MB - BIOS_BOOT_SIZE_MB - ROOT_SIZE_MB))

# Limpa a tabela de partições do disco
echo "Limpar tabela de partições em $DISK"
dd if=/dev/zero of="$DISK" bs=512 count=1 conv=notrunc

# Inicia o utilitário de particionamento cfdisk
echo "Iniciando particionamento com cfdisk em $DISK"

cfdisk "$DISK" <<EOF
gpt
$BIOS_BOOT_SIZE_MB MiB BIOS_boot
$ROOT_SIZE_MB MiB root /
$HOME_SIZE_MB MiB home
write
EOF

# Informa ao kernel para recarregar a tabela de partições
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
