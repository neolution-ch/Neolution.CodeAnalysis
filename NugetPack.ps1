$nugetPath = ".\NuGet.exe"

if (-not (Test-Path $nugetPath)) {
    Write-Output "NuGet executable not found. Downloading..."
    Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile $nugetPath
}

$date = Get-Date -format "yyyy.M.d"
$time = Get-Date -format "HHmmss"
$versionString = $date + "-beta" + $time
Write-Output "Version: $versionString"

Get-ChildItem -Include *.nuspec, *.props -Recurse | ForEach-Object {
    (Get-Content $_.FullName) -replace '{{NuGetVersion}}', $versionString |
        Set-Content $_.FullName
}

.\NuGet.exe pack Neolution.CodeAnalysis.nuspec -OutputDirectory .\bin\packages
.\NuGet.exe pack Neolution.CodeAnalysis.TestsRuleset.nuspec -OutputDirectory .\bin\packages

Get-ChildItem -Include *.nuspec, *.props -Recurse | ForEach-Object {
    (Get-Content $_.FullName) -replace $versionString, '{{NuGetVersion}}' |
        Set-Content $_.FullName
}

# Wait for user input before closing the window
Read-Host -Prompt "Press Enter to exit"
