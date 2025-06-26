$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$version = "v$env:ChocolateyPackageVersion".Split("-")[0].TrimStart("v")
$filename = "moddy-$version-setup.exe"
$url = "https://moddy-desktop.s3.us-east-1.amazonaws.com/releases/$filename"
$installer = Join-Path $toolsDir $filename

$packageArgs = @{
  packageName    = 'moddy-desktop'
  fileType       = 'exe'
  url            = $url
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Moddy Desktop*'

  checksum =       'b2a0dedfe04427475e06df2c0cbe2adeb7777ed6eed29ef9848a24a4fa61d789'
  checksumType   = 'sha256'  # or 'sha1' if that's what you're using
}

Install-ChocolateyPackage @packageArgs
