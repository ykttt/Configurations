#!/bin/sh
case $(cat /sys/class/power_supply/BAT0/status) in
        Discharging)
                echo "󱟨 "$(cat /sys/class/power_supply/BAT0/capacity)%
                ;;
        "Not Charging")
                echo "󱠴 "$(cat /sys/class/power_supply/BAT0/capacity)%
                ;;
        Charging | Full)
                echo "󱟦 "$(cat /sys/class/power_supply/BAT0/capacity)%
                ;;
esac
