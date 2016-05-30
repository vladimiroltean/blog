setopt appendhistory autocd

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz colors && colors

GREEN_START="%{$fg_bold[green]%}"
BLUE_START="%{$fg_bold[blue]%}"
COLOR_END="%{$reset_color%}"
USER="$GREEN_START%n@%M$COLOR_END"
DIR="$BLUE_START%~$COLOR_END"
export PS1="[$USER $DIR] %# "

export PAGER=vimpager
export EDITOR=vim

zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VICMD_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    VIINS_PROMPT="%{$fg_bold[yellow]%} [% INSERT]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VICMD_PROMPT}/(main|viins)/$VIINS_PROMPT} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

if [ -f ~/build/bin ]; then
	export PATH=$HOME/build/bin:$PATH
fi

if [ -f ~/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
