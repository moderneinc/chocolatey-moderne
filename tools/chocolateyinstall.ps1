$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = '2b6f04d07395835ec06352cd7b94b19273390fbcd4a61aba667c8ba48ec6725c'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
