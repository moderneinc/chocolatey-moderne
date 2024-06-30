$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]
if ($env:ChocolateyPackageVersion -like "*-beta") {
    $branch = "staging"
} else {
    $branch = "moderne"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://pkgs.dev.azure.com/moderneinc/moderne_public/_packaging/$branch/maven/v1/io/moderne/moderne-cli-windows/$version/moderne-cli-windows-$version"

  checksum      = '4a0dc3c7880436734fca552a0ed60fee9619ee493ee4285e8497ac5e330d8537'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
