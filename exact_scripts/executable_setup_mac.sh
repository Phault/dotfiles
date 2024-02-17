#!/usr/bin/env bash

set -e
cd "$HOME"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
brew install age
brew install chezmoi

echo "Setting up chezmoi..."
chezmoi init phault/dotfiles --apply

echo "Installing applications..."
brew bundle

echo "Installing fonts..."
curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip >/tmp/JetBrainsMono.zip &&
	unzip -o /tmp/JetBrainsMono.zip -d "$HOME/Library/Fonts" "*.ttf" &&
	rm /tmp/JetBrainsMono.zip

cd ~/.proto
proto use

echo "Installing global npm packages..."
proto install-global npm prettier
proto install-global npm stylelint
proto install-global npm dockerfile-language-server-nodejs

echo "Installing grip (markdown previewer) via pip..."
pip install grip

echo "Installing global dotnet tools..."
# will fail if already installed
set +e
dotnet tool install -g csharpier
set -e

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
