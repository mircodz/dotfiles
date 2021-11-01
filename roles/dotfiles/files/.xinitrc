#!/usr/bin/env sh

export WM="awesome"

export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

[ -f ~/.xprofile ] && . ~/.xprofile

case "$WM" in
  "dwm")
    # fix for java applications not rendering properly
    export _JAVA_AWT_WM_NONREPARENTING="1"
    while true; do
      dwm
    done
    ;;

  *) exec $WM ;;
esac
