param (
    
    [string]$SourceRoot="C:\xr_dev\dotnetFork32\runtime\artifacts\packages\Debug\Shipping\Extracted",   
    [string]$TargetRoot="C:\xr_dev\dotnetSDK32\packs",   
    [string]$SourceVersion="10.0.0-dev",   
    [string]$TargetVersion="10.0.0-preview.4.25258.110"
)

# Get all directories under the source root that match the source version
$sourceDirs = Get-ChildItem -Path $SourceRoot -Directory -Recurse | Where-Object {
    $_.FullName -like "*\$SourceVersion\*"
}

foreach ($dir in $sourceDirs) {
    # Find all DLLs in this directory
    $dlls = Get-ChildItem -Path $dir.FullName -Filter *.dll -Recurse -File

    foreach ($dll in $dlls) {
        # Get the full path relative to the source version directory
        $relativePath = $dll.FullName.Substring($dll.FullName.IndexOf($SourceVersion) + $SourceVersion.Length + 1)

        # Get the package name (e.g., Microsoft.NET.Runtime.WebAssembly.Sdk)
        $packageName = $dll.FullName.Substring($SourceRoot.Length).Split('\')[1]

        # Build the target base path
        $targetBase = Join-Path -Path $TargetRoot -ChildPath "$packageName\$TargetVersion"

        # Combine with the relative path
        $targetFile = Join-Path -Path $targetBase -ChildPath $relativePath

        # Get the directory part of the target file
        $targetDir = Split-Path -Path $targetFile -Parent

        # Check if the directory exists
        if (-not (Test-Path -Path $targetDir)) {
            Write-Warning "Target directory does not exist: $targetDir. Skipping file: $($dll.FullName)"
            continue
        }

        # Copy the DLL
        Copy-Item -Path $dll.FullName -Destination $targetFile -Force
        Write-Host "Copied $($dll.FullName) to $targetFile"
    }
}
