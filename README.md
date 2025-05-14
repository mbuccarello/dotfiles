
# macOS Dotfiles Setup

This guide covers setting up a macOS development environment with:

- Oh My Zsh
- iTerm2 with Nerd Font and theme support
- K9s with a custom skin
- Vim with plugin support via vim-plug

## Prerequisites

Install Xcode command line tools:

```bash
xcode-select --install
````

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```

## Install Packages

```bash
brew install podman-desktop
brew install zsh git vim k9s kind kubectl helm
brew install --cask iterm2
brew install zsh-autosuggestions zsh-syntax-highlighting
```

## Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Create Dotfiles Directory

```bash
mkdir -p ~/.dotfiles/k9s
cd ~/.dotfiles
touch .zshrc .vimrc install.sh
```

## Configure `.zshrc`

```zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias k="kubectl"
alias cls="clear"
export EDITOR="vim"
export K9S_SKIN="$HOME/.k9s/skin.yml"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## Install Meslo Nerd Font

Create a directory and download the font manually:

```bash
mkdir -p ~/Library/Fonts
cd ~/Library/Fonts

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
unzip Meslo.zip
rm Meslo.zip
```

In iTerm2, open Preferences, go to Profiles > Text, and set the font to `MesloLGS NF`.

## Configure iTerm2

* Open iTerm2
* Go to Preferences > Profiles > Text
* Set font to `MesloLGS NF`
* Optional: Import a color theme such as Dracula via Preferences > Profiles > Colors

## Configure K9s Skin

File: `~/.dotfiles/k9s/skin.yml`

```yaml
k9s:
  skin:
    background: default
    text: white
    highlight: blue
    border: gray
    header:
      fgColor: white
      bgColor: black
      logoColor: blue
```

## Configure Vim

File: `~/.dotfiles/.vimrc`

```vim
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'

call plug#end()

syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
```

Install vim-plug:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Launch Vim and run:

```vim
:PlugInstall
```

## Create Install Script

File: `~/.dotfiles/install.sh`

```bash
#!/bin/bash

DOTFILES="$HOME/.dotfiles"

ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.k9s"
ln -sf "$DOTFILES/k9s/skin.yml" "$HOME/.k9s/skin.yml"

echo "Dotfiles linked."
```

Make the script executable and run it:

```bash
chmod +x ~/.dotfiles/install.sh
~/.dotfiles/install.sh
```

## Finalize Configuration

Reload your shell configuration:

```bash
source ~/.zshrc
```

Open Vim and ensure plugins are installed:

```bash
vim +PlugInstall +qall
```