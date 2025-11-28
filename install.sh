#!/bin/sh

######### Trizen #####
git clone https://aur.archlinux.org/trizen.git
cd trizen || exit
makepkg -si
cd ..
sudo rm -r trizen

######### Chaotic-Aur #####
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp -r pacman.conf /etc
trizen -Sy

######### Base #####
trizen -Sy --noconfirm --needed \
base-devel amd-ucode xf86-video-amdgpu bash-completion \
bat dash lsd ntfs-3g gvfs 7zip gvfs-mtp opencl-amd xdg-user-dirs \
polkit-gnome udiskie

######### Hyprland #####
trizen -Sy --noconfirm --needed \
hyprland hyprpaper hyprland-qtutils qt5-wayland qt6-wayland \
xdg-desktop-portal-hyprland hyprshot xdg-desktop-portal-gtk \
qt5ct qt6ct

######### File Manager #####
trizen -Sy --noconfirm --needed \
thunar thunar-archive-plugin thunar-volman tumbler

######### Zsh #####
trizen -Sy --noconfirm --needed \
zsh zsh-autosuggestions zsh-syntax-highlighting

######### Fonts #####
trizen -Sy --noconfirm --needed ttf-jetbrains-mono-nerd 
#ttf-joypixels ttf-fira-code ttf-font-awesome \
#noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra

######### Audio #####
trizen -Sy --noconfirm --needed \
pavucontrol pamixer pipewire pipewire-pulse

######### Theming #####
trizen -Syu --noconfirm --needed \
papirus-folders-git papirus-icon-theme adw-gtk-theme \
matugen-bin nwg-look

######### Apps #####
trizen -Sy --noconfirm --needed \
gnome-calculator gnome-disk-utility gnome-calendar \
xarchiver meld keepassxc \
alacritty sublime-text-4 \
fastfetch btop \
lact

trizen -Sy --noconfirm --needed \
darktable-git \
brave librewolf\
wl-color-picker \
rofi waybar waypaper waybar-module-pacman-updates-git swaync \
auto-cpufreq \
android-file-transfer

######### Display Manager #####
sudo pacman -S --noconfirm --needed ly
sudo systemctl enable ly.service

######### Firewall #####
sudo pacman -S --noconfirm --needed ufw
sudo systemctl enable ufw.service

######### Setings #####
xdg-user-dirs-update
sudo cp -r backgrounds ~/Imagens/
sudo cp -r grub /etc/default
sudo cp -r makepkg.conf /etc
cd config || exit
sudo cp -r ./* ~/.config
cd ..
sudo cp .bashrc ~
sudo cp .zshrc ~

######### Chown #####
cd || exit
sudo chown -R "${USER}":"${USER}" .bashrc
sudo chown -R "${USER}":"${USER}" .zshrc
sudo chown -R "${USER}":"${USER}" .config

########## Update Grub #####
sudo grub-mkconfig -o /boot/grub/grub.cfg

####################	ZSH		####################
sudo chsh -s /bin/zsh root
chsh -s /bin/zsh "${MYHOSTNM}"
