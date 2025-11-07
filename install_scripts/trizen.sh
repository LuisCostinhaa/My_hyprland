#!/bin/sh

git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
cd ..
sudo rm -r trizen
