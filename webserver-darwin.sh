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
# Launch Relativepath instance
if ( multipass list | grep relativepath | grep Running > /dev/null )
then 
  echo -e "\n==== Relativepath VM present ====\n"
else 
  echo -e "\n==== Creating Relativepath VM ====\n"
  multipass launch --name relativepath --cloud-init cloud-init.yaml
fi
# Launch Relativepath instance
if ( multipass list | grep relativepath | grep Running > /dev/null )
then 
  echo -e "\n==== Relativepath VM present ====\n"
else 
  echo -e "\n==== Creating Relativepath VM ====\n"
  multipass launch --name relativepath --cloud-init cloud-init.yaml
fi
 Launch Relativepath instance
if ( multipass list | grep relativepath | grep Running > /dev/null )
then 
  echo -e "\n==== Relativepath VM present ====\n"
else 
  echo -e "\n==== Creating Relativepath VM ====\n"
  multipass launch --name relativepath --cloud-init cloud-init.yaml
fi
if ( multipass list | grep relativepath | grep Running > /dev/null )
then 
  echo -e "\n==== Relativepath VM present ====\n"
else 
  echo -e "\n==== Creating Relativepath VM ====\n"
fi
if ( multipass list | grep relativepath | grep Running > /dev/null )
then 
  echo -e "\n==== Relativepath VM present ====\n"
else 
  echo -e "\n==== Creating Relativepath VM ====\n"
  multipass launch --name relativepath 
fi

