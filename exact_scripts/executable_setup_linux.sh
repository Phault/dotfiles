#!/usr/bin/env bash

set -e
cd "$HOME"

echo "Installing deps from apt..."
# hard req on apt :(
sudo apt update
sudo apt install -y dotnet-sdk-7.0 build-essential emacs

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
mkdir -p "$HOME/.fonts"
curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip >/tmp/JetBrainsMono.zip &&
	unzip --overwrite /tmp/JetBrainsMono.zip -d "$HOME/.fonts" "*.ttf" &&
	rm /tmp/JetBrainsMono.zip

# TODO: unnecessarily duplicated in setup_emacs.sh
echo "Installing Node.js..."
volta install node@lts
volta install npm@latest

echo "Installing global npm packages..."
npm i -g prettier
npm i -g stylelint
npm i -g dockerfile-language-server-nodejs

echo "Installing grip (markdown previewer) via pip..."
python3 -m ensurepip
pip3 install grip

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
