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

  checksum       = '4e9b07083f072754415c72368e30ac378c894bcb99bcba016c80f13c42909319'
  checksumType   = 'sha256'  # or 'sha1' if that's what you're using
}

Install-ChocolateyPackage @packageArgs
