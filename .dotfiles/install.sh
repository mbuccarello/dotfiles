#!/bin/bash

DOTFILES="$HOME/.dotfiles"

ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.k9s"
ln -sf "$DOTFILES/k9s/skin.yml" "$HOME/.k9s/skin.yml"

echo "Dotfiles linked."
