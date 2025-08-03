# vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Saner history configuration - up arrow shows last command in current shell
setopt noincappendhistory
setopt nosharehistory

# zsh autocompletion map ^E to accept autocomplete
bindkey -M viins '^E' end-of-line
