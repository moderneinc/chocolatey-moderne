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

  checksum =       '5b9b07b073adab8596dab5dbe1a2dbfecc00745bef700d3e3055f187e9e612a5'
  checksumType   = 'sha256'  # or 'sha1' if that's what you're using
}

Install-ChocolateyPackage @packageArgs
