$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'ac21589fcbbb6c0f9e764f53bf1cf7abf0e6fd68bf579789f57e9e993e23e2ca'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
