# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias getserial='ls /dev/tty* > _secret_log1 && echo Add/Remove device and then press any key && read && ls /dev/tty* > _secret_log2 && diff _secret_log1 _secret_log2 && rm _secret_log1 _secret_log2'
alias getdevice='ls /dev/* > /tmp/.log1 && echo Add/Remove device and then press any key && read && ls /dev/* > /tmp/.log2 && diff /tmp/.log1 /tmp/.log2'
alias pls='sudo $(history -p \!\!)'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

vdiscover() {
	# demo video:	http://www.youtube.com/watch?v=X0KPl5O006M
	# usage: 	vdiscover <search>
	# example:	vdiscover man vs wild
	# OR operator:	vdiscover 'man vs wild (mkv|avi)'
	# $ ending in:	vdiscover 'man vs wild (mkv|avi)$'
	# 		vdiscover '(naruto|shingeki) (mkv|avi)$'
	# 		vdiscover naruto shippudden mkv$

	# to quit vim quickly use: shift + zz or u can always use the :q / :q! method

	# escape spaces, pipe and parentheses
        keyword=$(echo "$@" |  sed -e 's/ /.*/g' -e 's:|:\\|:g' -e 's:(:\\(:g' -e 's:):\\):g')
	locate -ir "$keyword" | vim -R -
}

