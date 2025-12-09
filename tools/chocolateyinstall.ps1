$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = 'ea12d52bd66a7ace56c76b62e08fd9a1f14fee9175d740f5e90c03fea3932bfa'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
