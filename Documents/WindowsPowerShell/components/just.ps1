$justFiles = Get-ChildItem -Path "$env:USERPROFILE/tasks" -Filter *.just

foreach ($file in $justFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    Invoke-Expression "
      function $baseName {
        & just --justfile $($file.FullName) --working-directory . @args
      }
    "
}
