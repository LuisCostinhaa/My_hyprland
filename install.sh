#!/bin/bash

########## Trizen #####
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
cd ..
sudo rm -r trizen

########## Chaotic #####
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp -r pacman.conf /etc
trizen -Syu

trizen -Sy --noconfirm --needed \
hyprland hyprpaper amd-ucode xf86-video-amdgpu base-devel hyprland-qtutils alacritty \
pipewire qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome \
hyprshot swaync

#sudo pacman -S bluez-utils brightnessctl

########## Fonts #####
trizen -Syu --noconfirm --needed ttf-jetbrains-mono-nerd 
#ttf-joypixels ttf-fira-code ttf-font-awesome \
#noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra

########## Utils #####
trizen -Syu --noconfirm --needed \
git bat dash lsd ntfs-3g bash-completion gvfs gvfs-mtp fastfetch btop auto-cpufreq udiskie \
android-file-transfer zsh zsh-autosuggestions zsh-syntax-highlighting opencl-amd darktable-git

########## Apps #####
trizen -Syu --noconfirm --needed \
xarchiver meld keepassxc gnome-calculator gnome-disk-utility pavucontrol pamixer gnome-calendar \
thunar thunar-archive-plugin thunar-volman tumbler wl-color-picker brave xdg-user-dirs
trizen -Syu --noconfirm --needed \
nwg-look pipewire-pulse sublime-text-4 matugen-bin \
waypaper rofi waybar qt5ct qt6ct 

trizen -Syu --noconfirm papirus-folders-git papirus-icon-theme adw-gtk-theme \
waybar-module-pacman-updates-git

#trizen -Syu --noconfirm hyprland-qtutils hyprlock hyprpicker hyprshot hyprsunset

######### Display Manager ###  
sudo pacman -S --noconfirm --needed ly
sudo systemctl enable ly.service

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
