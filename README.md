# dotfiles
System Configuration (vim, tmux, zsh(oh-my-zsh)) for a Mac

## Setup
1. Setup `oh-my-zsh` using
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
2. Install the powerline10k theme for zsh
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
3. Install `hack-nerd-font`
```bash
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```
4. Also make sure you have `tmux`, `vim` installed
```bash
brew install vim tmux
```
5. Clone this repo into ~/.config/
```bash
git clone https://github.com/uditnbansal/dotfiles.git $HOME/.config/dotfiles
```
6. Create symlinks to point to the files in the dotfiles repo
```bash
DOTFILES=$HOME/.config/dotfiles
cd $HOME
ln -s {$DOTFILES/,.}vim
ln -s {.vim/,.}vimrc
ln -s {$DOTFILES/tmux/,.}tmux.conf
ln -s {$DOTFILES/shell/,.}zshrc
ln -s {$DOTFILES/,.}gitconfig
```
