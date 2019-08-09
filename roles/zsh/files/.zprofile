#!/usr/bin/env sh

if [ -z "$DISPLAY" ] && [ -t 1 ] && [ "$(tty)" = /dev/tty1 ]; then
  exec xinit -- vt1
fi
