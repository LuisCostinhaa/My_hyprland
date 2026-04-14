#!/bin/sh

######### yay #####
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay

######### Chaotic-Aur #####
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp -r pacman.conf /etc
yay -Sy

######### Base #####
yay -Sy --noconfirm --needed \
base-devel amd-ucode xf86-video-amdgpu bash-completion mesa-utils mtools sg3_utils smartmontools efitools \
bat dash lsd ntfs-3g gvfs 7zip gvfs-mtp opencl-amd xdg-user-dirs \
polkit-gnome udiskie

######### Hyprland #####
yay -Sy --noconfirm --needed \
hyprland hyprpaper hyprland-qtutils qt5-wayland qt6-wayland \
xdg-desktop-portal-hyprland hyprshot xdg-desktop-portal-gtk \
qt5ct qt6ct swww

######### File Manager #####
yay -Sy --noconfirm --needed \
thunar thunar-archive-plugin thunar-volman tumbler

######### Zsh #####
yay -Sy --noconfirm --needed \
zsh zsh-autosuggestions zsh-syntax-highlighting

######### Fonts #####
yay -Sy --noconfirm --needed ttf-jetbrains-mono-nerd 
#ttf-joypixels ttf-fira-code ttf-font-awesome \
#noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra

######### Audio #####
yay -Sy --noconfirm --needed \
pavucontrol pamixer pipewire pipewire-pulse

######### Theming #####
yay -Syu --noconfirm --needed \
papirus-folders-git papirus-icon-theme adw-gtk-theme \
matugen-bin nwg-look colloid-icon-theme

######### Apps #####
yay -Sy --noconfirm --needed \
gnome-calculator gnome-disk-utility gnome-calendar \
xarchiver meld keepassxc \
alacritty sublime-text-4 \
fastfetch btop

yay -Sy --noconfirm --needed \
darktable-git \
brave \
librewolf \
wl-color-picker \
rofi waybar waypaper waybar-module-pacman-updates-git swaync \
auto-cpufreq \
android-file-transfer

######### Display Manager #####
yay -Sy --noconfirm --needed sddm sddm-theme-sugar-candy-git
sudo systemctl enable sddm.service

######### Firewall #####
yay -Sy --noconfirm --needed ufw
sudo systemctl enable ufw.service

######### Setings #####
xdg-user-dirs-update
cd sddm
sudo cp -r ./* /usr/share/sddm/themes/Sugar-Candy
cd ..
sudo cp -r backgrounds ~/Imagens/
sudo cp -r fonts /usr/local/share
sudo cp -r sddm.conf /etc/
sudo cp -r grub /etc/default
sudo cp -r makepkg.conf /etc
cd config || exit
sudo cp -r ./* ~/.config
cd ..
sudo cp .bashrc ~
sudo cp .zshrc ~

######### Chown #####
cd || exit
mkdir -p ISOs PKG/My-Projects
sudo mv My_hyprland PKG/My-Projects
sudo chown -R "${USER}":"${USER}" .bashrc
sudo chown -R "${USER}":"${USER}" .zshrc
sudo chown -R "${USER}":"${USER}" .config

########## Update Grub #####
sudo grub-mkconfig -o /boot/grub/grub.cfg

####################	ZSH		####################
sudo chsh -s /bin/zsh root
chsh -s /bin/zsh ${MYHOSTNM}

####################	Simlink		####################

 rm -r ~/.bashrc
 ln -s ~/PKG/My-Projects/My_hyprland/.bashrc ~/.bashrc
 rm -r ~/.zshrc
 ln -s ~/PKG/My-Projects/My_hyprland/.zshrc ~/.zshrc
 rm -r ~/.config/alacritty
 ln -s ~/PKG/My-Projects/My_hyprland/config/alacritty ~/.config/alacritty
 rm -r ~/.config/btop
 ln -s ~/PKG/My-Projects/My_hyprland/config/btop ~/.config/btop
 rm -r ~/.config/fastfetch
 ln -s ~/PKG/My-Projects/My_hyprland/config/fastfetch ~/.config/fastfetch
 rm -r ~/.config/GIMP
 ln -s ~/PKG/My-Projects/My_hyprland/config/GIMP ~/.config/GIMP
 rm -r ~/.config/gtk-3.0
 ln -s ~/PKG/My-Projects/My_hyprland/config/gtk-3.0 ~/.config/gtk-3.0
 rm -r ~/.config/gtk-4.0
 ln -s ~/PKG/My-Projects/My_hyprland/config/gtk-4.0 ~/.config/gtk-4.0
 rm -r ~/.config/hypr
 ln -s ~/PKG/My-Projects/My_hyprland/config/hypr ~/.config/hypr
 rm -r ~/.config/kitty
 ln -s ~/PKG/My-Projects/My_hyprland/config/kitty ~/.config/kitty
 rm -r ~/.config/matugen
 ln -s ~/PKG/My-Projects/My_hyprland/config/matugen ~/.config/matugen
 rm -r ~/.config/nwg-look
 ln -s ~/PKG/My-Projects/My_hyprland/config/nwg-look ~/.config/nwg-look
 rm -r ~/.config/rofi
 ln -s ~/PKG/My-Projects/My_hyprland/config/rofi ~/.config/rofi
 rm -r ~/.config/scripts
 ln -s ~/PKG/My-Projects/My_hyprland/config/scripts ~/.config/scripts
 rm -r ~/.config/sublime-text
 ln -s ~/PKG/My-Projects/My_hyprland/config/sublime-text ~/.config/sublime-text
 rm -r ~/.config/swaync
 ln -s ~/PKG/My-Projects/My_hyprland/config/swaync ~/.config/swaync
 rm -r ~/.config/Thunar
 ln -s ~/PKG/My-Projects/My_hyprland/config/Thunar ~/.config/Thunar
 rm -r ~/.config/waybar
 ln -s ~/PKG/My-Projects/My_hyprland/config/waybar ~/.config/waybar
 rm -r ~/.config/waypaper
 ln -s ~/PKG/My-Projects/My_hyprland/config/waypaper ~/.config/waypaper
 rm -r ~/.config/xfce4
 ln -s ~/PKG/My-Projects/My_hyprland/config/xfce4 ~/.config/xfce4
 rm -r ~/.config/xsettingsd
 ln -s ~/PKG/My-Projects/My_hyprland/config/xsettingsd ~/.config/xsettingsd
 rm -r ~/.config/yazi
 ln -s ~/PKG/My-Projects/My_hyprland/config/yazi ~/.config/yazi

