#!/usr/bin/env sh

LOGFILE="$HOME/.x.log"

if [ -z "$display" ] && [ -t 1 ] && [ "$(tty)" = /dev/tty1 ]; then
  date +%s%N >> "$LOGFILE"
  exec xinit -- vt1 2>&1 >> ""$LOGFILE""
fi
