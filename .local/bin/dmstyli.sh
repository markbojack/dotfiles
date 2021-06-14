#!/bin/bash

while [ -z "$query" ]; do
    query=$(echo "" | dmenu -h 18 -fn "Roboto Mono Nerd Font-8" -p 'Enter search query:') "$@" || exit
done

~/.local/bin/styli.sh -p -s $query 

