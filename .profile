# Aliases
alias ls='clear;ls -al --color=auto'
alias ..='cd ..;ls'
alias c='clear'
alias dev='cd ~/Development;ls'
alias py='python3'
alias pip='pip3'
alias activate='source venv/bin/activate'

# Git aliases
alias gl='git log --oneline --decorate --graph --all'
alias gs='git status'

# Custom Prompt
 parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 }

# PS1 Colors
BLUE='\[\033[1;34m\]'
WHITE='\[\033[1;37m\]'
GRAY='\[\033[0;37m\]'
DARK_GRAY='\[\033[0;30m\]'
DARK_BLUE='\[\033[1;30m\]'
CYAN='\[\033[0;36m\]'
PURPLE='\[\033[0;35m\]'
GREEN='\[\033[0;32m\]'
RED='\[\033[0;31m\]'
YELLOW='\[\033[0;33m\]'
PINK='\[\033[1;35m\]'
export CLICOLOR=1
export LSCOLORS=exBxhxDxfxhxhxhxhxcxcx
export PS1="$PURPLE[$YELLOW\d$PURPLE]$GREEN[\u$WHITE@$GREEN\h] $BLUE(\W)$YELLOW\$(parse_git_branch) $WHITE$ \[$(tput sgr0)\]"

# grep: enable color; exclude .svn directory; show line number; recursive search
export GREP_OPTIONS='--color=auto --exclude-dir=.svn --line-number --recursive'

# grep set color
export GREP_COLOR='1;32'
