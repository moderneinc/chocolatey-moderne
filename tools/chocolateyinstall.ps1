$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://pkgs.dev.azure.com/moderneinc/moderne_public/_packaging/moderne/maven/v1/io/moderne/moderne-cli-windows/$version/moderne-cli-windows-$version"

  checksum      = '17C2CAD554876B5AA4458197904D25C0485D0FACD9E6404F58A8CB3EF4081E93'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
