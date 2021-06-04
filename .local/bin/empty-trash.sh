#!/bin/sh

[ -d $HOME/.local/share/Trash ] && rm -rf $HOME/.local/share/Trash/* && printf 'Trash Emptied'
