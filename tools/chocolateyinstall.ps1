$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version  = $env:ChocolateyPackageVersion

$url = "https://repo1.maven.org/maven2/io/moderne/moderne-cli/$version/moderne-cli-$version-modw.cmd"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $url -OutFile "$toolsDir\modw.cmd"

# Create mod.cmd forwarder
Set-Content -Path "$toolsDir\mod.cmd" -Value "@echo off`r`n`"%~dp0modw.cmd`" %*"

# Trigger AOT cache creation
& "$toolsDir\mod.cmd" --version
