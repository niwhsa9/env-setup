USER="ashwin"
HOME_DIR="/home/${USER}"

# Install stuff I like
echo "Installing programs"
sudo apt-get install tmux cargo

# Install DWM deps
sudo apt-get install git build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm

# Move configs
echo "Moving configs"
cp .bashrc ~/
cp .tmux.conf ~/
mkdir ~/.dwm
cp autostart.sh ~/.dwm
cp background.jpg ~/.dwm

# Install dwm through apt to get login entry
echo "setting up DWM profile"
sudo apt-get install dwm
sudo cp /usr/share/xsessions/dwm.desktop{,.bak}
sudo apt-get purge dwm 
sudo mv /usr/share/xsessions/dwm.desktop{.bak,}

# Fetch DWM
echo "Installing DWM"
mkdir ${HOME_DIR}/source
cd ${HOME_DIR}/source
git clone git@github.com:niwhsa9/dwm.git 
cd dwm
make install

# Fetch ST
cd ..
git clone git@github.com:niwhsa9/st.git
cd st
sudo make install

# Fetch bar
cd ..
git clone git@github.com:niwhsa9/rsbar.git
cargo build

# Move autostart



# Neovim 
