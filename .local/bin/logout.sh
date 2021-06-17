#!/bin/sh
[[ $(pgrep -x qutebrowser) ]] && qutebrowser ":quit --save"
for manager in "${MANAGERS[@]}"; do 
	killall "${manager}" || output "Process ${manager} was not running."
done
