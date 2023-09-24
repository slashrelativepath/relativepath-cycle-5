#!/bin/bash


echo "checking if Nano is installed"
if ( which nano )
then
  echo "Nano already installed"
else
  echo "Installing Nano"
  apt install -y nano
fi

echo "Checking if Git is installed"
if ( which git )
then 
  echo "Git is installed"
else
  echo "Installing Git"
  apt install -y git
fi


echo "Checking if Multipass is installed" 
if ( multipass version ) 
then
  echo "Multipass is installed" 
else 
  echo "Installing Multipass" 
  # the following should not be necessary on recent versions of Ubuntu
  # checking for snapd anyway
  if ( which snap )
  then 
    echo "snapd installed"
  else
    echo "installing snapd"
    sudo apt update && sudo apt install -y snapd
    # restarts shell
    exec bash
  fi
    # systemctl status snapd.service
    echo "installing multipass"
    sudo snap install multipass
fi
