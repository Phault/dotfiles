$ErrorActionPreference = 'Stop'

# Reload the $env object from the registry
function Refresh-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Test-CommandAvailable {
    param (
        [Parameter(Mandatory = $True, Position = 0)]
        [String] $Command
    )
    return [Boolean](Get-Command $Command -ErrorAction SilentlyContinue)
}

function Install-Scoop {
    if (Test-CommandAvailable 'scoop') {
        Write-Host "Scoop is already installed, skipping..."
    } else {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1"))
    }
}

function Setup-Windows {
    Write-Host "Installing dependencies..."
    winget install Git.Git --silent --accept-package-agreements --no-upgrade --override "/VerySilent /NoRestart /Components=""icons,assoc,assoc_sh,gitlfs"""
    winget install twpayne.chezmoi --silent --accept-package-agreements --no-upgrade

    # we need scoop for age encryption unfortunately
    # scoop installer looks for git in path
    Refresh-Environment
    Install-Scoop

    # no need to refresh enviroment, as the installer adds it to the current session
    scoop bucket add extras
    scoop install age

    # uncertain if necessary for chezmoi to see age, but added just in case
    Refresh-Environment

    Write-Host "Setting up chezmoi..."
    chezmoi init phault/dotfiles --apply
    . $profile

    Write-Host "Configuring Windows..."
    . "${env:UserProfile}/scripts/configure_windows.ps1"

    Write-Host "Installing apps..."
    . "${env:UserProfile}/scripts/install_apps.ps1"

    Write-Host "Setup complete."

    # for good measure
    Refresh-Environment
}

Setup-Windows
