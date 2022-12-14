USER="ashwin"
HOME_DIR="/home/${USER}"

# Install stuff I like
echo "Installing programs"
sudo apt-get install tmux cargo feh wget python3-pip libdbus-1-dev pkg-config curl fonts-font-awesome clangd ripgrep

# Install DWM deps
sudo apt-get install git build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm

# Move configs
echo "Moving configs"
cp .bashrc ~/
cp .tmux.conf ~/
mkdir ~/.dwm
cp autostart.sh ~/.dwm
cp background.jpg ~/.dwm
cp -r nvim ~/.config/
cp -r polybar ~/.config/
cp -r i3 ~/.config/

# Install dwm through apt to get login entry
echo "setting up DWM profile"
sudo apt-get install dwm
sudo cp /usr/share/xsessions/dwm.desktop{,.bak}
sudo apt-get purge dwm 
sudo mv /usr/share/xsessions/dwm.desktop{.bak,}

# Install I3 gaps
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps

# Install polybar deps
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

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

# Fetch polybar
cd ..
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j8
sudo make install

# Neovim 
cd ..
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install pyright
