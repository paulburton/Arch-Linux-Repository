#!/bin/bash

. /etc/rc.d/functions

case "$1" in
  set)
    stat_busy "Setting Ubuntu theme"
    gconftool-2 --load /usr/share/ubuntu/ubuntu-theme.xml
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  unset)
    stat_busy "Unsetting Ubuntu theme"
    gconftool-2 --unload /usr/share/ubuntu/ubuntu-theme.xml
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {set|unset}"
esac
exit 0

