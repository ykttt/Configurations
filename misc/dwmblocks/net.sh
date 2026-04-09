#!/bin/sh

ntstatus=1

case $BLOCK_BUTTON in
        1) ntstatus=-$ntstatus ;;
esac


case $(nmcli d show wlp0s20f3 | grep GENERAL.CONNECTION: | awk '{ print $2 }') in
        --) echo "" ;;
        *)
                case $ntstatus in
                        1) echo "󰤨" ;;
                        -1) echo $(nmcli d show wlp0s20f3 | grep GENERAL.CONNECTION: | awk '{ print $2 }')"   󰤨" ;;
                esac ;;
esac
