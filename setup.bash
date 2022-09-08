USER="ashwin"
HOME_DIR="/home/${USER}"

# Install stuff I like
echo "Installing programs"
sudo apt-get install tmux cargo feh wget

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
git clone https://github.com/niwhsa9/dwm.git
cd dwm
make all
sudo make install

# Fetch ST
cd ..
git clone https://github.com/niwhsa9/st.git
cd st
make all
sudo make install

# Fetch bar
cd ..
git clone https://github.com/niwhsa9/rsbar.git
cd rsbar
cargo build
cp target/debug/rsbar ~/.dwm/


# Neovim 
cd ..
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/

