#!/bin/sh

cd install_scripts
. ./trizen.sh
. ./chaotic-aur.sh
. ./base.sh
. ./apps.sh
. ./audio.sh
. ./display_manager.sh
. ./file_manager.sh
. ./fonts.sh
. ./hyprland.sh
. ./theming.sh
. ./zsh.sh

######### Setings #####
xdg-user-dirs-update
sudo cp -r backgrounds ~/Imagens/
sudo cp -r grub /etc/default
sudo cp -r makepkg.conf /etc
cd config
sudo cp -r * ~/.config
cd ..
sudo cp .bashrc ~
sudo cp .zshrc ~

######### Chown #####
cd
sudo chown -R ${USER}:${USER} .bashrc
sudo chown -R ${USER}:${USER} .zshrc
sudo chown -R ${USER}:${USER} .config

########## Update Grub #####
sudo grub-mkconfig -o /boot/grub/grub.cfg

####################	ZSH		####################
sudo chsh -s /bin/zsh root
chsh -s /bin/zsh ${MYHOSTNM}
