$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'b13f688bb8ee7ebf9a28609cf2a0e5330f3ab60e8289774748f469b2a9288a85'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
