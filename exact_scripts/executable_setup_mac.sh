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
curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip > /tmp/JetBrainsMono.zip && \
    unzip /tmp/JetBrainsMono.zip -d "$HOME/Library/Fonts" "*.ttf" && \
    rm /tmp/JetBrainsMono.zip

# untested, PATH might not be up-to-date to run this
echo "Installing Node.js..."
volta install node@lts
volta install npm@latest

echo "Installing global npm packages..."
npm i -g prettier
npm i -g stylelint
npm i -g dockerfile-language-server-nodejs

echo "Installing grip (markdown previewer) via pip..."
pip install grip

echo "Installing global dotnet tools..."
dotnet tool install -g csharpier

echo "Installing global Go modules..."
go install github.com/jessfraz/dockfmt@latest
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/stamblerre/gocode@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest

echo "Setup complete."
