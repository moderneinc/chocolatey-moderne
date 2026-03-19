$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://github.com/moderneinc/moderne-cli-releases/releases/download/$version/moderne-cli-windows.exe"

  checksum      = '204e8f8af21dcd8d7f35c06e7dadc9eb0b7c3c2e96b2dd4ad265b9d597b79052'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
