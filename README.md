# Relative Path Cycle 5

A repository for relativepath-cycle-5

## Create a WebServer

Create virtual machine, utillizing Ubuntu 22.04


## Usage

On a mac, run this:

`zsh webserver-darwin.sh`

on linux run this:

`bash webserver-linux.sh`

on windows run this:

`Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = 
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex 
((New-Object 
System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`

