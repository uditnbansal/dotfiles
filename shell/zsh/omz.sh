# Path to your oh-my-zsh installation.
export ZSH="${ZSH_CONFIG_DIR}/ohmyzsh"

# OMZ configuration
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTFILE="$HOME/.cache/history"
ZSH_COMPDUMP="$HOME/.cache/zcompdump"
plugins=(tmux git brew docker httpie npm man python rsync virtualenv fzf)

# Load file
source ${ZSH}/oh-my-zsh.sh
