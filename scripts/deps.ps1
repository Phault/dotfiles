param (
    # include personal dependencies
    [switch]$personal,

    # include work dependencies
    [switch]$work
)

# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);

    exit
}

$deps = @(
    # dependencies
    "Microsoft.VCRedist.2010.x86",
    "Microsoft.VCRedist.2010.x64",
    "Microsoft.VCRedist.2012.x86",
    "Microsoft.VCRedist.2012.x64",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.VCRedist.2013.x86",
    "Microsoft.VCRedist.2013.x64",
    @(, "Git.Git", "/VerySilent /NoRestart /Components=""icons,assoc,assoc_sh,gitlfs"""),

    # languages and framworks
    "Python.Python.3",
    "Microsoft.DotNet.SDK.7",
    "Volta.Volta",

    # apps
    "Mozilla.Firefox",
    "VivaldiTechnologies.Vivaldi",
    "7zip.7zip",
    "Microsoft.PowerToys",
    "SomePythonThings.WingetUIStore",
    "junegunn.fzf",
    "Dystroy.broot",
    "BurntSushi.ripgrep.MSVC",
    "Microsoft.WindowsTerminal",
    "voidtools.Everything",
    "Bitwarden.Bitwarden",
    "Obsidian.Obsidian",
    "WinSCP.WinSCP",
    "Notepad++.Notepad++"

    # dev tools
    "Microsoft.PowerShell",
    "PuTTY.PuTTY",
    "SublimeHQ.SublimeMerge",
    "Microsoft.VisualStudioCode",
    "Neovim.Neovim",
    "Amazon.AWSCLI",
    "Insomnia.Insomnia",
    "Docker.DockerDesktop",
    "Canonical.Ubuntu.2204"
)

if ($personal) {
    $deps += @(
        "Discord.Discord",
        "Parsec.Parsec",
        "qBittorrent.qBittorrent",
        "Oracle.VirtualBox",
        "SyncTrayzor.SyncTrayzor",

        # dev
        "Microsoft.VisualStudio.2022.Community",

        # gaming
        "Valve.Steam",
        "EpicGames.EpicGamesLauncher",
        "ElectronicArts.EADesktop",
        "FlawlessWidescreen.FlawlessWidescreen",

        # utilities
        "REALiX.HWiNFO",
        "WinDirStat.WinDirStat",
        "HandBrake.HandBrake"
    )
}

if ($work) {
    $deps += @(
        "Google.Chrome",
        "JetBrains.Rider",
        @(, "Microsoft.VisualStudio.2022.Professional", "--wait --quiet --norestart --nocache --addProductLang En-us --add Microsoft.VisualStudio.Workload.NetWeb"),
        "Microsoft.SQLServer.2022.Developer",
        "Microsoft.SQLServerManagementStudio",
        @(, "JetBrains.dotUltimate", "/SpecificProductNames=Rider;ReSharper;dotTrace;dotCover /Silent=True /VsVersion=17.0")
    )
}

$failedDeps = @()

foreach ($dep in $deps) {
    $id = If ($dep -is [array]) { $dep[0] } Else { $dep }

    if ($dep -is [array]) {
        $overrides = $dep[1]

        Write-Host "Installing $id with overrides: ""$overrides""..."
        winget install $id --silent --accept-package-agreements --accept-source-agreements --no-upgrade --overrides $overrides
    }
    else {
        Write-Host "Installing $id..."
        winget install $id --silent --accept-package-agreements --accept-source-agreements --no-upgrade
    }

    if (!$?) {
        $failedDeps += $id
    }
}

if ($failedDeps.Length -gt 0) {
    Write-Host "Some dependencies could not be installed: `r`n`t$($failedDeps -join "`r`n`t")."
}

Write-Host "Installing Zig.Zig..."
# Zig does not like the silent flag
winget install Zig.Zig 

Refresh-Environment
