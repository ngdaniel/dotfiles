# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/bin/:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/default-java:$HOME/scripts"
export PANEL_FIFO="/tmp/panel-fifo"
export PANEL_HEIGHT=24
export PANEL_FONT="-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*"
export PANEL_WM_NAME="bspwm_panel"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim
export BROWSER=chromium
export PAGER=less

export _JAVA_AWT_WM_NONREPARTENTING=1

export JAVA_HOME="/usr/lib/jvm/default-java"

export PYTHONSTARTUP=~/.pythonrc

# append to the history file, don't overwrite it
shopt -s histappend

export HISTSIZE=1000000
export HISTFILESIZE=1000000

history(){
  syncHistory
  builtin history "$@"
}

syncHistory(){
  builtin history -a
  HISTFILESIZE=$HISTFILESIZE
  builtin history -c
  builtin history -r
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#PS1="\[\e[0;32m\]\H \[\e[0;34m\][ \[\e[1;31m\]\w\[\e[0;34m\] ]\[\e[0;33m\] \$\[\e[0m\] "
PS1="\u@\h [\w] \$ "

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

promptCommand(){
  if [ "$TERM" = rxvt-unicode ]
  then case "$DISPLAY" in
       :*)  printf "\033]0;%s\007"                     "$PWD" ;;
       *)   printf "\033]0;%s -- %s\007" "$HOST_UPPER" "$PWD" ;;
       esac
  fi
  syncHistory
}

HOST_UPPER=`echo $HOSTNAME | tr '[a-z]' '[A-Z]'`
PROMPT_COMMAND=promptCommand
