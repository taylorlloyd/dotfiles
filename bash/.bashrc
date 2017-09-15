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

alias ssh='autossh'

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

# Powerline-style shell
function _update_ps1() {
    PS1="$(~/git/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
