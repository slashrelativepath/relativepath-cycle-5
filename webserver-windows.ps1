Write-Output "Checking dependencies"

# install chocolatey if choco.exe is not present
if (Get-Command -Name choco.exe -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey Already Installed"
}
else {
    Write-Output "Installing Chocolatey"
    # ensure that you are using an administrative shell - a non-admin installation exists
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}


# install git if git.exe is not installed
if (Get-Command -Name git.exe -ErrorAction SilentlyContinue) {
    Write-Output "Git Already Installed"
}
else {
    Write-Output  "Installing Git"
    choco install -y git.install --params "'/GitAndUnixToolsOnPath /WindowsTerminal'"
}

# install Nano if nano.exe is not installed
if (Get-Command -Name nano.exe -ErrorAction SilentlyContinue) {
    Write-Output  "Installing Nano"
}
else {
    Write-Output  "Installing Nano"
    choco install -y nano
}


# install Multipass if .exe is not installed
if (Get-Command -Name multipass.exe -ErrorAction SilentlyContinue) {
    Write-Output "Multipass is here"
}
else {
    Write-Output  "Installing Multipass"
    # break virtualbox install out of this conditional
    choco install -y virtualbox --params "'/NoDesktopShortcut /ExtensionPack'"
    choco install -y multipass --force --params "'/HyperVisor:VirtualBox'"
}

# initialize or start Ubuntu VM
if ( multipass info relativepath ){
    Write-Output "The instance already exists"
}
else {
    Write-Output "Launching Ubuntu LTS"
    multipass launch lts --name relativepath
}


# Create ssh key pair if it does not exist for a given user
# gets env username : [Environment]::UserName
# gets user's home path: $env:USERPROFILE
$userName = [Environment]::UserName
if (Test-Path -Path "$env:USERPROFILE\.ssh\id_ed25519.pub" -PathType Leaf) {
    Write-Output "$userName has an existing ssh key"
}
else{
    Write-Output "Creating new SSH key pair for $userName"
    ssh-keygen -f "$env:USERPROFILE\.ssh\id_ed25519" -t ed25519 -b 4096 -N '""'
}
