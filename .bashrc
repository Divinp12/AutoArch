alias i='yay -S --noconfirm'
alias d='sudo pacman -Rsc'
alias nano='sudo nano'
alias addsuporte-bluetooth='yay -S --noconfirm bluez bluez-tools bluez-utils blueman; sudo systemctl start bluetooth.service; sudo systemctl enable bluetooth.service'

sudo pacman-key --refresh-keys; 

sudo rm -r ~/.bash_history;
sudo rm -r ~/.cache;

sudo pacman -Syyu --noconfirm;
sudo pacman -Scc --noconfirm;

sudo history -c;

clear;

fastfetch
