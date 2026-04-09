#!/bin/sh

sndstatus=1

case $BLOCK_BUTTON in
        1) sndstatus=-$sndstatus ;;
        3) amixer set Master toggle ;;
        4) amixer set Master 1%+ ;;
        5) amixer set Master 1%- ;;
esac

case "$sndstatus" in
        1) sndtext="" ;;
        *) sndtext=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print "V"$2" " }') ;;
esac

case $(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $4 }') in
        on) echo $sndtext"󰕾" ;;
        off) echo $sndtext"󰖁" ;;
esac
