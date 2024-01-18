$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "v$env:ChocolateyPackageVersion".split("-")[0]
if ($env:ChocolateyPackageVersion -contains "-beta") {
    $branch = "staging"
} else {
    $branch = "moderne"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$toolsDir\\mod.exe"
  url           = "https://pkgs.dev.azure.com/moderneinc/moderne_public/_packaging/$branch/maven/v1/io/moderne/moderne-cli-windows/$version/moderne-cli-windows-$version"

  checksum      = '90a47a38f2f748d2914f7c17255bf20edc616be73b00dd2c191f9f9d0f527dc6'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
