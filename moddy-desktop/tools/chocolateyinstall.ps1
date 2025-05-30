$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$version = "v$env:ChocolateyPackageVersion".Split("-")[0].TrimStart("v")
$filename = "moddy-$version-setup.exe"
$url = "https://moddy-desktop.s3.us-east-1.amazonaws.com/releases/$version/$filename"
$installer = Join-Path $toolsDir $filename

$packageArgs = @{
  packageName    = 'moddy-desktop'
  fileType       = 'exe'
  url            = $url
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Moddy Desktop*'

  checksum =       '3d2d1200cb4630e083cd28a63ea57d0f839eba07a60474693f9631d3f8cd8aa0'
  checksumType   = 'sha256'  # or 'sha1' if that's what you're using
}

Install-ChocolateyPackage @packageArgs
