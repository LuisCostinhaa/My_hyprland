#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

##
##	GENERATE A FORMAT SEQUENCE
##
# 1. Nice username colors
export PS1='\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;35m\]\w\[\e[0m\]> '


################################################################################
#
#macchina
fastfetch
#
source /usr/share/blesh/ble.sh
#
#
alias cat="bat"
alias ccache="trizen -Scc"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias git-pull="git pull --rebase"
alias grep='grep --color=auto'
alias ip="ip a"
alias jctl="journalctl -p 3 -xb"
alias keyring="sudo pacman -Sy archlinux-keyring"
alias ll="lsd -lh"
alias ls='lsd -la --color=auto'
alias nano-fstab="sudo nano /etc/fstab"
alias v-fstab="sudo vim /etc/fstab"
alias nano-grub="sudo nano /etc/default/grub"
alias v-grub="sudo vim /etc/default/grub"
alias nano-pacman.conf="sudo nano /etc/pacman.conf"
alias v-pacman.conf="sudo vim /etc/pacman.conf"
alias pacman='sudo pacman --color auto'
alias pacotes="pacman -Qet"
alias pull="git pull"
alias reload="sudo fc-cache -vf"
alias repo="repo-add ./repo.db.tar.gz ./*"
alias telemovel="simple-mtpfs --device 1 ~/Telemovel"
alias update="trizen -Syu --noconfirm"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-mirrorlist="sudo reflector -c Portugal -c Spain -c germany -a 12 -p https -p http --sort rate --score 10 --save /etc/pacman.d/mirrorlist"
alias update-mkinitcpio="sudo mkinitcpio -P linux-lts"
alias vcahe="du -sh /var/cache/pacman/pkg/"
alias vm="looking-glass-client -s -m 97"
alias ventoy="ventoygui"
alias setlocales="sudo localectl set-x11-keymap pt && sudo localectl set-locale LANG=pt_PT.UTF-8"
# check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
#approximation of how old your hardware is
alias howold="sudo lshw | grep -B 3 -A 8 BIOS"
#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
# This will generate a list of explicitly installed packages
alias list="sudo pacman -Qqe"
#This will generate a list of explicitly installed packages without dependencies
alias listt="sudo pacman -Qqet"
# list of AUR packages
alias listaur="sudo pacman -Qqem"
alias f="yazi"
alias matrix="cmatrix  -s"
#alias color="cat ~/.Xresources ~/.cache/wal/xrdb_extra | xrdb -merge"
alias discos="sudo gnome-disks"
alias teminal="source ~/.bashrc"
alias nh="sudo nano .config/hypr/hyprland.conf"