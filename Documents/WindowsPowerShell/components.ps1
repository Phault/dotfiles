# These components will be loaded for all PowerShell instances

Push-Location (Join-Path (Split-Path -parent $profile) "components")

# From within the ./components directory...

. .\broot.ps1
. .\yazi.ps1
. .\just.ps1
. .\pj.ps1

# disabled due to poor performance :(
# . .\starship.ps1 

Pop-Location
