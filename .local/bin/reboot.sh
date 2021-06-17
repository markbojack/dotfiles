#!/bin/sh
[[ $(pgrep -x qutebrowser) ]] && qutebrowser ":quit --save"
reboot
