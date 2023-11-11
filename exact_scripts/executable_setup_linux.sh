#!/usr/bin/env bash

set -e

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cd "$HOME"
echo "Installing applications..."
/opt/homebrew/bin/brew bundle

echo "Setting up chezmoi..."
/opt/homebrew/bin/chezmoi init phault/dotfiles --apply

echo "Installing fonts..."
mkdir -p "$HOME/.fonts"
curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip > /tmp/JetBrainsMono.zip && \
    unzip /tmp/JetBrainsMono.zip -d "$HOME/.fonts" "*.ttf" && \
    rm /tmp/JetBrainsMono.zip


echo "Setup complete."
