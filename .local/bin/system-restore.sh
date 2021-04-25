#!/bin/sh

# PACKAGES ===================================================================
# Refresh mirror list
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu

# Since we just updated with -Syyu, we can omit 
# the best practice of installing with -Syu below

# NB
# - xsel gives Neovim the -clipboard feature such that set clipboard+=unnamedplus actually works
# - python-pynvim is essential to get R to work in Neovim
# - xclip is for sxiv copying and also is used for the git key
# - ripgrep is to replace the horrible, native Vimwiki search command
# - exiv2 is for img size in status bar for sxiv
# - hunspell-en_US mythes-en hyphen-en libmythes : these are for spellcheck
# - grabc yad sysstat xdotool are for i3blocks
# - tcllib is to get tkremind to work
# - sxiv is simple image viewer

# Now install a bunch of packages
# Do you need libreoffice-still ??? actually, MS Office online is pretty okay
sudo pacman -S --noconfirm neofetch timeshift brave neovim xsel r python-pynvim  \
fzf ripgrep flameshot bpytop galculator xclip stacer bleachbit gnome-disk-utility \
gimp sxiv exiv2 ttf-font-awesome nerd-fonts-noto-sans-mono nerd-fonts-roboto-mono \
nerd-fonts-terminus ttf-meslo-nerd-font-powerlevel10k ttf-nerd-fonts-symbols-mono \
hunspell-en_US mythes-en hyphen-en libmythes alacritty youtube-dl \
remind dmenu-manjaro i3-gaps i3status-manjaro feh i3blocks lxappearance \
materia-gtk-theme scrot sysstat xdotool ranger

# NB if spelling doesn't work then also install enchant-pure
pamac install --no-confirm ookla-speedtest-bin r-devel r-devtools tcllib \
pfetch grabc yad picom-jonaburg-git

# GIT STUFF ==================================================================
# Setup
git config --global user.email "markbojack.si@gmail.com"
git config --global user.name "markbojack"
git config --global init.defaultBranch main 
git config --global pull.rebase false

# Clone everything with SSH
git clone git@github.com:markbojack/p-dot-script.git
git clone git@github.com:markbojack/vimwiki.git
git clone git@github.com:markbojack/finwiki.git
git clone git@github.com:markbojack/copper-ingot.git
git clone git@github.com:markbojack/seasonality.git
git clone git@github.com:markbojack/tendril.git

mkdir ~/.local/bin # make .local/bin for scripts
rm .bashrc # Run rm .bashrc else Git returns an error on the first pull
# mv .bashrc ~/Desktop # Or just move it
# Pull all your dotfiles
git init --bare $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME remote add origin git@github.com:markbojack/dotfiles.git
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME pull origin main
