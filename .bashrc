rm -r /home/arch/.bashrc

echo "alias i='yay -S --noconfirm'" >> /home/arch/.bashrc;

echo "alias d='sudo pacman -Rsc'" >> /home/arch/.bashrc;

echo "alias nano='sudo nano'" >> /home/arch/.bashrc;

echo "alias addsuporte-bluetooth='yay -S --noconfirm bluez bluez-tools bluez-utils blueman; sudo systemctl start bluetooth.service; sudo systemctl enable bluetooth.service'" >> /home/arch/.bashrc;

echo "sudo pacman-key --refresh-keys;" >> /home/arch/.bashrc;

echo "sudo rm -r ~/.bash_history;" >> /home/arch/.bashrc;

echo "sudo rm -r ~/.cache;" >> /home/arch/.bashrc;

echo "sudo pacman -Syyu --noconfirm;" >> /home/arch/.bashrc;

echo "sudo pacman -Scc --noconfirm;" >> /home/arch/.bashrc;

echo "sudo history -c;" >> /home/arch/.bashrc;

echo "clear;" >> /home/arch/.bashrc;

echo "fastfetch" >> /home/arch/.bashrc;
