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

  checksum =       '4e5abd89177cdcfaaf0d4df2441ddd876e8da703ced7fc1efcd6bdb3b6e7e0bc'
  checksumType   = 'sha256'  # or 'sha1' if that's what you're using
}

Install-ChocolateyPackage @packageArgs
