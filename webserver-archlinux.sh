
echo "checking if Nano is installed"
if ( which nano )
then
  echo "Nano already installed"
else
  echo "Installing Nano"
  sudo pacman -S nano
fi

echo "Checking if Git is installed"
if ( which git )
then 
  echo "Git is installed"
else
  echo "Installing Git"
  sudo pacman -S git
fi

echo "Checking if Multipass is installed" 
if ( multipass version ) 
then
  echo "Multipass is installed" 
else 
  echo "Installing Multipass..." 
  if  [ -d snapd ]  
  then 
    echo "snapd directory exists"
  else
    echo "cloning snapd"
    git clone https://aur.archlinux.org/snapd.git
  fi

  if ( [ -d snapd ] )
  then 
    pushd snapd && makepkg -si && popd
  fi

  if ( which systemctl )
  then 
    sudo systemctl disable --now snapd.socket && sudo systemctl enable --now snapd.socket
  fi

  if ( [ -d /var/lib/snapd ] && [ -d /snap ] )
  then
    sudo ln -s /var/lib/snapd /snap
  fi

  if ( snap version )
  then
    echo "Waiting for processes..." && sleep 15 
    sudo snap install multipass
    sudo snap install multipass
  fi

  if ( multipass version )
  then
    echo "Multipass is installed"
  else
    echo "Multipass failed to install"
  fi
fi
