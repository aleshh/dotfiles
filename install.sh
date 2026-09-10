#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

if command -v brew >/dev/null 2>&1; then
    brew bundle --file="$DOTFILES/Brewfile"
fi
