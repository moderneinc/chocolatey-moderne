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

  checksum      = 'eb3dfa88ceedb2b406ee1e57b99c1a3af814b06920c0f3eb6083d31728cdd366'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
