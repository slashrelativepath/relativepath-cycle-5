Write-Output "Checking dependencies"

# install chocolatey if choco.exe is not present
if (-not (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Chocolatey"
    # ensure that you are using an administrative shell - a non-admin installation exists
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# install git if git.exe is not installed
if (-not (Get-Command -Name git.exe -ErrorAction SilentlyContinue)) {
    Write-Output  "Installing Git"
    choco install git.install
}

# install Nano if nano.exe is not installed
if (-not (Get-Command -Name nano.exe -ErrorAction SilentlyContinue)) {
    Write-Output  "Installing Nano"
    choco install nano
}

# might need to handle using Hyper-V or Virtualbox instead of the below
# install VirtualBox if .exe is not installed
if (Get-Command -Name VirtualBox.exe -ErrorAction SilentlyContinue) {
    Write-Output  "Installing Virtualbox"
    # choco install virtualbox
}

# install Multipass if .exe is not installed
if (-not (Get-Command -Name multipass.exe -ErrorAction SilentlyContinue)) {
    Write-Output  "Installing Multipass"
    choco install multipass
}

# initialize or start Ubuntu VM
if ( -not (multipass info --all) ){
    Write-Output "Launching Ubuntu LTS"
    multipass launch lts --name relativepath5
}
else {
    multipass start relativepath5
}

