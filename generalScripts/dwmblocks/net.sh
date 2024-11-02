

#!/usr/bin/env bash
# dwmblocks/net.sh

case $(nmcli d show wlp0s20f3 | grep GENERAL.CONNECTION: | awk '{ print $2 }') in
  --)
    echo "󰤭 "
    ;;
  *)
    echo "󰤨  "$(nmcli d show wlp0s20f3 | grep GENERAL.CONNECTION: | awk '{ print $2 }')
    ;;
esac
