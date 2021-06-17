#!/bin/sh
~/.local/bin/push-all
[[ $(pgrep -x qutebrowser) ]] && qutebrowser ":quit --save"
poweroff
