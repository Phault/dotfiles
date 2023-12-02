set windows-shell := ["powershell.exe", "-c"]

[private]
default:
  @just -f {{justfile()}} --list

[unix]
update:
  chezmoi update
  brew bundle --file ~/Brewfile
  brew upgrade

[windows]
update:
  chezmoi update
  winget upgrade --all
  scoop update
  scoop update *
