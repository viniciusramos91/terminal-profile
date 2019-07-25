# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User Alias
alias ls="ls -al --color=auto"
alias c="clear"
alias ..="cd ..;ls"
alias dev='cd ~/Development;ls'
alias py='python3'
alias pip='pip3'
alias activate='source venv/bin/activate'

# Alias's to modified commands
alias cp='cp -i'            # -i interactive
alias mv='mv -i'            # -i interactive
alias rm='rm -iv'           # -iv interactive and verbose    
alias mkdir='mkdir -p'      # -p make parent directories
alias ps='ps auxf'           
alias ping='ping -c 10'
alias less='less -R'
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'
alias f="find . | grep "    # Search files in the current folder
alias untar='tar -xvf'      # tar .tar.gz files

# Git aliases
alias gl='git log --oneline --decorate --graph --all'
alias gs='git status'

# Searches for text in all files in the current folder
ftext () {
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

# Show current network information
netinfo () {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    echo ""
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    echo ""
    /sbin/ifconfig | awk /'inet addr/ {print $4}'

    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo "---------------------------------------------------"
}

# Custom Prompt
parseGitBranch() {
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

# CLICOLOR
export CLICOLOR=1

# LSCOLORS
export LSCOLORS=exBxhxDxfxhxhxhxhxcxcx

# PS1 Colors
export PS1="$PURPLE[$YELLOW\u@\h$PURPLE] $DARK_BLUE(\w)$YELLOW\$(parseGitBranch) $WHITE$ \[$(tput sgr0)\]"

# Grep: enable color; show line number; recursive search
export GREP_OPTIONS='--color=auto --line-number --recursive'

# Grep set color
export GREP_COLOR='1;32'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
