#!/bin/sh

batstatus=1

case $BLOCK_BUTTON in
        1) batstatus=-$batstatus ;;
esac

case $batstatus in
        1) battext="" ;;
        -1) battext=$(cat /sys/class/power_supply/BAT0/capacity)"% " ;;
esac

case $(cat /sys/class/power_supply/BAT0/status) in
        Discharging)
                echo $battext"󱟨" ;;
        "Not Charging")
                echo $battext"󱠴" ;;
        Charging | Full)
                echo $battext"󱟦" ;;
esac
