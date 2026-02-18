$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'ab07de90fd23d0fce7c3cb0cf63038e7722eb4cde2e1a59729a7dd68d72ee5ba'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
