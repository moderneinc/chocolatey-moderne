$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version  = $env:ChocolateyPackageVersion

$url = "https://repo1.maven.org/maven2/io/moderne/moderne-cli/$version/moderne-cli-$version-modw.cmd"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $url -OutFile "$toolsDir\modw.cmd"

# Create mod.cmd forwarder
Set-Content -Path "$toolsDir\mod.cmd" -Value "@echo off`r`n`"%~dp0modw.cmd`" %*"

# Trigger AOT cache creation — temporarily relax ErrorActionPreference because
# modw.cmd writes progress/status to stderr, and PowerShell 5.1 promotes native
# command stderr to a terminating error even with 2>$null when EAP is Stop.
$ErrorActionPreference = 'SilentlyContinue'
& "$toolsDir\mod.cmd" --version
$modExitCode = $LASTEXITCODE
$ErrorActionPreference = 'Stop'
if ($modExitCode -ne 0) {
    throw "mod.cmd --version failed with exit code $modExitCode"
}
