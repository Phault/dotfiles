# Profile for the Visual Studio Shell, only. (e.g. Package Manager Console)
# ===========

Push-Location (Split-Path -parent $profile)
"components-nuget" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }
Pop-Location

