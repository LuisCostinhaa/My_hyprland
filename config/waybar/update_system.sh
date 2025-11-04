#!/bin/bash

# Configuration
TERMINAL="alacritty -e"
# Update everything in one terminal session with exit code check
$TERMINAL bash -c 'trizen -Syu'
