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

  checksum      = '153cc48fea8f9c10ebbe2f2880f8b7b90143602a05baf27a2876a3ffb8b7be57'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
