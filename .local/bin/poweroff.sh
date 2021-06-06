#!/bin/sh

~/.local/bin/push-all

isRunning="$(pgrep -x qutebrowser | wc -l)"
if [ "$isRunning" -ne 0 ]; then
	qutebrowser ":quit --save"
fi

poweroff
