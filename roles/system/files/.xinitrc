#!/bin/bash

export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/home/mirco/.local/share/JetBrains/Toolbox/scripts"

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Set key repeat rate
xset r rate 250 35

# If Ergodox keyboard is unplugged switch to Dvorak programmer keyboard layout.
[ -z "$(lsusb | grep ErgoDox)" ] && setxkbmap -layout us -variant dvp

# Setup keyring
eval $(gnome-keyring-daemon --start)

exec awesome
