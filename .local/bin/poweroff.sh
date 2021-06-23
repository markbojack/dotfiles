#!/bin/sh
push-all
[[ $(pgrep -x qutebrowser) ]] && qutebrowser ":quit --save"
poweroff
