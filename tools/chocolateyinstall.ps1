$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'afd1d4b867e60c65a92f91d447a59e011ffd215fa553cbad0712ad55bc24e9dc'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
