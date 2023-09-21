#!/bin/bash


echo "checking if Nano is installed"
if ( which nano )
then
  echo "Nano already installed"
else
  echo "Installing Nano"
  sudo apt install nano
fi

echo "Checking if Git is installed"
if ( which git )
then 
  echo "Git is installed"
else
  echo "Installing Git"
  sudo apt install git
fi

echo "Checking if Multipass is installed" 
if ( multipass version ) 
then
  echo "Multipass is installed" 
else 
  echo "Installing Multipass" 
  git clone https://aur.archlinux.org/snapd.git
  cd snapd
  makepkg -si
  cd ..
  sudo systemctl enable --now snapd.socket
  sudo ln -s /var/lib/snapd /snap
  sudo snap install multipass
fi
