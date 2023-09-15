
echo "Checking if Nano is installed"
if ( which nano )
then
  echo "Nano is installed"
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
  echo "Installing Multipass" 
  git clone https://aur.archlinux.org/snapd.git
  cd snapd
  makepkg -si
  cd ..
  sudo systemctl enable --now snapd.socket
  sudo ln -s /var/lib/snapd /snap
  sudo snap install multipass
fi
