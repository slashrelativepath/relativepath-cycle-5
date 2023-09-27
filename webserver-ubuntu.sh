#!/bin/bash


echo "checking if Nano is installed"
if ( which nano )
then
  echo "Nano already installed"
else
  echo "Installing Nano"
  sudo apt install -y nano
fi

echo "Checking if Git is installed"
if ( which git )
then 
  echo "Git is installed"
else
  echo "Installing Git"
  sudo apt install -y git
fi


echo "Checking if Multipass is installed" 
if ( multipass version ) 
then
  echo "Multipass is installed" 
else 
   
  # the following should not be necessary on recent versions of Ubuntu
  # checking for snapd anyway
  if ( which snap )
  then 
    echo "snapd installed"
  else
    echo "installing snapd"
    sudo apt update && sudo apt install -y snapd
    
  fi

  echo "installing multipass"
  sudo snap install multipass
fi

# Thanks Chris Forti!
# changing the folder from ed25519 to .ed25519 as this makes it hidden (I think)
if [[ -f "./.ed25519" ]]
then
  echo "relativepath ssh key exists"
else
  echo "relativepath ssh key does not exist, creating..."
  ssh-keygen -f "./.ed25519" -t ed25519 -b 4096 -N ''
fi


if ( multipass info relativepath )
then
  echo "multipass instance already exists"
else
  echo "creating relativepath VM"
  multipass launch lts --name relativepath
fi