$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = '949565ec6edc80b9f22232601eb03ef0e0bf5dc487d1e24abdd7bb6e3ba91024'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
