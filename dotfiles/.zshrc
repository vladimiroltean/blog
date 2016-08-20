setopt appendhistory autocd

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz colors && colors

GREEN="%{$fg_bold[green]%}"
BLUE="%{$fg_bold[blue]%}"
COLOR_END="%{$reset_color%}"
USER="$GREEN%n@%M$COLOR_END"
DIR="$BLUE%~$COLOR_END"
export PS1="[$USER $DIR] %# "

export PAGER=vimpager
export EDITOR=vim

#zstyle ':completion:*' menu select
#bindkey '^[[Z' reverse-menu-complete

bindkey -e
#bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^R' history-incremental-search-forward
# key bindings
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "e[5~" beginning-of-history
bindkey "e[6~" end-of-history
bindkey "e[3~" delete-char
bindkey "e[2~" quoted-insert
bindkey "e[5C" forward-word
bindkey "eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "e[8~" end-of-line
bindkey "e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "eOH" beginning-of-line
bindkey "eOF" end-of-line
# for freebsd console
bindkey "e[H" beginning-of-line
bindkey "e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix


function zle-line-init zle-keymap-select {
    VICMD_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    VIINS_PROMPT="%{$fg_bold[yellow]%} [% INSERT]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VICMD_PROMPT}/(main|viins)/$VIINS_PROMPT} $EPS1"
    zle reset-prompt
}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

if [ -f ~/build/bin ]; then
	export PATH=$HOME/build/bin:$PATH
fi

if [ -f ~/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
