#!/usr/bin/env sh

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# dvorak programmer keyboard layout
#export KEYBOARD="dvp"

export WM="dwm"

# if passed, set first arg as WM
[ -n "$1" ] && export WM="$1"

[ -f ~/.xprofile ] && . ~/.xprofile

case "$WM" in

  "dwm")

    # dwm fix for java applications
    export _JAVA_AWT_WM_NONREPARENTING="1"

    while true; do
      dwm
    done

    ;;

  *) exec $WM ;;

esac
