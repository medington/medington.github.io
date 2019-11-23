#!/usr/bin/env bash
### medington's simple .bashrc

# Don't do any of this setup if this not an interactive shell
[[ -z "$PS1" ]] && return

# Source the default bashrc, because apparently we are supposed to...
source_file /etc/bashrc

# Setup prompt
declare -x PS1="\n\d \t \$(myip) \$(gbr)\n[ \[\e[36m\]\u@\h\[\e[0m\] \[\e[01m\]\w\[\e[0m\] ]"
declare -x SUDO_PS1="[ \u@\h:\w ]"

# Essential aliases
alias ll='ls -al'
alias u='cd ..'
alias md='mkdir'

# This HISTSTART makes this block of code idempotent (no dup "shell started" msg)
if [[ -z ${HISTSTART} ]]; then
  # Setup uber complete history data
  shopt -s histappend
  unset HISTFILESIZE
  declare -x HISTSIZE=50000
  declare -x HISTCONTROL=ignorespace
  declare -x HISTTIMEFORMAT="%m-%d %T - "
  declare -x HISTSTART=$(date)
  declare -x CURUSER=${SUDO_USER:-$USER}
  histchars='!^#'
  set -o history
  history -s "# Shell started: ${HISTSTART} by ${CURUSER}"
fi

