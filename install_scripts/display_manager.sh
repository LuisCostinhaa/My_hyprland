#!/bin/sh

sudo pacman -S --noconfirm --needed ly
sudo systemctl enable ly.service
