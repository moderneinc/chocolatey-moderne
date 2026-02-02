$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = '1174fbbfcd5ff2b97f3fb13cd4b918ae363542ba74fea6a0b8ae913bae4d75e4'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
