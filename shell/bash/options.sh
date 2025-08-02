#!/usr/bin/env bash

# vim mode
set -o vi

bind '\C-w:unix-filename-rubout'

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s nocaseglob
shopt -s nocasematch

stty werase undef

# change default creation mode
umask 007
