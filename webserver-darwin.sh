#!/bin/bash

# Install homebrew
  echo "brew should be installed"
if ( which brew )
then
  echo "brew already installed"
else
  echo "installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
if [ "$(uname)" = "Darwin" ]
then
  echo "multipass already installed on $(uname)"
else
  echo "installing multipass on $(uname)"  
  brew install --cask multipass
fi

# ssh keys
if [ -f "./ed25519" ]
then
  echo "relativepath ssh key exists"
else
  echo "relativepath ssh key does not exist, creating..."
  ssh-keygen -f "./ed25519" -t ed25519 -b 4096 -N ''
fi

if ( multipass info relativepath | grep Running )
then 
  echo "relativepath vm is running"
else 
  echo "launching a ubuntu vm named relativepath"
  multipass launch --name relativepath
fi
