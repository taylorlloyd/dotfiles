# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate --all --color'
alias gp='git push'

# Vi mode shell
set -o vi

# Source local overrides
if [ -a ~/.bashrc.local ]
    then
        . ~/.bashrc.local
fi
