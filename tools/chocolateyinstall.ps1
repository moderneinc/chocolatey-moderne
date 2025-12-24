$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'fbad3f7f90aa1a8f361da1d4a8a2dd0df174ace58f4f384ab9efd0b5d9ed9634'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
