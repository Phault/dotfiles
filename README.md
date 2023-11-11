## Setup

### Mac

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Phault/dotfiles/HEAD/exact_scripts/executable_setup_mac.sh)"
```

### Linux

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Phault/dotfiles/HEAD/exact_scripts/executable_setup_linux.sh)"
```

### Windows

```posh
Set-ExecutionPolicy Remote -Scope CurrentUser
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Phault/dotfiles/HEAD/exact_scripts/setup_windows.ps1'))
```
