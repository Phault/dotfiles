if (Get-Command "starship" -ErrorAction SilentlyContinue) {
  function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
      $ansi_escape = [char]27
      $provider_path = $current_location.ProviderPath -replace "\\", "/"
      $host.ui.Write($prompt)
      $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Basename
    }

    $host.ui.Write($args)
  }

  $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Basename
  Invoke-Expression (&starship init powershell)
}
