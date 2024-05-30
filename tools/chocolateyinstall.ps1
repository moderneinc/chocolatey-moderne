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

  checksum      = 'bc0ca4b2ecfed3beb50d83d33239df521a6340adfadc93ad81e2ff137416ed81'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
