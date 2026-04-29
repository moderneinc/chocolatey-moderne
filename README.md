# chocolatey-moderne

Chocolatey package definitions for [Moderne](https://moderne.io/) tools.

## Install the Moderne CLI

From an elevated PowerShell or `cmd` prompt:

```powershell
choco install mod --prerelease
```

The `--prerelease` flag is required because the `mod` package is published as a pre-release.

To install a specific version:

```powershell
choco install mod --version 4.2.1 --prerelease
```

To upgrade to the latest version:

```powershell
choco upgrade mod --prerelease
```

After installation, verify with:

```powershell
mod --version
```

See the [Moderne CLI installation guide](https://docs.moderne.io/user-documentation/moderne-cli/getting-started/cli-intro/?os=windows#installation-and-configuration) for full instructions.
