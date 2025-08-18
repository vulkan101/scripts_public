
# Set the path to the directory containing the .nupkg files
$sourceDirectory = "C:\xr_dev\dotnetFork\runtime\artifacts\packages\Debug\Shipping"
$destinationRoot = "C:\xr_dev\dotnetFork\runtime\artifacts\packages\Debug\Shipping\Extracted"

# Set the version number to match
$versionNumber = "10.0.0-dev"

# Ensure the destination directory exists
if (-not (Test-Path -Path $destinationRoot)) {
    New-Item -ItemType Directory -Path $destinationRoot | Out-Null
}

# Iterate over each .nupkg file
Get-ChildItem -Path $sourceDirectory -Filter *.nupkg | ForEach-Object {
    $nupkgFile = $_.FullName
    $fileName = $_.Name
    $baseName = $_.BaseName

    # Check if the file name contains the specified version number
    if ($fileName -like "*$versionNumber*") {
        $packageName = $baseName -replace "\.$versionNumber$", ""
        $destinationPath = Join-Path -Path $destinationRoot -ChildPath $packageName
        $versionPath = Join-Path -Path $destinationPath -ChildPath $versionNumber

        # Create destination directory
        if (-not (Test-Path -Path $versionPath)) {
            New-Item -ItemType Directory -Path $versionPath | Out-Null
        }

        # Copy and rename the .nupkg to .zip
        $tempZip = Join-Path -Path $env:TEMP -ChildPath "$baseName.zip"
        Copy-Item -Path $nupkgFile -Destination $tempZip -Force

        # Extract the .zip file
        Expand-Archive -Path $tempZip -DestinationPath $versionPath -Force

        # Clean up
        Remove-Item -Path $tempZip -Force

        Write-Host "Extracted $($_.Name) to $versionPath"
    }
}
