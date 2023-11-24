$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://pkgs.dev.azure.com/moderneinc/moderne_public/_packaging/moderne/maven/v1/io/moderne/moderne-cli-windows/$version/moderne-cli-windows-$version"

  checksum      = 'D075B9E6D56B9E2398B57CB4D43AEF27D4256D2957CC0D9B264A62580920C8E0'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
