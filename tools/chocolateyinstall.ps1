$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = '781d1def7a351d3e7feeeb6dad63d71c4940794ee9d5d2ca8ca8d770f23e908f'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
