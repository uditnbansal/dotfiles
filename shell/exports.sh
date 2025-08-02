# Global navigation variables
export CONFIG="$HOME/.config"
export WORK="${WORK:-$HOME}"
export LEARN="$WORK/learn"
export PROJECTS="$WORK/projects"
export SCRATCH="$WORK/scratch"
export SCRIPTS="$WORK/scripts"

# Setting global variables required elsewhere
export ACTIVATE="./env/bin/activate"
export CTAGS_EXCLUDE="--exclude=static --exclude=.git --exclude=node_modules --exclude='*.bundle.js' --exclude='*.min.js' --exclude='*.pyc' --exclude=__pycache__"
export CTAGS_LANG="--languages=HTML,Python,Sh,JavaScript"
export EDITOR='vim'
export INPUTRC="$DOTFILES/shell/inputrc"
export KEYTIMEOUT=1
export LESSHISTFILE=/dev/null # don't create a .lesshst file in $HOME
export PATH=$PATH:/usr/local/sbin:$PROJECTS:$SCRIPTS:~/.local/bin/
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export RELEASE_DIR=$HOME
export TERM="xterm-256color"

# Setting locale params
export LANG='en_US.UTF-8'
export LC_ALL=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_COLLATE=$LANG
export LC_MONETARY=$LANG
export LC_MESSAGES=$LANG
export LC_PAPER=$LANG
export LC_NAME=$LANG
export LC_ADDRESS=$LANG
export LC_TELEPHONE=$LANG
export LC_MEASUREMENT=$LANG
export LC_IDENTIFICATION=$LANG

# Shorthand navigation
alias dotfiles="cd $DOTFILES"
alias scratch="cd $SCRATCH"
alias scripts="cd $SCRIPTS"
alias work="cd $WORK"
alias projects="cd $PROJECTS"
alias learn="cd $LEARN"

# Shorthand
alias ..='cd ..'
alias activate='source $ACTIVATE'
alias g="git"
alias gssh="gcloud compute ssh"
alias ipy3="ipython3"
alias ipy="ipython"
alias l1="ls -1"
alias l="ls -ltrG"
alias la="ls -a"
alias less='less -iSR'
alias lr="ls -ltr"
alias ls="ls --color=auto -G"
alias p3="python3"
alias p="python"
alias pod="popd"
alias pud="pushd"
alias rm="rm -i"
alias sc="sync_code"
alias sl="ls -ltra"
alias t="tmux"
alias v="nvim"
alias venv="python -m venv"
alias vi="nvim"
alias vim="nvim"
alias w="which"
