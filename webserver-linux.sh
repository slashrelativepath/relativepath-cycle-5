echo "checking if nano is installed"
which nano
echo "the exit code is $?"

echo " checking if git is isntalled"
if ( which git )
then 
echo "git is installed"
else
echo "installing git"
sudo apt install -y git
fi

