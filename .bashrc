#░░░░░░░░░░░░░░░░░█▀▄░█▀█░█▀▀░█░█░█▀▄░█▀▀░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░░░░█▀▄░█▀█░▀▀█░█▀█░█▀▄░█░░░░░░░░░░░░░░░░
#░░░░░░░░░░░░░░▀░░▀▀░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░░░░░░░░░░░░

# don't forget that dope ex fun
# DEFAULT MANJARO ============================================================
[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# STARTUP ====================================================================
echo "Terminal opened on:" `date` >> ~/terminal.log
#	colorscript -r
#	pfetch
#	neofetch
#	paleofetch
motivate | cowsay -f $(ls /usr/share/cows/|shuf -n 1) | lolcat
#	fortune | cowsay -f $(ls /usr/share/cows/|shuf -n 1) | lolcat
#	misfortune | cowsay -f $(ls /usr/share/cows/|shuf -n 1) | lolcat
#	cowfortune
xset r rate 220 100 # faster keys 
setxkbmap -option caps:swapescape #to make caps escape
# setxkbmap -option caps:super -variant altgr-intl 		# make caps super...
# killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' # ...but when press only once treat it as esc
# xmodmap -e 'keycode 135 = Super_R' 					# and map menu button to right super
xset s off				# screensaver off
xset -dpms				# suspend/standby off
# xet q 				# shows current settings
# xset s 900			# screensaver turns on after 15min
# xset dpms 0 0 1200	# monitor off after 20min, first 0 is standby disable, second 0 is suspend disable

# SOURCE =====================================================================
source ~/.local/bin/fancy-bash-prompt.sh
source /home/mark/.config/broot/launcher/bash/br

# EXPORTS ====================================================================
export BROWSER="/usr/bin/qutebrowser"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERMINAL="alacritty"
export MANPAGER="nvim -c 'set ft=man' -"
export PATH=$HOME/p-dot-script:$HOME/.emacs.d:$PATH
export HISTSIZE=1000
export HISTFILESIZE=1000
export AUTOFEATURE=true

# PACKAGE OPTIONS
export FZF_DEFAULT_COMMAND="find -L"
export GREP_OPTIONS='--color=auto'

# ALIASES ====================================================================
	# BASIC COMMANDS
		alias cp="cp -i"
		alias mv='mv -i'
		alias rm='rm -iv'
		alias tt='gio trash' # to trash
		alias ls='lsd --color always --group-dirs first'
		alias ll='lsd -lah --color always --group-dirs first'
		alias lt='lsd --tree --color always'
		alias find='fd -H'
		alias fd='fd -H'
		alias fzf='fzf -e'
		alias cal='cal -m'
		alias cat='bat'
		alias grep='grep -i'
	# CONFIGS
		# Qutebrowser
			alias qq='nvim ~/.config/qutebrowser/quickmarks'
			alias qb='nvim ~/.config/qutebrowser/bookmarks/urls'
			alias qpy='nvim ~/.config/qutebrowser/config.py'
			alias qa='nvim ~/.config/qutebrowser/autoconfig.yml'
			alias hp='nvim ~/p-dot-script/qutebrowser/html/homepage.html'
		# Misc
			alias brc='nvim ~/.bashrc'
			alias vrc='nvim ~/.config/nvim/init.vim'
			alias gtk2='nvim ~/.gtkrc-2.0'
			alias gtk3='nvim ~/.config/gtk-3.0/settings.ini'
			alias i3c='nvim ~/.config/i3/config'
			alias i3s='nvim ~/.config/i3status/i3status.conf'
			alias i3b='nvim ~/.config/i3blocks/i3blocks.conf'
			alias ac='nvim ~/.config/alacritty/alacritty.yml'
			alias pcc='nvim ~/.config/picom/picom.conf'
			alias xrc='nvim ~/.Xresources'
			alias sc='nvim ~/.config/i3-scrot.conf'
			alias mrc='nvim ~/.config/mutt/muttrc'
			alias sr='nvim ~/p-dot-script/system-restore.sh'
			alias srr='nvim ~/p-dot-script/README.md'
			alias pa='nvim ~/.local/bin/push-all'
			alias mpvc='nvim ~/.config/mpv/input.conf'
			alias grubc='sudo nvim /etc/default/grub'
			alias bkpc='nvim ~/.local/bin/backup-phone.sh'
			alias pbc='nvim ~/.config/polybar/config'
			alias pic1='nvim ~/.config/sxiv/exec/image-info'
			alias pic2='nvim ~/.config/sxiv/exec/key-handler'
	# DOOM EMACS
		alias doom='~/.emacs.d/bin/doom'
	# FONT PREVIEW
		alias ff='fc-list : family'
		alias fp='fontpreview'
		export FONTPREVIEW_FONT_SIZE=10
		export FONTPREVIEW_BG_COLOR="black"
		export FONTPREVIEW_FG_COLOR="white"
		export FONTPREVIEW_PREVIEW_TEXT="The quick brown fox jumps over the lazy dog."
	# GIT
		alias gs="git status"
		alias ga="git add"
		alias gb="git branch"
		alias gca="git commit -a"
		alias gcm="git commit -m"
		alias gpush="git push -u origin main"
		alias gpull="git pull -u origin main"
		alias gc="git checkout"
		alias gd="git diff"
		alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
		alias gi='git init'
		alias gpa='~/.local/bin/push-all'
	# GPG
		alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify" 			# verify signature for isos
		alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys" 	# receive the key of a developer
	# PACKAGES
		alias tu='sudo timeshift --create && yay -Syu --noconfirm'
		alias unlock='sudo rm /var/lib/pacman/db.lck'    	# remove pacman lock
		alias cleanup='sudo pacman -Rns (pacman -Qtdq)'	  	# remove orphaned packages
	# REMIND
		alias rem='nvim ~/p-dot-script/remind.rem'
		alias ra='remind -@ ~/p-dot-script/remind.rem'
		alias raw='remind -@ ~/p-dot-script/remind.rem *7'
		alias rc='remind -clm@ ~/p-dot-script/remind.rem'
		alias rc2='remind -cl2m@ ~/p-dot-script/remind.rem'
		alias rw='remind -cl+2m@ ~/p-dot-script/remind.rem'
	# SHELL TOGGLE
		alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
		alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
	# SYSTEM ADMIN
		# get top process eating memory
		alias psmem='ps auxf | sort -nr -k 4'
		alias psmem10='ps auxf | sort -nr -k 4 | head -10'
		# get top process eating cpu ##
		alias pscpu='ps auxf | sort -nr -k 3'
		alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
	# VIM SESSIONS
		alias vc='nvim -S ~/.vim/sessions/copper-ingot.vim -c NERDTree ~/copper-ingot'
		alias vs='nvim -S ~/.vim/sessions/seasonality.vim -c NERDTree ~/seasonality'
	# YOUTUBE
		alias ytv='youtube-viewer'
		alias yt='youtube-dl'
		alias ytp='youtube-dl https://youtube.com/playlist?list=PLrbbUMGM2tEj3PbprusLpVP4gKCYoIDuc'
		alias yta-aac="youtube-dl --extract-audio --audio-format aac "
		alias yta-best="youtube-dl --extract-audio --audio-format best "
		alias yta-flac="youtube-dl --extract-audio --audio-format flac "
		alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
		alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
		alias yta-opus="youtube-dl --extract-audio --audio-format opus "
		alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
		alias yta-wav="youtube-dl --extract-audio --audio-format wav "
		alias ytv-best="youtube-dl -f bestvideo+bestaudio "
	# MISC
		alias v='nvim'
		alias vw='nvim -c VimwikiIndex'
		alias pic='show-pic.sh'
		alias pow='poweroff.sh'
		alias bkp='backup-phone.sh'
		alias R='R --vanilla -q'
		alias pdf='qpdfview'
		alias w='curl wttr.in'
		alias trash='empty-trash.sh'
		alias ss='cd ~/.local/bin'
		alias news="newsboat"
		alias pp='pastel pick'
		alias nm='neomutt'
		alias writer='lowriter'
		alias calc='localc'
