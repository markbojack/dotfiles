#!/bin/sh

isRunning="$(pgrep -x qutebrowser | wc -l)"
if [ "$isRunning" -ne 0 ]; then
	qutebrowser ":quit --save"
fi

isRunning="$(pgrep -x brave | wc -l)"
if [ "$isRunning" -ne 0 ]; then
	killall brave
fi

poweroff
