#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


HISTFILESIZE=10000
HISTSIZE=10000
PS1='[\u@\h \W]\$ '


# append to the history file, don't overwrite it
shopt -s histappend

# Additionnal auto completion

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Aliases

alias vi='vim'
alias pingg='ping google.fr'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias l='ls -lA'
alias newssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias showip="ip addr show | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias lemeilleursmiley='echo "¯\_(ツ)_/¯"'
alias youtube-player='mpsyt'
alias youtube-dl-ogg='youtube-dl -x -i --no-post-overwrites --audio-format vorbis'

alias english='LC_ALL=C'
alias french='LC_ALL=fr_FR.utf-8'

alias fixff='find ~/.mozilla/firefox/ -type f -name pluginreg.dat -exec rm -i {} \;'

#alias ix="curl -s -F 'f:1=<-' ix.io"

# ssh Aliases
source ~/.ssh/sessions

#eval "$(thefuck --alias)"

# vim helpers
alias sudovimdiff='VISUAL=vimdiff sudoedit'
alias sudovim='VISUAL=vim sudoedit'

alias dfcfg='/usr/bin/git --git-dir=/home/purgator/.dfcfg/ --work-tree=/home/purgator'
