#!/usr/bin/env bash

#################### starship ####################
# https://starship.rs/

eval "$(starship init bash)"


#################### zoxide ####################

eval "$(zoxide init bash)"


#################### fzf ####################

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
  cd) fzf --preview 'tree -C {} | head -200' "$@" ;;
  export | unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
  ssh) fzf --preview 'dig {}' "$@" ;;
  *) fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

eval "$(fzf --bash)"

source ${BASH_CONFIG_DIR}/fzf-git.sh


#################### git-completion ####################

[ -f ${BASH_CONFIG_DIR}/git-completion.sh ] && . ${BASH_CONFIG_DIR}/git-completion.sh


#################### nvm ####################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
