#!/bin/sh

[ -d $HOME/.local/share/Trash ] && rm -rf $HOME/.local/share/Trash/* && printf 'Trash emptied on nvm0n1\n'
[ -d /mnt/drive1/.Trash-1000 ] && rm -rf /mnt/drive1/.Trash-1000/* && printf 'Trash emptied on sda'
[ -d $HOME/.config/dmenufm/trash ] && rm -rf $HOME/.config/dmenufm/trash/* && printf 'Trash emptied from dmenufm'
