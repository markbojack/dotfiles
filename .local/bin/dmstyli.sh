#!/bin/bash

while [ -z "$query" ]; do
    query=$(echo -e "dark\nlinux" | dmenu -h 18 -fn "Roboto Mono Nerd Font-8" -p 'Enter search query:') "$@" || exit
done

~/.local/bin/styli.sh -s $query 
