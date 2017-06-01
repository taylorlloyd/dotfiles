# .bashrc

# Launch tmux if not started
if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t "$USER"
  tmux new-session -s "$USER"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias g='git'
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

# provide 'open' a la OSX
open() {
    xdg-open $1 > /dev/null 2> /dev/null &
}

# 256 color support
[ -z "$TMUX" ] && export TERM=xterm-256color

