#!/usr/bin/env bash

set -e
cd "$HOME"

echo "Installing deps from apt..."
# hard req on apt :(
sudo apt update
sudo apt install -y build-essential emacs

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
brew install age
brew install chezmoi

echo "Setting up chezmoi..."
chezmoi init phault/dotfiles --apply

echo "Installing applications..."
brew bundle

echo "Setting default shell to fish..."
if ! grep -q -F fish /etc/shells; then
	which fish | sudo tee -a /etc/shells
fi
chsh -s "$(which fish)"

echo "Installing fonts..."
mkdir -p "$HOME/.fonts"
curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip >/tmp/JetBrainsMono.zip &&
	unzip -o /tmp/JetBrainsMono.zip -d "$HOME/.fonts" "*.ttf" &&
	rm /tmp/JetBrainsMono.zip

# TODO: unnecessarily duplicated in setup_emacs.sh
proto use

echo "Installing global npm packages..."
proto install-global npm prettier
proto install-global npm stylelint
proto install-global npm dockerfile-language-server-nodejs

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
