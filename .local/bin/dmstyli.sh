#!/bin/bash

while [ -z "$query" ]; do
    query=$(echo -e "bright\ncolor\ndark\nforest\ngray\ngrey\nlight\nlinux\nsun" | dmenu -h 18 -fn "Roboto Mono Nerd Font-8" -p 'Search wallpapers:') "$@" || exit
done

~/.local/bin/styli.sh -s $query 
