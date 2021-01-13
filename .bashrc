#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH=/home/osman/.config/bspwn:$PATH
export PATH=/home/osman/.bin:$PATH
export PATH=/home/osman/.local/bin:$PATH
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export PROMPT_COMMAND='history -a; history -r'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
