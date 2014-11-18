# Update profile before installing any packages, in case they modify it.
Set-Content $profile @"
Set-Alias np notepad
Set-Alias clion "C:\Program Files (x86)\JetBrains\CLion 138.1965.18\bin\clion64.exe"
"@

# Install packages
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
#choco install git make cmake mingw 7zip ag diffmerge notepad2 python2 ruby wincommandpaste VisualStudioExpress2013WindowsDesktop poshgit git-credential-winstore ActivePerl
#choco install git make cmake mingw 7zip ag diffmerge notepad2 python2 ruby wincommandpaste VisualStudioExpress2013WindowsDesktop poshgit git-credential-winstore ActivePerl

# Clean up the environment
$vcpath = "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin"
[System.Collections.ArrayList]$path =
  [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine) -split ";"
if ($path -notcontains $vcpath) {
    [void]$path.Add($vcpath)
}
$gitpath = "C:\Program Files (x86)\Git\bin"
if ($path -contains $gitpath) {
    [void]$path.Remove($gitpath)
}
[Environment]::SetEnvironmentVariable("Path", $path -join ";", [System.EnvironmentVariableTarget]::Machine)

# Figure out how to set the keyboard to Dvorak

