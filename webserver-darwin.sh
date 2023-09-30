#!/bin/bash

# Install homebrew
  echo "brew should be installed"
if ( which brew )
then
  echo "brew already installed"
else
  echo "installing brew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install git
  echo "git should be installed"
if ( which git )
then 
  echo "git already installed"
else 
  echo "installing git"
  brew install git
fi

#install nano
  echo "nano should be installed"
if ( which nano )
then
  echo "nano already installed"
else
  echo "installing nano"
  brew install nano 
fi

# Install multipass
  echo "installing multipass on $(uname)"
if  ( which multipass )
then
  echo "multipass already installed on $(uname)"
else
  echo "installing multipass on $(uname)"  
  brew install --cask multipass
  sleep 5
fi

# ssh keys
if [ -f "./ed25519" ]
then
  echo "relativepath ssh key exists"
else
  echo "relativepath ssh key does not exist, creating..."
  ssh-keygen -f "./ed25519" -t ed25519 -b 4096 -N ''
fi

# Create cloud-init.yaml
if [ -f cloud-init.yaml ] 
then
  echo -e "\n==== Cloud-init.yaml present ====\n"
else
  echo -e "\n==== Creating cloud-init.yaml ====\n"
  cat <<- EOF > cloud-init.yaml
users:
  - default
  - name: $USER
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - $(cat id_ed25519.pub)
EOF
fi

# Spinning up an ubuntu vm
if ( multipass info relativepath | grep Running )
then 
  echo "relativepath vm is running"
else 
  echo "launching a ubuntu vm named relativepath"
  multipass launch --name relativepath
fi
