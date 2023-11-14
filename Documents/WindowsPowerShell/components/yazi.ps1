function ya {
    $tempFile = New-TemporaryFile
    try {
        yazi --cwd-file="$tempFile" $args

        if ($LASTEXITCODE -ne 0) {
            Write-Error "yazi exited with code $LASTEXITCODE"
            return
        }
        $path = Get-Content $tempFile
        if ($path) {
            Set-Location -Path $path
        }
    } finally {
        Remove-Item -force $tempFile
    }
}
