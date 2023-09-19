
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
  if ( [ ! -d snapd ] ) 
  then 
    git clone https://aur.archlinux.org/snapd.git
  else
    echo "snapd directory already exists"
    read -p "Do you wish to use existing directory? (yes/no) " yn
    case $yn in
      yes | y ) echo Using existing directory...;;
      no | n ) echo Exiting...;
        exit;;
      * ) echo Invalid input;
        exit 1;;
    esac
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
