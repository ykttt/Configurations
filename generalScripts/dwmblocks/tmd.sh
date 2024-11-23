#!/bin/sh

clkstatus=1

case $BLOCK_BUTTON in
        1) clkstatus=-$clkstatus ;;
esac

case $clkstatus in 
        # 1) echo $(LC_TIME=en_GB.UTF-8 date +'%H:%M') ;;
        1) echo $(LC_TIME=en_GB.UTF-8 date +'%H:%M') ;;
        -1) echo $(LC_TIME=en_GB.UTF-8 date +'%m/%d %a %H:%M') ;;
esac
