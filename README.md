-----------------------------INSTALAÇÃO-----------------------

PASSO 1: BAIXE A ISO DO ARCH LINUX NO SITE OFICIAL NO LINK https://mirror.ufscar.br/archlinux/iso/2024.03.01/archlinux-x86_64.iso

PASSO 2: CRIE UM PENDRIVE FAT32 E EXTRAIA OS ARQUIVOS DA ISO NO PENDRIVE.

PASSO 3: REINICIE O PC E INICIE O PENDRIVE COMO UEFI OU GPT (BIOS LEGACY NÃO FUNCIONA)

PASSO 4: APÓS APARECER O "Root@Archiso" TIRE O PENDRIVE DO PC.

PASSO 5: DIGITE pacman -Sy; pacman -S git --noconfirm; git clone https://github.com/Divinp12/AutoArch.git; pacman -Rsc git; mv AutoArch/e1.sh ~; mv AutoArch/e2.sh ~; chmod 777 e1.sh; chmod 777 e2.sh; ./e1.sh

PASSO 6: APÓS O SEU PC REINICIAR AUTOMATICAMENTE VOCÊ ENTRARÁ NA TELA DE LOGIN, ENTÃO SE LOGUE E ENTRE NO TERMINAL.

FINAL: SEU PC IRÁ REINICIA DE NOVO E PRONTO, DIVIRTA-SE ;)

-----------------------INFORMAÇÕES BASICAS---------------------------

INSTALAR PACOTES PELO TERMINAL (OPCIONAL)

google chrome: i google-chrome

visualizador de fotos: i ristretto

(des)compactador de arquivos: i xarchiver

obs studio: i obs-studio

media player: i vlc

wine: i wine

telegram: i telegram-desktop

discord: i discord

steam: i steam

java: i jdk

mupen64 (emulador de nintendo 64): i mupen64plus-qt

pcsx2 (emulador de playstation 2): i pcsx2-git

rpcs3 (emulador de playstation 3): i rpcs3-git

grapejuice (roblox): i grapejuice

parsec: i parsec-bin

hidamari (papel de parede animado): i hidamari

heroic games launcher: i heroic-games-launcher

lutris: i lutris

mangohud: i mangohud lib32-mangohud
____________________________________________________________________________________________________
GAMEMODE (OPCIONAL)

Pacote que prioriza o sistema a dar mais atenção ao jogo:

Instalar: i gamemode lib32-gamemode

Use na steam na “opções de inicialização”= gamemoderun %command%

Use em jogos “executáveis”= gamemoderun NOME_DO_JOGO OU COMANDO_DE_EXECUÇÃO
____________________________________________________________________________________________________

CASO NÃO TENHA O PACOTE QUE QUEIRA POR AQUI NESTA PÁGINA, PROCURE PELO SITE OFICIAL DO ARCH LINUX:

https://aur.archlinux.org/packages

