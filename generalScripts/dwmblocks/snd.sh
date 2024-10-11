#!/bin/sh
case $(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $4 }') in
        on)
                echo " "$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')
                ;;
        off)
                echo " "$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')
                ;;
esac
