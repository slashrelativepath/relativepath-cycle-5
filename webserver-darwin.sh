#!/usr/bin/zsh

echo "brew should be installed"
if ( which brew )
then
  echo "brew already installed"
else
  echo "installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "git should be installed"
if ( which git )
then 
  echo "git already installed"
else 
  echo "installing git"
  brew install git
fi

echo "nano should be installed"
if ( which nano )
then
  echo "nano already installed"
else
  echo "installing nano"
  brew install nano 
fi
 echo "installing multipass on $(uname)"
  if [ "$(uname)" = "Darwin" ]
  echo "multipass already installed on $(uname)"
else
  brew install --cask multipass
fi
  echo "spinning up a virtual machine"
if ( multipass --version )
then
  echo "multipass already installed on $(uname)"
else
  echo "installing multipass on $(uname)"
  if [ "$(uname)" = "Darwin" ]
then
  brew install --cask multipass
fi
if ( multipass info relativepath | grep Running )
then 
  echo "relativepath vm is running"
else 
  echo "launching a ubuntu vm named relativepath"
  multipass launch --name relativepath
fi
